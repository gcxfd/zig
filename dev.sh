#!/usr/bin/env bash

_DIR=$(dirname $(realpath "$0"))

cd $_DIR

. ./sh/pid.sh

set -ex

if ! hash watchexec 2>/dev/null; then
cargo install watchexec-cli
fi

RUST_BACKTRACE=1 watchexec \
  --shell=none -w . \
  -c -r --exts zig,yaml \
  --ignore target/ \
  -- ./run.sh
