git clone https://github.com/TranDuong874/Paddle-OCR-2.9.1.git
cd Paddle-OCR-2.9.1
echo "You are currently in $(pwd)"

ls
pip install -r requirements.txt
pip install imgaug
pip install rapidfuzz
pip install lmdb
pip install -q gdown
pip install -q imutils
pip install -q "paddleocr>=2.0.1" # Recommend to use version 2.0.1+
python -m pip install -q paddlepaddle-gpu==2.5.2 

sudo cp /var/cudnn-local-repo-ubuntu2204-8.9.7.29/cudnn-local-*.key /usr/share/keyrings/
sudo apt-get update
sudo apt-get install libcudnn8 libcudnn8-dev

python -c "
import paddle
gpu_available = paddle.device.is_compiled_with_cuda()
print('GPU available:', gpu_available)
paddle.utils.run_check()
"