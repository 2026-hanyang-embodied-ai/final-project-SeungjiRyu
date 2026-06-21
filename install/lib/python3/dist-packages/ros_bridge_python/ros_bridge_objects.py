import math
import rospy
from std_msgs.msg import Header
from geometry_msgs.msg import Point, Pose, Quaternion
from visualization_msgs.msg import Marker, MarkerArray
import tf  # tf.transformations (ROS melodic/kinetic)

# import copy
import copy

# Bridge Header
from ros_bridge_python.ros_bridge_header import UpdateHeader

class ObjectDynamicState:
    UNKNOWN = 0
    STATIC = 1
    DYNAMIC = 2

def createQuaternionMsgFromYaw(yaw: float) -> Quaternion:
    """
    C++ tf::createQuaternionMsgFromYaw(yaw)와 동일한 기능을
    Python tf.transformations 를 통해 구현하는 예시.
    """
    q = Quaternion()
    q_xyzw = tf.transformations.quaternion_from_euler(0.0, 0.0, yaw)  # roll=0, pitch=0, yaw
    q.x = q_xyzw[0]
    q.y = q_xyzw[1]
    q.z = q_xyzw[2]
    q.w = q_xyzw[3]
    return q

def defaultQuaternion() -> Quaternion:
    q = Quaternion()
    q.x = 0.0
    q.y = 0.0
    q.z = 0.0
    q.w = 1.0
    return q

# def UpdateRvizPredictObjects(objects, max_speed: float) -> MarkerArray:
#     """
#     C++의
#       visualization_msgs::MarkerArray UpdateRvizPredictObjects(
#           const interface::PredictObjects& objects, const float& max_speed
#       )
#     함수를 Python으로 옮긴 예시.

#     objects: PredictObjects (Python 버전 가정)
#       - objects.header: Header
#       - objects.object: List of Object (각 Object가 id, dynamic_state, state[], reference[], dimension 등 보유)
#     max_speed: float
#     """

#     msg = MarkerArray()

#     id_position_marker = 0
#     id_reference_marker = 0

#     # objects.object를 순회
#     for obj in objects.object:
#         if len(obj.state) < 1:
#             continue

#         # --------------------
#         # 1) Track Info Marker (TEXT_VIEW_FACING)
#         # --------------------
#         track_info_marker = Marker()
#         track_info_marker.header = UpdateHeader(objects.header)
#         track_info_marker.ns = "track_info"
#         track_info_marker.id = obj.id  # 객체 ID를 그대로 사용
#         track_info_marker.action = Marker.ADD
#         track_info_marker.type = Marker.TEXT_VIEW_FACING
#         track_info_marker.lifetime = rospy.Duration(0.15)

#         # 글자 크기
#         track_info_marker.scale.z = 1.0

#         # 텍스트 색상: 흰색
#         track_info_marker.color.r = 1.0
#         track_info_marker.color.g = 1.0
#         track_info_marker.color.b = 1.0
#         track_info_marker.color.a = 1.0

#         # 첫 상태(state[0])로부터 속도, 가속도 계산
#         first_state = obj.state[0]
#         track_velocity = math.sqrt(first_state.vx**2 + first_state.vy**2)
#         # 로컬 가속도 (heading 방향으로의 가속도)
#         local_accel = first_state.ax * math.cos(first_state.yaw) + \
#                       first_state.ay * math.sin(first_state.yaw)

#         # 동적 상태 문자열
#         if obj.dynamic_state == ObjectDynamicState.STATIC:
#             dynamic_str = "STATIC"
#         elif obj.dynamic_state == ObjectDynamicState.DYNAMIC:
#             dynamic_str = "DYNAMIC"
#         else:
#             dynamic_str = "UNKNOWN"

#         # 속도, 가속도를 소수점 3자리로 표현
#         track_velocity_rounded = round(track_velocity, 3)
#         local_accel_rounded = round(local_accel, 3)

#         display_text = (
#             f"ID ({obj.id}) {dynamic_str}\n"
#             f"Vel:   {track_velocity_rounded} m/s\n"
#             f"Accel: {local_accel_rounded} m/s^2"
#         )

#         track_info_marker.text = display_text
#         track_info_marker.pose.position.x = first_state.x
#         track_info_marker.pose.position.y = first_state.y
#         track_info_marker.pose.position.z = 3.0

#         # Orientation (yaw)
#         # track_info_marker.pose.orientation = createQuaternionMsgFromYaw(first_state.yaw)
#         track_info_marker.pose.orientation = defaultQuaternion()

#         msg.markers.append(track_info_marker)

#         # --------------------
#         # 2) Position Marker (CUBE)
#         #    - Object의 모든 state에 대해 Marker 생성
#         # --------------------

#         # object.state를 순회, 각 시점(state)마다 하나씩 마커 생성
#         idx_state = 0
#         for st in obj.state:
#             position_marker = Marker()
#             position_marker.header = UpdateHeader(objects.header)
#             position_marker.ns = "position"
#             position_marker.id = id_position_marker
#             position_marker.action = Marker.ADD
#             position_marker.type = Marker.CUBE
#             position_marker.lifetime = rospy.Duration(0.15)

#             # 박스 크기
#             position_marker.scale.x = obj.dimension.length
#             position_marker.scale.y = obj.dimension.width
#             position_marker.scale.z = obj.dimension.height
#             iter_track_speed = math.sqrt(st.vx**2 + st.vy**2)
#             normalized_color = min(max_speed, iter_track_speed) / max_speed

#             # 색깔: R=1, G=(1 - 속도비), B=0
#             position_marker.color.r = 1.0
#             position_marker.color.g = 1.0 - normalized_color
#             position_marker.color.b = 0.0
#             # position_marker.color.a = 0.5
#             # alpha는 (개수가 많은 뒤쪽일수록 조금 투명) + 0.1
#             position_marker.color.a = 0.1 * (len(obj.state) - idx_state) / float(len(obj.state)) + 0.1
#             # if idx_state == 0:
#             #     # 첫 번째 state는 alpha를 좀 더 크게
#             #     position_marker.color.a = 0.4

#             # 위치
#             position_marker.pose.position.x = st.x
#             position_marker.pose.position.y = st.y
#             position_marker.pose.position.z = obj.dimension.height / 2.0

#             # Orientation
#             # position_marker.pose.orientation = createQuaternionMsgFromYaw(st.yaw)
#             position_marker.pose.orientation = defaultQuaternion()

#             # id 증가
#             position_marker.id = id_position_marker
#             id_position_marker += 1

#             msg.markers.append(position_marker)

#             idx_state += 1
#     return msg

def UpdateRvizPredictObjects(objects, max_speed: float) -> MarkerArray:
    """
    objects: PredictObjects (Python 버전 가정)
      - objects.header: Header
      - objects.object: List of Object (각 Object가 id, dynamic_state, state[], dimension 등 보유)
    max_speed: float
    """
    msg = MarkerArray()
    marker_id = 0

    # objects.object를 순회
    for obj in objects.object:
        if len(obj.state) < 1:
            continue

        # --------------------
        # 1) Track Info Marker (TEXT_VIEW_FACING)
        # --------------------
        track_marker = Marker()
        track_marker.header = UpdateHeader(objects.header)
        track_marker.header.frame_id = "world"
        track_marker.ns = "track_info"
        track_marker.id = marker_id
        marker_id += 1
        track_marker.action = Marker.ADD
        track_marker.type = Marker.TEXT_VIEW_FACING
        track_marker.lifetime = rospy.Duration(0.15)
        track_marker.scale.z = 1.0  # 글자 크기

        # 텍스트 색상: 흰색
        track_marker.color.r = 1.0
        track_marker.color.g = 1.0
        track_marker.color.b = 1.0
        track_marker.color.a = 1.0

        # 첫 번째 상태를 사용해 속도/가속도 계산
        first_state = obj.state[0]
        track_velocity = math.sqrt(first_state.vx**2 + first_state.vy**2)
        local_accel = first_state.ax * math.cos(first_state.yaw) + \
                      first_state.ay * math.sin(first_state.yaw)

        # 동적 상태 문자열
        if obj.dynamic_state == ObjectDynamicState.STATIC:
            dynamic_str = "STATIC"
        elif obj.dynamic_state == ObjectDynamicState.DYNAMIC:
            dynamic_str = "DYNAMIC"
        else:
            dynamic_str = "UNKNOWN"

        # 소수점 3자리 반올림
        track_velocity_rounded = round(track_velocity, 3)
        local_accel_rounded = round(local_accel, 3)

        display_text = (
            f"ID ({obj.id}) {dynamic_str}\n"
            f"Vel:   {track_velocity_rounded} m/s\n"
            f"Accel: {local_accel_rounded} m/s^2"
        )
        track_marker.text = display_text
        track_marker.pose.position.x = first_state.x
        track_marker.pose.position.y = first_state.y
        track_marker.pose.position.z = 3.0
        track_marker.pose.orientation = createQuaternionMsgFromYaw(first_state.yaw)

        msg.markers.append(track_marker)

        # --------------------
        # 2) Spatial Marker (LINE_STRIP): 객체의 전체 궤적 (x,y) 연결선
        # --------------------
        spatial_marker = Marker()
        spatial_marker.header = UpdateHeader(objects.header)
        spatial_marker.header.frame_id = "world"
        spatial_marker.ns = "spatial"
        spatial_marker.id = marker_id
        marker_id += 1
        spatial_marker.action = Marker.ADD
        spatial_marker.type = Marker.LINE_STRIP
        spatial_marker.lifetime = rospy.Duration(0.15)
        spatial_marker.scale.x = 0.3  # 선 두께
        # 색상: 경로는 일정 색상 (예: 파란빛 계열)
        spatial_marker.color.r = 0.9
        spatial_marker.color.g = 0.1
        spatial_marker.color.b = 0.1
        spatial_marker.color.a = 0.9

        # --------------------
        # 3) Temporal Marker (LINE_LIST): 각 상태의 속도를 z축 높이로 표현
        # --------------------
        temporal_marker = Marker()
        temporal_marker.header = copy.deepcopy(spatial_marker.header)
        temporal_marker.ns = "temporal"
        temporal_marker.id = marker_id
        marker_id += 1
        temporal_marker.action = Marker.ADD
        temporal_marker.type = Marker.LINE_LIST
        temporal_marker.lifetime = rospy.Duration(0.15)
        temporal_marker.scale.x = spatial_marker.scale.x
        temporal_marker.color = copy.deepcopy(spatial_marker.color)

        # 객체의 모든 상태(state)를 순회하며 포인트 추가
        for st in obj.state:
            # spatial marker: 객체의 궤적 좌표 (z는 dimension.height/2 사용)
            sp_pt = Point()
            sp_pt.x = st.x
            sp_pt.y = st.y
            # z값: 객체 dimension이 있다면 중앙 높이, 없으면 0.0
            # sp_pt.z = getattr(obj.dimension, "height", 0.0) / 2.0
            sp_pt.z = 0
            spatial_marker.points.append(copy.deepcopy(sp_pt))

            # temporal marker: LINE_LIST 이므로 각 상태마다 두 점 추가
            temporal_marker.points.append(copy.deepcopy(sp_pt))
            # 두 번째 포인트: z 값에 속도 반영 (단위 변환: km/h->m/s 또는 그대로 m/s)
            tm_pt = Point()
            tm_pt.x = st.x
            tm_pt.y = st.y
            tm_pt.z = 2
            # tm_pt.z = st.vx * 0.2778  # 속도 단위를 m/s로 변환 (필요 시 수정)
            temporal_marker.points.append(tm_pt)

        msg.markers.append(spatial_marker)
        msg.markers.append(temporal_marker)

    return msg
