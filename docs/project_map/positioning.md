# 项目定位

## 一句话

character-service 是静图「指到哪个字」HTTP 服务。不知道 Asset / Brain / Planner。Gateway 经 `:9189` 包装 `reading.point_to_character` 等原子能力。

仓库：[`https://github.com/kaulie/character-service`](https://github.com/kaulie/character-service)  
回环口：`127.0.0.1:9189`

## 它要解决什么

一张俯拍书页图 → 食指指尖对准的字 + bbox + score。OCR 交给本机 [ocr-service](https://github.com/kaulie/ocr-service)。

## 它不是什么

| 不是 | 谁才是 |
|---|---|
| 能力声明 / 规划 | 集市 + Brain |
| OCR 引擎 | ocr-service `:9188` |
| 连续帧 / Image Stream | 本仓 V1 明确不做 |
| `:4220` 托管服务 | Brain / Gateway / 集市 |

## 当前形态

- `main.py` HTTP + `pipeline.py` 流水线
- 云上 Docker：`container_name: home-agent-character`，host network
- `eval/` 是算法笔记与历史样本，不是线上路径
