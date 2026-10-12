# project_map — character-service 项目地图

本目录按**运行事实**说明本仓库，不是概念词典。

| 文档 | 维度 |
|---|---|
| [positioning.md](positioning.md) | 静图指字，不猜 |
| [architecture.md](architecture.md) | pipeline、几何、OCR 客户端 |
| [tech-stack.md](tech-stack.md) | MediaPipe / OpenCV / Docker |
| [deployment.md](deployment.md) | 回环 :9189、host network、**不走 :4220** |
| [release.md](release.md) | 无 `build.sh` |
| [development.md](development.md) | 几何单测；已知失败用例 |

根目录 [`AGENT.md`](../../AGENT.md) 是后续 agent 的入口。拍法与 API 以 [`README.md`](../../README.md) 为准。

## 本轮已核对的异议（2026-10-12）

1. **不在 `:4220` 登记。** 禁止 deploy-notify。
2. **只绑 `127.0.0.1:9189`。** compose 用 `network_mode: host` 以便访问本机 `:9188`。
3. **必须先有 ocr-service `:9188`。** 本仓不内嵌 Paddle。
4. **V1 只做一张静图。** 拍法不满足就 `uncertain` / `no_hand` / `no_text` / `failed`，不猜一个字。
5. **Dockerfile COPY 必须含 `skin_detect.py`。** 漏模块镜像会起不来。
6. **`test_side_char_out_of_cone` 迁仓前就失败。** 未点名不要当本次回归去「修掉」几何。
7. **`run.sh` 用本仓 `.venv`，不得指向 os 的 `local-rt/venv`。**

后续 agent 若发现上述条目被新代码推翻，删除或改写。
