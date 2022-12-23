#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
. "$SCRIPT_DIR/common.sh"

exec "$NODE_REPO/out/Release/node" "$@"
