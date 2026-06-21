#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# File name: launch_carmaker.sh
# Description: Release version script (using install folder)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

# ==============================================================================
# -- Set up environment --------------------------------------------------------
# ==============================================================================

PRJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROSPKG_LIST=($(bash -ic 'rospack list&'))
MAP="carmaker"
MAP_FOR_LOADER="carmaker_urban_highway" # carmaker_urban_highway, carmaker_roundabout
MODE="carmaker"
MODEL="diffusion_planner"

USAGE_STRING=$(
  cat <<-END

  Arguments
    --help                       print usage
    --map [MAP]                  load map at [MAP] (katri, kiapi, daegu, sangam, ...)
    --model [MODEL]              select ML planning model: diffusion_planner (default) or pluto

END
)

# ==============================================================================
# -- Parse arguments -----------------------------------------------------------
# ==============================================================================

options=$(getopt -o cmg -l help,map:,map_loader:,car:,model: -- "$@")
if [ $? != 0 ]; then
  echo "ERROR: print usage"
  exit 1
fi

eval set -- "$options"

while true; do
  case $1 in
  -h | --help)
    echo "$USAGE_STRING"
    exit
    ;;
  --map)
    MAP=$2
    shift 2
    ;;
  --map_loader)
    MAP_FOR_LOADER=$2
    shift 2
    ;;
  --model)
    MODEL=$2
    shift 2
    ;;
  --)
    shift
    break
    ;;
  esac
done

echo -e "\e[37mMap location: $MAP\e[0m"
echo -e "\e[37mMode: $MODE\e[0m"
echo -e "\e[37mModel: $MODEL\e[0m"

export ACADOS_SOURCE_DIR="${PRJ_DIR}/acados"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"${ACADOS_SOURCE_DIR}/lib"

# ==============================================================================
# -- Run autonomous driving platform (RELEASE VERSION) -------------------------
# ==============================================================================

# hmi
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; rviz -d resources/rviz/validation_framework.rviz")
number_of_launch_files=$((${number_of_launch_files} + 1))

# bsw
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen launch/simulator.launch location:=${MAP} mode:=${MODE}")
number_of_launch_files=$((${number_of_launch_files} + 1))

# rte
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen launch/rte.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))

# perception
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen motion_prediction motion_prediction.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))

# planning
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen map_loader map_loader.launch location:=${MAP_FOR_LOADER}")
number_of_launch_files=$((${number_of_launch_files} + 1))
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen goalpoint_planning goalpoint_planning.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen global_planning global_planning.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen planning_space planning_space.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen behavior_planning behavior_planning.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))
if [[ "$MODEL" == "pluto" ]]; then
  launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; source /venv/pluto/bin/activate; roslaunch --screen mid2mid_planning_pluto mid2mid_planning_pluto.launch")
else
  launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; source /venv/diffusion_planner/bin/activate; roslaunch --screen mid2mid_planning_diffusion mid2mid_planning_diffusion.launch")
fi
number_of_launch_files=$((${number_of_launch_files} + 1))

# control
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen lateral_control lateral_control.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen longitudinal_control longitudinal_control.launch")
number_of_launch_files=$((${number_of_launch_files} + 1))

# evaluation
launch_list+=("sleep ${number_of_launch_files}; source install/setup.bash; roslaunch --screen evaluation evaluation.launch mode:=${MODE}")
number_of_launch_files=$((${number_of_launch_files} + 1))

# ==============================================================================
# -- Terminator Layout ---------------------------------------------------------
# ==============================================================================

file=$(dirname "$0")/.config
upper_line_number=$(grep -n AutoHYU-E2E-Layout ~/.config/terminator/config | cut -d: -f1)
lower_line_number=$(grep -n plugins ~/.config/terminator/config | cut -d: -f1)

if [[ -n ${upper_line_number} ]]; then
  sed -i "${upper_line_number},$((${lower_line_number}-1))d" ~/.config/terminator/config
fi

number_of_tabs=$(( (${number_of_launch_files} + 8 - 1) / 8 ))
number_of_windows=$(( ${number_of_tabs} * 6 ))
number_of_terminals=$(( ${number_of_tabs} * 8 ))

cat <<EOM >${file}
\  [[AutoHYU-E2E-Layout]]
    [[[root]]]
      fullscreen = False
      last_active_window = True
      maximised = True
      order = 0
      parent = ""
      title = AutoHYU
      type = Window
EOM

if [[ ${number_of_tabs} > 1 ]]; then
cat <<EOT >> ${file}
    [[[tab]]]
      active_page = 0
      order = 0
      parent = root
      type = Notebook
EOT
fi

for ((tab_id = 0; tab_id < ${number_of_tabs}; tab_id++)); do
  if [[ ${number_of_tabs} == 1 ]]; then
    cat <<EOT >> ${file}
    [[[tab${tab_id}]]]
      order = ${tab_id}
      parent = root
      ratio = 0.5
      type = HPaned
EOT
  else
    cat <<EOT >> ${file}
    [[[tab${tab_id}]]]
      order = ${tab_id}
      parent = tab
      ratio = 0.5
      type = HPaned
EOT
  fi

  for ((win_id = 0; win_id < 6; win_id++)); do
    if [[ $(( ${win_id} % 6 )) < 2 ]]; then
      parent_window=tab${tab_id}
      paned_type="HPaned"
    else
      parent_window=window$(( 6*${tab_id} + ${win_id} / 2 - 1 ))
      paned_type="VPaned"
    fi
    cat <<EOT >> ${file}
    [[[window$((6*${tab_id}+${win_id}))]]]
      order = $(( ${win_id} % 2 ))
      parent = ${parent_window}
      ratio = 0.5
      type = ${paned_type}
EOT
  done
done

if [[ ${number_of_launch_files} -gt ${number_of_terminals} ]]; then
  echo "ERROR: The number of packages (${number_of_launch_files}) is larger than the number of terminals (${number_of_terminals})."
  exit 1
fi

for ((term_id = 0; term_id < ${number_of_terminals}; term_id++)); do
  if [[ $(( ${term_id} % 8 )) < 2 ]]; then
    parent_terminal=window$(( ${term_id}/8 * 6 + 2 ))
  elif [[ $(( ${term_id} % 8 )) < 4 ]]; then
    parent_terminal=window$(( ${term_id}/8 * 6 + 3 ))
  elif [[ $(( ${term_id} % 8 )) < 6 ]]; then
    parent_terminal=window$(( ${term_id}/8 * 6 + 4 ))
  else
    parent_terminal=window$(( ${term_id}/8 * 6 + 5 ))
  fi

  if [[ ${term_id} -lt ${#launch_list[@]} ]]; then
    command="${launch_list[$term_id]} && bash"
  else
    command=""
  fi

  cat <<EOT >> ${file}
    [[[terminal${term_id}]]]
      directory = ${PRJ_DIR}
      command = ${command}
      order = $(( ${term_id} % 2 ))
      parent = ${parent_terminal}
      title = ""
      type = Terminal
EOT
done

sed -i 's/$/\\/g' ${file}
sed -i '$s/\\//g' ${file}

config_file=$(cat ${file})
sed -i "/\[plugins\]/ i ${config_file}" ~/.config/terminator/config

# ==============================================================================
# -- Launch AutoHYU ------------------------------------------------------------
# ==============================================================================

bash -ic "terminator -p '~/.config/terminator/config' -l AutoHYU-E2E-Layout&"
