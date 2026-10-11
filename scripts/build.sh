#!/usr/bin/env bash
# Copy shared assets into each language docs_dir, then build both sites.
set -euo pipefail
cd "$(dirname "$0")/.."
ZENSICAL="${ZENSICAL:-zensical}"
for lang in kor eng; do
  rm -rf "docs/$lang/assets"
  cp -R docs/assets "docs/$lang/assets"
  "$ZENSICAL" build -f "zensical.$lang.toml"
done
cp scripts/root-index.html site/index.html
