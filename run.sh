#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

if [ ! -d ".zigmod/" ];then
zigmod fetch
fi

zig build run
