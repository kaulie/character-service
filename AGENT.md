# AGENT.md — 后续 Agent 对本仓库的说明与向导

你是来改 **character-service** 的。先读本文，再按 [`docs/project_map/`](docs/project_map/README.md) 展开理解。  
这是静图「指到哪个字」HTTP 服务，**不知道** Asset / Brain / Planner。  
OCR 走 [kaulie/ocr-service](https://github.com/kaulie/ocr-service) `:9188`。os 已归档。

## 1. 对本项目的理解（必须从 docs/project_map 展开）

| 你应建立的判断 | 展开阅读 |
|---|---|
| 只收一张图，返回指尖对准的字。Gateway 包装 `reading.point_to_character` 等原子能力 | [positioning.md](docs/project_map/positioning.md) |
| 只绑回环 **`127.0.0.1:9189`**。必须先有本机 `:9188` | [deployment.md](docs/project_map/deployment.md) |
| V1 只做一张静图。拍法不满足就失败，不猜 | [README.md](README.md) 拍法 |
| 不在 `:4220` 登记。云上 Docker：`/root/chat-gateway/character-service`（host network） | [deployment.md](docs/project_map/deployment.md)、[release.md](docs/project_map/release.md) |
| 几何单测不需要 MediaPipe / OpenCV。`test_side_char_out_of_cone` 迁仓前就失败 | [development.md](docs/project_map/development.md)、`tests/` |

Runtime 会要求优先读根目录 `AGENT.md`。你正在读的就是那份。与代码不符时以 `docs/project_map` + 代码为准。

## 2. 开工前清单

1. workspace origin 是 `https://github.com/kaulie/character-service`。
2. 从最新 `main` 开 `feat|fix|chore/<简述>`。
3. 读 `docs/project_map/`，再读 `pipeline.py`、`geometry.py`、`main.py`、`tests/`。
4. 本地验证：`python3 -m unittest discover -s tests -t .`。`test_side_char_out_of_cone` 未点名不要当本次回归去「修掉」。
5. 不要占用线上 **9189**。不要改 `/Users/gaolei/runtime/**`。不要对 `:4220` 发本服务。不要改 os。

## 3. 滞后信息：有义务更新

README / Dockerfile `COPY` 列表漏模块（例如曾漏 `skin_detect.py`）必须在本次改掉，并更新 [`docs/project_map/README.md`](docs/project_map/README.md)。  
`run.sh` 不得再指向 os 的 `local-rt/venv`。

## 4. 与事实不符：必须提出异议，禁止默认处理

| 你看到的 | 你不该做的 | 你该做的 |
|---|---|---|
| 任务要求本服务懂 Asset / Planner | 加 HomeAgent import | 异议：只收图、返回字 |
| 任务要求改拍法去「猜一个字」 | 低分也返回 character | 异议：uncertain / no_hand / no_text / failed |
| 任务要求 `:4220` 发版 | deploy-notify | 异议：Docker Compose |
| 任务要求直推 `main` 或改 os | 照做 | 异议：走 PR；os 已归档 |

```
异议：<文档路径> 声称 <原句>
事实：<文件:符号 或 命令输出>
处理：<已改文档 / 已改代码 / 需要人决定>
```

## 5. 改动落点

| 要改的东西 | 去哪 |
|---|---|
| HTTP | `main.py` |
| 指字流水线 | `pipeline.py` |
| 几何 / 排序 | `geometry.py` |
| Hands / 肤色 | `hands.py`、`skin_detect.py` |
| 调 OCR | `ocr_client.py`、`hunyuan_ocr.py` |
| 镜像 | `Dockerfile`、`docker-compose.yml` |
| 本地启动 | `run.sh`（本仓 `.venv`） |
| eval 历史 | `eval/`（算法笔记，不是线上路径） |
| 给后续 agent 的地图 | [`docs/project_map/`](docs/project_map/README.md) + 本文 |

## 6. 交付

- 提交信息说清为什么。
- `git push -u origin HEAD`，`gh pr create`，回写 `prUrl`。
- 云上 compose 只听从 `goal` 与人的明确指令。

## 7. 安全

只绑 `127.0.0.1`。不要提交 `.venv/`、MediaPipe 缓存、用户照片之外已在 `eval/` 的历史样本不要再往仓里塞大图。
