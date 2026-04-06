#!/bin/bash
# Flash-MoE Server — Qwen3.5-397B-A17B on Apple Silicon
# Starts the OpenAI-compatible API server on port 8800
#
# Usage: ./start-server.sh [port]
# Default port: 8800

PORT=${1:-8800}
MODEL="/Users/shanemac/Models/flash-moe/mlx-source"
DIR="$(cd "$(dirname "$0")/metal_infer" && pwd)"

echo "╔═══════════════════════════════════════════════════════╗"
echo "║  Flash-MoE Server — Qwen3.5-397B-A17B               ║"
echo "║  397B params, 17B active, 4-bit quantised            ║"
echo "║  Running on Apple M4 Max via Metal GPU               ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""
echo "Model:  $MODEL"
echo "Port:   $PORT"
echo "API:    http://localhost:$PORT/v1/chat/completions"
echo ""

cd "$DIR" || exit 1

exec ./infer \
  --model "$MODEL" \
  --weights "$MODEL/model_weights.bin" \
  --manifest "$MODEL/model_weights.json" \
  --vocab "$MODEL/vocab.bin" \
  --serve "$PORT"
