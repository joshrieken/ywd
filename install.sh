#!/usr/bin/env bash

set -eu -o pipefail


function installed?() {
  type "$1" >/dev/null 2>&1
}

if ! installed? brew; then
  exit
else
  echo "brew already installed"
fi
