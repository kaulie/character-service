# 发布细节

无 `build.sh`、无平台 `outputs/`。发布 = 云上目录拉 ref + `docker compose up -d --build`。

合入 `main` ≠ 容器已更新。Gateway 客户端合约在 gateway 仓的 `point_to_character.py`，改响应形状要两边一起。
