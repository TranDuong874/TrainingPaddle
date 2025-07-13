import paddle
from paddleocr import PaddleOCR
import cv2
import numpy as np

# Create OCR object pointing to your exported model
ocr = PaddleOCR(
    use_angle_cls=False,
    use_space_char=True,
    use_gpu=True,
    det=True,   # turn off detection if you only want to test recognition
    rec=True,
    rec_model_dir='inference_rec/Student/',
    rec_char_dict_path='/home/tranduong/TrainingPaddle/vi_dict.txt',
)

# Load image
img_path = '1000001497.jpg'
image = cv2.imread(img_path)

# Run OCR
results = ocr.ocr(image, cls=False)

# Show results in terminal
for line in results:
    for word_info in line:
        text = word_info[1][0]
        confidence = word_info[1][1]
        print(f'Text: {text}, Confidence: {confidence:.4f}')

# Draw detection boxes only
for line in results:
    for word_info in line:
        box = word_info[0]  # 4 corner points of the box
        points = np.array(box).astype(np.int32)
        cv2.polylines(image, [points], isClosed=True, color=(0, 255, 0), thickness=2)

# Show image with boxes
cv2.imshow('OCR Detection Boxes', image)
cv2.waitKey(0)
cv2.destroyAllWindows()
