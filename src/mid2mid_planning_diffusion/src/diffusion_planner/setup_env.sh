#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   bash setup_env.sh [ENV_NAME] [PYTHON_VERSION]
# Example:
#   bash setup_env.sh diffusion_planner 3.9

ENV_NAME="${1:-diffusion_planner}"
PYTHON_VERSION="${2:-3.9}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

echo "[setup_env] Create conda env: ${ENV_NAME} (python=${PYTHON_VERSION})"
conda create -y -n "${ENV_NAME}" "python=${PYTHON_VERSION}"

# Activate conda in non-interactive shell
eval "$(conda shell.bash hook)"
conda activate "${ENV_NAME}"

echo "[setup_env] Install diffusion_planner package (-e)"
pip install -e .

echo "[setup_env] Install torch requirements"
pip install -r requirements.txt