# Local Ubuntu-22.04 setup
sudo cp /var/cudnn-local-repo-ubuntu2004-8.9.7.29/cudnn-local-30472A84-keyring.gpg /usr/share/keyrings/
sudo dpkg -i cudnn-local-repo-ubuntu2004-8.9.7.29_1.0-1_amd64.deb
sudo apt-get update
sudo apt-get install libcudnn8 libcudnn8-dev

# Setup CUDA 11.8
# Step 1: Set up the NVIDIA repository
sudo apt update
sudo apt install -y wget gnupg software-properties-common

# Download the repo config
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600

# Add the CUDA repository keys
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub

# Add the actual repository
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"

# Step 2: Install CUDA Toolkit (11.8 is safe for Paddle 2.5)
sudo apt update
sudo apt install -y cuda-toolkit-11-8
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc


git clone https://github.com/TranDuong874/Paddle-OCR-2.9.1.git

# conda create -n py311 python=py311

echo "You are currently in $(pwd)"

ls
pip install -r Paddle-OCR-2.9.1/requirements.txt
pip install imgaug
pip install rapidfuzz
pip install lmdb
pip install -q gdown
pip install -q imutils
# Recommend to use version 2.0.1+
pip install -q "paddleocr>=2.0.1" 
python -m pip install -q paddlepaddle-gpu==2.5.2



python -c "
import paddle
gpu_available = paddle.device.is_compiled_with_cuda()
print('GPU available:', gpu_available)
paddle.utils.run_check()
"
