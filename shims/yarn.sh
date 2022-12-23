#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
. "$SCRIPT_DIR/common.sh"

yarn_bin="$NODE_REPO/out/lib/node_modules/yarn/bin/yarn"

if [[ ! -x "$yarn_bin" ]]; then
  echo "Performing first-time setup..."
  "$SCRIPT_DIR/npm.sh" install -g yarn
fi

exec "$yarn_bin" "$@"
