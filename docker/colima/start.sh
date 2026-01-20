#!/usr/bin/env bash
# Colima起動スクリプト

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/colima.yaml"

echo "🚀 Starting Colima with configuration..."

# Colimaが既に起動しているか確認
if colima status > /dev/null 2>&1; then
    echo "⚠️  Colima is already running"
    colima status
    exit 0
fi

# 設定ファイルが存在する場合はそれを使用
if [ -f "$CONFIG_FILE" ]; then
    echo "📄 Using configuration file: $CONFIG_FILE"
    colima start --config "$CONFIG_FILE"
else
    echo "📄 Configuration file not found, using defaults"
    colima start --cpu 4 --memory 8
fi

echo "✅ Colima started successfully"
echo ""
echo "📊 Status:"
colima status
echo ""
echo "🐳 Docker info:"
docker info | grep -E "Server Version|Operating System|Architecture" || true
