import subprocess
import os

# Paths
config_path = "dst_training_config.yml"
pretrained_model = "./output/rec/distillation_training/best_accuracy"
image_list_file = "train_data/san_check_train_list.txt"

with open(image_list_file, 'r', encoding='utf-8') as f:
    for line in f:
        image_path = "train_data/" + line.strip().split('\t')[0]  # assuming tab-separated
        if not os.path.exists(image_path):
            print(f"⚠️ Skipping: {image_path} (not found)")
            continue

        cmd = [
            "python3",
            "Paddle-OCR-2.9.1/tools/infer_rec.py",
            "-c", config_path,
            "-o", f"Global.infer_img={image_path}",
            f"Global.pretrained_model={pretrained_model}"
        ]

        print(f"🔍 Running inference on {image_path}")
        subprocess.run(cmd)
