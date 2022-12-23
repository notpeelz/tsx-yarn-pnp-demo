#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
. "$SCRIPT_DIR/common.sh"

cli_js_path="$(realpath "$NODE_REPO/deps/npm/lib/cli.js")"

exec "$SCRIPT_DIR/node.sh" -e "require('$cli_js_path')(process)" npm "$@"
