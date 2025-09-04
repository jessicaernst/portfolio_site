#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-}"
if [ -z "$MODE" ]; then
  echo "Usage: $0 [--dev|--release]"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT_DIR/private/l10n"
DST="$ROOT_DIR/lib/l10n"

printf 'ROOT: %s\nSRC: %s\nDST: %s\n' "$ROOT_DIR" "$SRC" "$DST"

[ -f "$SRC/app_de.arb" ] || { echo "ERROR: missing $SRC/app_de.arb"; exit 1; }
[ -f "$SRC/app_en.arb" ] || { echo "ERROR: missing $SRC/app_en.arb"; exit 1; }

mkdir -p "$DST"

echo "Clearing target directory..."
rm -f "$DST"/app_*.arb || true

echo "Copying private ARBs..."
cp -f "$SRC/app_de.arb" "$DST/app_de.arb"
cp -f "$SRC/app_en.arb" "$DST/app_en.arb"

echo "Running flutter gen-l10n..."
( cd "$ROOT_DIR" && flutter gen-l10n )

if [ "$MODE" = "--release" ]; then
  echo "Cleaning up copied ARBs..."
  rm -f "$DST/app_de.arb" "$DST/app_en.arb"
fi

echo "Done."
