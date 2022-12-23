#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_DIR="$(realpath "$SCRIPT_DIR/..")"

# Delete cached esbuild transforms
rm -rf /tmp/esbuild-kit

if ! command -v npm &>/dev/null; then
  >&2 echo "npm not found"
  exit 1
fi

if ! command -v yarn &>/dev/null; then
  echo "Looks like you don't have a global Yarn install."
  read -p "Do you want to install it (\`npm i -g yarn\`)? [y/n] " -n 1 -r
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    npm i -g yarn
  else
    echo "Okay bye :)"
    exit 0
  fi
fi

if ! command -v yarn &>/dev/null; then
  >&2 echo "yarn not found"
  exit 1
fi

yarn tsx "$REPO_DIR/src/test.mts"
