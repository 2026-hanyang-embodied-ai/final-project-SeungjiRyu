#!/usr/bin/env bash
set -e

source ~/anaconda3/etc/profile.d/conda.sh
conda activate diffusion_planner

source /opt/ros/noetic/setup.bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../../../.." && pwd)"
source "${PROJECT_ROOT}/install/setup.bash"

roslaunch mid2mid_planning_diffusion mid2mid_planning_diffusion.launch
