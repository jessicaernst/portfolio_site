#!/usr/bin/env bash
set -euo pipefail

usage() { echo "Usage: $0 [--dev|--release]"; exit 1; }
MODE="${1:-}"; [[ -z "$MODE" ]] && usage

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${ROOT_DIR}/private/l10n"
DST="${ROOT_DIR}/lib/l10n"

echo "ROOT: ${ROOT_DIR}"
echo "SRC : ${SRC}"
echo "DST : ${DST}"

[[ -f "${SRC}/app_de.arb" && -f "${SRC}/app_en.arb" ]] || { echo "❌ Missing private ARBs in ${SRC}"; exit 1; }

mkdir -p "${DST}"

echo "🧹 Clearing ${DST} ..."
rm -f "${DST}"/app_*.arb

echo "🔒 Copying PRIVATE ARBs ..."
install -m 0644 "${SRC}/app_de.arb" "${DST}/app_de.arb"
install -m 0644 "${SRC}/app_en.arb" "${DST}/app_en.arb"

echo "🔎 Diff (should be empty):"
diff -u "${SRC}/app_en.arb" "${DST}/app_en.arb" || true

echo "⚙️  flutter gen-l10n ..."
( cd "${ROOT_DIR}" && flutter gen-l10n )

if [[ "${MODE}" == "--release" ]]; then
  echo "🧹 Cleaning up copied ARBs (release) ..."
  rm -f "${DST}/app_de.arb" "${DST}/app_en.arb"
fi

echo "✅ Done."