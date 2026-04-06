#!/bin/bash
# Flash-MoE Chat Client
# Connects to the local Flash-MoE server
#
# Usage: ./chat.sh [port]
# Default port: 8800

PORT=${1:-8800}
DIR="/Users/shanemac/experiments/flash-moe-original/metal_infer"

echo "Connecting to Flash-MoE at localhost:$PORT"
echo "Type /help in chat for commands. Ctrl+C to exit."
echo ""

cd "$DIR" || exit 1
exec ./chat --port "$PORT"
