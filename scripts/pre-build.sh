#!/usr/bin/env bash
set -eo pipefail
SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"

"$SCRIPT_DIR"/init-submodules.sh
