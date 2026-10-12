# 开发流程

origin：`https://github.com/kaulie/character-service`。从最新 `origin/main` 开短命分支，PR 回 `main`。

1. 先读 [`../../AGENT.md`](../../AGENT.md) 与本目录。
2. 流水线 `pipeline.py`；几何 `geometry.py`；HTTP `main.py`。
3. 新增模块必须改 Dockerfile `COPY`。
4. 不要为了「总能返回一个字」放宽拍法。
5. `test_side_char_out_of_cone` 未点名不要修。

```bash
python3 -m unittest discover -s tests -t .
```

不要提交 `.venv/`、MediaPipe 缓存、往 `eval/` 再塞大图。
