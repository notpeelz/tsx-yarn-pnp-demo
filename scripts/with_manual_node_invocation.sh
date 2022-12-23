#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_DIR="$(realpath "$SCRIPT_DIR/..")"
REPO_DIR_ESCAPED="$(echo "$REPO_DIR" | sed -e "s/\"/\\\\\"/g")"

# Delete cached esbuild transforms
rm -rf /tmp/esbuild-kit

# If we passed -r/--loader directly, it would appear to work fine until
# esbuild spawns a worker (using `worker_threads`).
# Worker forks won't use those parameters and will cause module
# resolution to fail.
# Instead, we use the NODE_OPTIONS env var because it gets inherited
# by child processes.
NODE_OPTIONS="-r \"$REPO_DIR_ESCAPED/.pnp.cjs\" --loader \"$REPO_DIR_ESCAPED/.pnp.loader.mjs\"" \
  "$REPO_DIR/shims/node.sh" \
  --loader tsx \
  "$REPO_DIR/src/test.mts"
