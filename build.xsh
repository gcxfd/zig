#!/usr/bin/env xonsh

from fire import Fire
from os.path import dirname,abspath,exists
import platform
from humanize import naturalsize
import os

PWD = dirname(abspath(__file__))

cd @(PWD)

p".xonshrc".exists() && source .xonshrc

zig build-exe -O ReleaseFast main.zig
