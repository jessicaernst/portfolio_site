#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 [--dev|--release|--demo]"
  echo "  --dev      Copy private ARBs to lib/l10n and KEEP them (local dev)."
  echo "  --release  Copy private ARBs, run gen-l10n, then CLEAN them up (CI/Deploy)."
  echo "  --demo     Copy demo ARBs with placeholder texts."
  exit 1
}

MODE="${1:-}"; [[ -z "$MODE" ]] && usage

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DST="$ROOT_DIR/lib/l10n"

case "$MODE" in
  --dev|--release) SRC="$ROOT_DIR/private/l10n" ;;
  --demo)          SRC="$ROOT_DIR/demo/l10n"    ;;
  *) usage ;;
esac

printf 'ROOT: %s\nSRC : %s\nDST : %s\n' "$ROOT_DIR" "$SRC" "$DST"

[[ -f "$SRC/app_en.arb" && -f "$SRC/app_de.arb" ]] || { echo "❌ Missing ARBs in $SRC"; exit 1; }

mkdir -p "$DST"
rm -f "$DST"/app_*.arb || true

echo "Copying ARBs from $SRC ..."
cp -f "$SRC/app_en.arb" "$DST/app_en.arb"
cp -f "$SRC/app_de.arb" "$DST/app_de.arb"

echo "Running flutter gen-l10n..."
( cd "$ROOT_DIR" && flutter gen-l10n )

if [ "$MODE" = "--release" ]; then
  echo "Cleaning up copied ARBs (release)..."
  rm -f "$DST/app_en.arb" "$DST/app_de.arb"
fi

echo "Done ($MODE)."
