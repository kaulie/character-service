# 技术栈

| 项 | 事实 |
|---|---|
| 语言 | Python 3.10（DaoCloud bookworm 镜像） |
| Hands | mediapipe==0.10.14（`--no-deps`，跳过 jax / opencv-contrib） |
| 图像 | opencv-python-headless==4.10.0.84，numpy<2 |
| OCR | HTTP 客户端，不是本仓 Paddle |
| 单测 | `unittest`；几何用例不需要 MediaPipe / OpenCV |

Dockerfile `COPY`：`geometry.py ocr_client.py hunyuan_ocr.py hands.py skin_detect.py debug_draw.py pipeline.py main.py`。

无 `build.sh`。无 Flask。无 HomeAgent SDK。
