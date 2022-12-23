#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_DIR="$(realpath "$SCRIPT_DIR/..")"

# Delete cached esbuild transforms
rm -rf /tmp/esbuild-kit

"$REPO_DIR/shims/yarn.sh" \
  tsx \
  "$REPO_DIR/src/test.mts"
