#!/usr/bin/env sh
cd "$(dirname "$0")" || exit 1
echo 'Open http://localhost:4173'
python3 -m http.server 4173
