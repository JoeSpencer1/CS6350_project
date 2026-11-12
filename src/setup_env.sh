#!/bin/bash
#SBATCH --job-name=setup_env
#SBATCH --output=setup_env_%j.log
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=kingspeak-gpu-guest
#SBATCH --account=owner-gpu-guest

echo "=== Loading Anaconda Module ==="
module purge
module load anaconda3

# Define target directory path for the environment
# Adjust this base path to your project/scratch space if needed, e.g.:
# /uufs/chpc.utah.edu/common/home/zfang/my-python-envs/deepxde-env
# or your group's scratch directory:
# /scratch/general/lustre/zfang/my-python-envs/deepxde-env
ENV_PATH="./my-python-envs/deepxde-env"

echo "=== Creating Conda Environment at $ENV_PATH with Python 3.11 ==="
conda create --prefix "$ENV_PATH" python=3.11 -y

# Activate environment using the prefix path
source $(conda info --base)/etc/profile.d/conda.sh
conda activate "$ENV_PATH"

echo "=== Installing Mamba for faster dependency resolution ==="
conda install -n base -c conda-forge mamba -y

echo "=== Installing Core Dependencies via Conda/Pip ==="
# Install PyTorch (GPU version compatible with CUDA)
mamba install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia

# Install PaddlePaddle (CPU/GPU version)
python -m pip install paddlepaddle-gpu==2.6.0

# Install TensorFlow 2.15 and Keras 2.15
python -m pip install tensorflow==2.15.0 keras==2.15.0 tensorflow-probability==0.23.0

# Install DeepXDE, PyKAN, Emukit, GPy, PySR, etc.
python -m pip install deepxde==1.11.1
python -m pip install pykan emukit GPy pysr sympy
python -m pip install tqdm matplotlib numpy pandas scipy scikit-learn

echo "=== Verifying Installation ==="
python -c "import torch; print('PyTorch version:', torch.__version__, 'CUDA available:', torch.cuda.is_available())"
python -c "import tensorflow as tf; print('TensorFlow version:', tf.__version__, 'GPU available:', len(tf.config.list_physical_devices('GPU')) > 0)"
python -c "import deepxde; import kan; print('DeepXDE and PyKAN loaded successfully!')"

echo "=== Setup Complete! ==="
echo "To use your environment in future jobs or interactive sessions, run:"
echo "module load anaconda3"
echo "conda activate $(pwd)/my-python-envs/deepxde-env"
