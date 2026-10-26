#!/usr/bin/env bash

set -euo pipefail

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

cp scripts/healthcheck.sh "$tmp_dir/"

cd "$tmp_dir"

echo "Running missing app.txt test..."

if ./healthcheck.sh; then
    echo "ERROR: expected healthcheck to fail"
    exit 1
else
    echo "OK: missing app.txt correctly detected"
fi

touch app.txt
./healthcheck.sh
echo "OK: app.txt correctly detected"

exit 1
