python3.11 Paddle-OCR-2.9.1/tools/train.py -c training_config.yml

python3 Paddle-OCR-2.9.1/tools/infer_rec.py -c training_config.yml -o Global.infer_img=./train_data/images/000016493.jpg \
    Global.pretrained_model=./output/rec/svtr/latest