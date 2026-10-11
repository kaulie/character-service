#!/usr/bin/env bash
# Start character-service on :9189. Docker is the supported cloud path;
# this script is for a local .venv (numpy / opencv / mediapipe).
# Do not point at home-agent-os/local-rt.

set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
PY="${CHARACTER_PYTHON:-$HERE/.venv/bin/python}"

if [ ! -x "$PY" ]; then
  echo "ERROR: $PY not found. Create .venv and install deps (see README.md)." >&2
  exit 1
fi

export CHARACTER_HOST="${CHARACTER_HOST:-127.0.0.1}"
export CHARACTER_PORT="${CHARACTER_PORT:-9189}"
export OCR_SERVICE_URL="${OCR_SERVICE_URL:-http://127.0.0.1:9188}"

cd "$HERE"
exec "$PY" main.py "$@"
