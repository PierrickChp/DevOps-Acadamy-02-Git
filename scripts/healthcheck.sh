#!/usr/bin/env bash

set -euo pipefail

if [[ -f "app.txt" ]]; then
    echo "OK: app.txt exists"
    exit 0
else
    echo "ERROR: app.txt is missing"
    exit 1
fi
