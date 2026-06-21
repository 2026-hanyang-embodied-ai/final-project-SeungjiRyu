cmake_minimum_required(VERSION 3.0.2)
project(mid2mid_planning_pluto)

find_package(catkin REQUIRED)

catkin_package()

catkin_install_python(
  PROGRAMS scripts/mid2mid_planning_pluto_node.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
