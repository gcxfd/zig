#!/usr/bin/env xonsh

#from fire import Fire
from os.path import dirname,abspath,exists
import platform
#from humanize import naturalsize
import os

PWD = dirname(abspath(__file__))

cd @(PWD)

p".xonshrc".exists() && source .xonshrc

if not exists(".zigmod"):
  zigmod fetch

zig build -Drelease-fast=true

bin = "./zig-out/bin/rmw"
stat = os.stat(bin)

if stat.st_size > 50000:
  ./sh/upx.sh
  upx --best --lzma @(bin)
