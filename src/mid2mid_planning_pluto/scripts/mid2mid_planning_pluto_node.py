#!/venv/pluto/bin/python3
'''
  @file         mid2mid_planning_pluto_node.py
  @brief        mid2mid_planning_pluto ROS node
  @authors      Seungji Ryu (seungjiryu@hanyang.ac.kr)
'''
import os
import sys
import time
import configparser
import yaml
import threading
import gc

# Path setup (resolve symlinks for robustness)
_script_dir    = os.path.dirname(os.path.realpath(__file__))   # .../mid2mid_planning_pluto/scripts
_pkg_dir       = os.path.dirname(_script_dir)                  # .../mid2mid_planning_pluto
_project_root  = os.path.dirname(os.path.dirname(_pkg_dir))    # .../final-project-SeungjiRyu
_pluto_src_dir = os.path.join(_pkg_dir, "src")
sys.path.insert(0, _pluto_src_dir)

from pluto.pluto_algorithm import PlutoAlgorithm
from ros_bridge_python.ros_bridge_trajectories import UpdateRvizTrajectory

import rospy
import autohyu_msgs.msg as autohyu_msgs
from visualization_msgs.msg import MarkerArray

KPH2MPS = 1000.0 / 3600.0


class Mid2MidPlanningPlutoNode:
    def __init__(self, node_name, period):
        rospy.logwarn(f"[{node_name}] Initialize node (Period: {1/period:.1f} Hz)")

        rospy.init_node(node_name)
        self.node_name = node_name
        self.period    = period

        self.ini_path = os.path.join(_project_root, "config", "perception.ini")
        self.cfg = {"dt": 0.1}
        self._ProcessINI()

        self.model_config_path = os.path.join(_project_root, "config", "planning_ml.yaml")
        with open(self.model_config_path) as f:
            self.model_config = yaml.safe_load(f)

        pluto_cfg  = self.model_config.get("pluto", {})
        common_cfg = self.model_config.get("common", {})

        self.cfg["device"]          = common_cfg.get("device", "cuda:0")
        self.cfg["history_steps"]   = int(pluto_cfg.get("history_steps", 21))
        self.cfg["future_steps"]    = int(pluto_cfg.get("future_steps", 80))
        self.cfg["radius"]          = float(pluto_cfg.get("radius", 100.0))
        self.cfg["dim"]             = int(pluto_cfg.get("dim", 128))
        self.cfg["state_channel"]   = int(pluto_cfg.get("state_channel", 6))
        self.cfg["polygon_channel"] = int(pluto_cfg.get("polygon_channel", 6))
        self.cfg["history_channel"] = int(pluto_cfg.get("history_channel", 9))
        self.cfg["encoder_depth"]   = int(pluto_cfg.get("encoder_depth", 4))
        self.cfg["decoder_depth"]   = int(pluto_cfg.get("decoder_depth", 4))
        self.cfg["num_heads"]       = int(pluto_cfg.get("num_heads", 8))
        self.cfg["num_modes"]       = int(pluto_cfg.get("num_modes", 6))
        self.cfg["ref_free_traj"]   = bool(pluto_cfg.get("ref_free_traj", True))

        ckpt_path = os.path.join(_project_root, str(pluto_cfg.get("checkpoint_path", "")))

        self.s_planning_space_ = rospy.Subscriber(
            "app/pla/planning_space", autohyu_msgs.PlanningSpace,
            self._CallbackPlanningSpace, queue_size=1
        )
        self.i_planning_space_    = autohyu_msgs.PlanningSpace()
        self.b_is_planning_space_ = False
        self.mutex_               = threading.Lock()

        self.p_trajectory_      = rospy.Publisher(
            "app/pla/trajectory", autohyu_msgs.Trajectory, queue_size=10
        )
        self.p_rviz_trajectory_ = rospy.Publisher(
            "hmi/pla/trajectory_ml", MarkerArray, queue_size=10
        )

        self.algorithm = PlutoAlgorithm(cfg=self.cfg, checkpoint_path=ckpt_path)

        self.avg_inference_ms = 0.0
        self.inference_count  = 0

    def Terminate(self):
        self.s_planning_space_.unregister()
        self.p_trajectory_.unregister()
        self.p_rviz_trajectory_.unregister()

    def _CallbackPlanningSpace(self, msg):
        with self.mutex_:
            self.i_planning_space_    = msg
            self.b_is_planning_space_ = True

    def Run(self):
        rate = rospy.Rate(1.0 / self.period)

        while not rospy.is_shutdown():
            self._ProcessINI()
            self.algorithm.UpdateConfig(self.cfg)

            if not self.b_is_planning_space_:
                rospy.logerr_throttle(1.0, "Wait for Planning Space...")
                rate.sleep()
                continue

            with self.mutex_:
                planning_space = self.i_planning_space_

            t0 = time.time()
            tensor_data, meta = self.algorithm.RunPreprocess(planning_space)
            t1 = time.time()
            model_out         = self.algorithm.RunAlgorithm(tensor_data)
            t2 = time.time()
            o_traj, _         = self.algorithm.RunPostprocess(model_out, planning_space, meta)
            t3 = time.time()

            pre_ms  = (t1 - t0) * 1e3
            inf_ms  = (t2 - t1) * 1e3
            post_ms = (t3 - t2) * 1e3
            tot_ms  = (t3 - t0) * 1e3

            self.inference_count += 1
            self.avg_inference_ms = (
                self.avg_inference_ms * (self.inference_count - 1) + inf_ms
            ) / self.inference_count

            rospy.loginfo_throttle(5.0,
                f"[{self.node_name}] Pre: {pre_ms:.1f}ms | Infer: {inf_ms:.1f}ms | "
                f"Post: {post_ms:.1f}ms | Total: {tot_ms:.1f}ms | Avg: {self.avg_inference_ms:.1f}ms"
            )

            o_rviz = UpdateRvizTrajectory(o_traj, 0, 1, 0, 0.8)  # green for Pluto
            self.p_trajectory_.publish(o_traj)
            self.p_rviz_trajectory_.publish(o_rviz)

            gc.collect()
            rate.sleep()

    def _ProcessINI(self):
        try:
            cfg = configparser.ConfigParser(inline_comment_prefixes=(";", "#"))
            loaded = cfg.read(self.ini_path)
            if not loaded:
                raise FileNotFoundError(f"INI not found: {self.ini_path}")
            self.cfg["dt"] = cfg.getfloat("MotionPrediction", "dt", fallback=0.1)
        except Exception as e:
            rospy.logwarn_throttle(5.0, f"[{self.node_name}] Failed to parse INI: {e}")


if __name__ == "__main__":
    node_name = "mid2mid_planning_pluto"
    period    = rospy.get_param("task_period/period_mid2mid_planning_ml_node", 1.0)
    node      = Mid2MidPlanningPlutoNode(node_name, period)
    try:
        node.Run()
    finally:
        if node is not None:
            node.Terminate()
