# 服务架构

```
Gateway plugins/point_to_character.py
        │  127.0.0.1:9189
        ▼
  main.py
    POST /v1/point_to_character
    POST /v1/detect_finger
    POST /v1/ocr_at_finger
    POST /v1/rank_pointed
    GET  /health
        │
        ▼
  pipeline.py
        ├─ hands.py / skin_detect.py     MediaPipe Hands + 肤色
        ├─ ocr_client.py → :9188         本机 ocr-service
        ├─ hunyuan_ocr.py                可选备援
        ├─ geometry.py                   锥体 / 排序 / margin
        └─ debug_draw.py                 return_debug 时叠图
```

compose：`network_mode: host`，`CHARACTER_HOST=127.0.0.1`，`OCR_SERVICE_URL=http://127.0.0.1:9188`。

几何阈值 env：`READING_MAX_ANGLE_DEG`、`READING_MIN_SCORE`、`READING_MIN_MARGIN`、`READING_MAX_DIST_FRAC`。

无 SQLite。无 Asset 身份。
