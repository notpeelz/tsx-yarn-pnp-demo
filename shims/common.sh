set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_DIR="$(realpath "$SCRIPT_DIR/..")"
NODE_REPO="$(realpath "$REPO_DIR/node")"
NODE_REPO_RELATIVE="$(realpath --relative-to="$REPO_DIR" "$NODE_REPO")"

if [[ ! -d "$NODE_REPO/out/Release" ]]; then
  >&2 echo "Please build NodeJS first; see $NODE_REPO_RELATIVE/BUILDING.md"
  exit 1
fi

export PATH="$NODE_REPO/out/Release:$NODE_REPO/out/bin:$PATH"
