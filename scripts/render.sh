#!/bin/sh
# Renders assets/banner.html to a 2x PNG with headless Chrome.
set -e
cd "$(dirname "$0")/../assets"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 \
  --window-size=1280,420 --virtual-time-budget=5000 \
  --screenshot="$PWD/banner.png" "file://$PWD/banner.html"
