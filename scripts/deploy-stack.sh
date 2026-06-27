#!/usr/bin/env bash
set -euo pipefail

STACK_NAME="${1:-}"

REPO_ROOT="/data/compose/repo/homelab-compose"
RUNTIME_ROOT="/data/compose/stacks"

if [[ -z "$STACK_NAME" ]]; then
  echo "Usage: $0 <stack-name>"
  exit 1
fi

SOURCE_DIR="$REPO_ROOT/stacks/$STACK_NAME"
TARGET_DIR="$RUNTIME_ROOT/$STACK_NAME"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Error: stack not found: $SOURCE_DIR"
  exit 1
fi

if [[ ! -f "$SOURCE_DIR/compose.yaml" ]]; then
  echo "Error: compose.yaml not found in $SOURCE_DIR"
  exit 1
fi

mkdir -p "$TARGET_DIR"

cp "$SOURCE_DIR/compose.yaml" "$TARGET_DIR/compose.yaml"

if [[ -f "$SOURCE_DIR/.env.example" && ! -f "$TARGET_DIR/.env" ]]; then
  cp "$SOURCE_DIR/.env.example" "$TARGET_DIR/.env"
  echo "Created runtime .env from .env.example"
fi

echo "Deployed stack files:"
echo "  Source:  $SOURCE_DIR"
echo "  Runtime: $TARGET_DIR"
echo
echo "Next steps:"
echo "  cd $TARGET_DIR"
echo "  nano .env"
echo "  docker compose config"
echo "  docker compose up -d"
