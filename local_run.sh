python3.11 Paddle-OCR-2.9.1/tools/train.py -c dst_training_config.yml

python3 Paddle-OCR-2.9.1/tools/infer_rec.py -c output/rec/distillation_training/config.yml -o Global.infer_img=./train_data/images/000016493.jpg \
    Global.pretrained_model=./output/rec/distillation_training/best_accuracy