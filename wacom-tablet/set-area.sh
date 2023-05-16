#!/bin/bash
set -euo pipefail

device="Wacom Intuos BT S Pen stylus"
xsetwacom set "${device}" Area 0 0 15200 6362
