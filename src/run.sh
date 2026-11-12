#!/bin/bash
#SBATCH --job-name=run_deepxde
#SBATCH --output=run_deepxde_%j.log
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1
#SBATCH --partition=kingspeak-gpu-guest
#SBATCH --account=owner-gpu-guest

echo "=== Starting Job on $(hostname) at $(date) ==="

# Load CHPC's standard miniforge3 module
module purge
module load miniforge3

# Activate your custom conda environment using its correct absolute path
ENV_PATH="/uufs/chpc.utah.edu/common/home/u1015301/my-python-venvs/deepxde-env"
conda activate "$ENV_PATH"

echo "=== Environment Activated Successfully ==="
echo "Python path: $(which python)"
echo "Python version: $(python --version)"

echo "=== Running Python Script: runmultiple.py ==="
python runmultiple.py

echo "=== Job Completed at $(date) ==="
