#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="${1:-$(pwd)}"
MODEL=""

# Parse --model flag
for arg in "$@"; do
  if [[ "$arg" == --model=* ]]; then
    MODEL="${arg#*=}"
  fi
done

# Build the container if needed
docker compose -f "$SCRIPT_DIR/docker-compose.yml" build

# For login, always use device flow (no browser in container)
if [[ "${2:-}" == "login" ]]; then
  PROJECT_PATH="$PROJECT_PATH" docker compose -f "$SCRIPT_DIR/docker-compose.yml" run --rm kiro login --use-device-flow
elif [[ "${2:-}" == "ralph" ]]; then
  # Run the ralph loop
  MAX_ITERATIONS="${3:-10}"
  MODEL_FLAG=""
  [[ -n "$MODEL" ]] && MODEL_FLAG="--model $MODEL"
  PROJECT_PATH="$PROJECT_PATH" docker compose -f "$SCRIPT_DIR/docker-compose.yml" run --rm --entrypoint bash kiro -c "/workspace/ralph.sh $MAX_ITERATIONS $MODEL_FLAG"
elif [[ "${2:-}" == "chat" ]]; then
  MODEL_ARG=""
  [[ -n "$MODEL" ]] && MODEL_ARG="--model $MODEL"
  PROJECT_PATH="$PROJECT_PATH" docker compose -f "$SCRIPT_DIR/docker-compose.yml" run --rm kiro chat $MODEL_ARG "${@:3}"
else
  PROJECT_PATH="$PROJECT_PATH" docker compose -f "$SCRIPT_DIR/docker-compose.yml" run --rm kiro "${@:2}"
fi
