# 部署细节

**不是** `:4220`。先确认 ocr-service 已在 `127.0.0.1:9188`。

```bash
git clone https://github.com/kaulie/character-service.git /root/chat-gateway/character-service
cd /root/chat-gateway/character-service
docker compose up -d --build
curl -sS http://127.0.0.1:9189/health
```

容器：`home-agent-character`，`mem_limit: 2g`，`network_mode: host`，`restart: unless-stopped`。

本机不走 Docker：建 `.venv`，按 Dockerfile 装依赖，然后 `./run.sh`（本仓 venv，不是 os）。

不要占用线上 9189。不要改 `/Users/gaolei/runtime/**`。不要 deploy-notify。
