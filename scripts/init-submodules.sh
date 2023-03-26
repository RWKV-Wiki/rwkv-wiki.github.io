#!/usr/bin/env bash
set -eo pipefail
SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"

git submodule update --init --recursive
git submodule foreach --recursive git -C "$sm_path" log -1
