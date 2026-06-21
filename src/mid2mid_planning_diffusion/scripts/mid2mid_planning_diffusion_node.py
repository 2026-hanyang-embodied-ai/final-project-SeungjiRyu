#!/venv/diffusion_planner/bin/python3
# mid2mid_planning_diffusion_node.py
'''
  @file         mid2mid_planning_diffusion_node.py
  @brief        mid2mid_planning_diffusion_node
  
  @authors      Seungji Ryu (seungjiryu@hanyang.ac.kr)

'''

# Import
import os
import sys

# Path setup (resolve symlinks for robustness)
_script_dir = os.path.dirname(os.path.realpath(__file__))       # .../src/mid2mid_planning_diffusion/scripts
_pkg_dir = os.path.dirname(_script_dir)                         # .../src/mid2mid_planning_diffusion
_project_root = os.path.dirname(os.path.dirname(_pkg_dir))      # .../final-project-SeungjiRyu
_diffusion_planner_dir = os.path.join(_pkg_dir, "src", "diffusion_planner")
sys.path.insert(0, _diffusion_planner_dir)

import time
import configparser
import yaml

# Set path
from diffusion_planner_algorithm import DiffusionPlanner
from ros_bridge_python.ros_bridge_objects import UpdateRvizPredictObjects
from ros_bridge_python.ros_bridge_trajectories import UpdateRvizTrajectory

# Import ROS
import rospy
import autohyu_msgs.msg as autohyu_msgs
from visualization_msgs.msg import MarkerArray
import threading
import gc

# Constants
KPH2MPS = 1000.0 / 3600.0

class Mid2MidPlanningDiffusionNode:
    def __init__(self, node_name, period):

        # Initialize
        rospy.logwarn(f"[{node_name}] Initialize node (Period: {1/period:.1f} Hz)")

        # Node init
        rospy.init_node(node_name)
        self.node_name = node_name
        self.period = period

        # INI init
        self.ini_path = os.path.join(_project_root, "config", "perception.ini")
        self.cfg = {'dt': 0.1}
        self.ProcessINI()

        # Model config init
        self.model_config_path = os.path.join(_project_root, "config", "planning_ml.yaml")
        with open(self.model_config_path, 'r') as f:
            self.model_config = yaml.safe_load(f)

        # Parameter init
        self.ProcessRosparam()

        # Subscriber init
        self.s_planning_space_ = rospy.Subscriber(
            "app/pla/planning_space", autohyu_msgs.PlanningSpace, self.CallbackPlanningSpace, queue_size=1
        )
        
        self.i_planning_space_ = autohyu_msgs.PlanningSpace()
        self.b_is_planning_space_ = False
        self.mutex_planning_space_ = threading.Lock()
        
        # Publisher init
        self.p_predict_objects_ = rospy.Publisher(
            "app/perc/predict_objects", autohyu_msgs.PredictObjects, queue_size=10
        )
        self.p_trajectory_ = rospy.Publisher(
            "app/pla/trajectory", autohyu_msgs.Trajectory, queue_size=10
        )
        
        self.p_rviz_predict_objects_ = rospy.Publisher(
            "hmi/perc/predict_objects", MarkerArray, queue_size=10
        )
        self.p_rviz_trajectory_ = rospy.Publisher(
            "hmi/pla/trajectory_ml", MarkerArray, queue_size=10
        )
        
        # Algorithm init
        diffusion_planner_config = self.model_config["diffusion_planner"]
        common_config = self.model_config.get("common", {})
        self.cfg["future_steps"] = int(diffusion_planner_config.get("future_steps", 80))
        self.cfg["device"] = common_config.get("device", "cuda:0")
        config_path = os.path.join(_project_root, diffusion_planner_config["config_path"])
        ckpt_path = os.path.join(
            _project_root,
            diffusion_planner_config["checkpoint_dir"],
            diffusion_planner_config["checkpoint_name"],
        )
        # Guidance config: collision + lane_keeping
        guidance_config = {
            "global_scale": diffusion_planner_config.get("guidance_scale", 0.5),
            "collision": {
                "enable": diffusion_planner_config.get("use_collision_guidance", False),
                "scale": 3.0,
            },
        }
        lk_cfg = diffusion_planner_config.get("lane_keeping", {})
        if lk_cfg:
            guidance_config["lane_keeping"] = lk_cfg

        self.alg_ml_prediction_ = DiffusionPlanner(
            cfg=self.cfg,
            config_path=config_path,
            ckpt_path=ckpt_path,
            guidance_config=guidance_config,
        )
                        
        # Performance monitoring
        self.avg_inference_time = 0.0
        self.inference_count = 0

    def Terminate(self):
        self.s_planning_space_.unregister()
        self.p_predict_objects_.unregister()
        # self.p_trajectory_.unregister()
        
        self.p_rviz_predict_objects_.unregister()
        # self.p_rviz_trajectory_.unregister()
        
    def CallbackPlanningSpace(self, msg):
        self.mutex_planning_space_.acquire()
        self.i_planning_space_ = msg
        self.b_is_planning_space_ = True
        self.mutex_planning_space_.release()

    # Main loop
    def Run(self):
        """
        main loop
        """
        rate = rospy.Rate(1.0 / self.period)

        while not rospy.is_shutdown():
            self.ProcessINI()
            self.alg_ml_prediction_.UpdateConfig(self.cfg)

            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            # Get subscribe variables
            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            if not self.b_is_planning_space_:
                rospy.logerr_throttle(1.0, "Wait for Planning Space...")
                rate.sleep()
                continue

            self.mutex_planning_space_.acquire()
            planning_space = self.i_planning_space_
            self.mutex_planning_space_.release()

            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            # Algorithm
            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            t_start = time.time()
            
            model_input, preprocess_data = self.alg_ml_prediction_.RunPreprocess(planning_space)
            t_preprocess = time.time()

            model_inference_output = self.alg_ml_prediction_.RunAlgorithm(model_input)
            t_predict = time.time()

            o_trajectory, o_predict_objects = self.alg_ml_prediction_.RunPostprocess(model_inference_output, planning_space, preprocess_data) 
            t_postprocess = time.time()
            
            # Performance logging
            total_ms     = (t_postprocess - t_start) * 1000
            preproc_ms   = (t_preprocess - t_start) * 1000
            predict_ms   = (t_predict - t_preprocess) * 1000
            postproc_ms  = (t_postprocess - t_predict) * 1000

            self.inference_count += 1
            self.avg_inference_time = (
                self.avg_inference_time * (self.inference_count - 1) + predict_ms
            ) / self.inference_count

            rospy.loginfo_throttle(5.0,
                f"[{self.node_name}] Pre: {preproc_ms:.1f}ms | "
                f"Predict: {predict_ms:.1f}ms | "
                f"Post: {postproc_ms:.1f}ms | "
                f"Total: {total_ms:.1f}ms | "
                f"Avg: {self.avg_inference_time:.1f}ms"
            )

            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            # Update output
            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            o_predict_objects_rviz = UpdateRvizPredictObjects(o_predict_objects, 150 * KPH2MPS)
            o_trajectory_rviz = UpdateRvizTrajectory(o_trajectory, 1, 0, 0, 0.8)

            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            # Publish
            # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
            # self.p_predict_objects_.publish(o_predict_objects)
            self.p_trajectory_.publish(o_trajectory)

            # self.p_rviz_predict_objects_.publish(o_predict_objects_rviz)
            self.p_rviz_trajectory_.publish(o_trajectory_rviz)

            gc.collect() 
            rate.sleep()


    # Configuration
    def ProcessRosparam(self):
        pass
        
    def ProcessINI(self):
        try:
            config = configparser.ConfigParser(
                inline_comment_prefixes=(';','#'))
            # config.read(self.ini_path)
            loaded = config.read(self.ini_path)
            if not loaded:
                raise FileNotFoundError(f"INI not found: {self.ini_path}")

            self.cfg['dt'] = config.getfloat(
                'MotionPrediction', 'dt', fallback=0.1)
        except Exception as e:
            rospy.logwarn_throttle(5.0, f"Failed to parse INI: {e}")


if __name__ == '__main__':
    node_name = "mid2mid_planning_diffusion"
    period = rospy.get_param("task_period/period_mid2mid_planning_ml_node", 1.0)
    node = Mid2MidPlanningDiffusionNode(node_name, period)

    try:
        node.Run()
    finally:
        if node is not None:
            node.Terminate()
