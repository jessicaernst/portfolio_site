#!/usr/bin/env bash
set -e

usage() {
  echo "Usage: $0 [--dev|--release]"
  echo "  --dev      Copy private ARBs to lib/l10n and KEEP them (local development)."
  echo "  --release  Copy private ARBs, run gen-l10n, then CLEAN them up (CI/Deploy)."
  exit 1
}

MODE="$1"; [ -z "$MODE" ] && usage
mkdir -p lib/l10n

copy_privates() {
  echo "🔒 Using PRIVATE ARBs..."
  cp -f private/l10n/app_de.arb lib/l10n/app_de.arb
  cp -f private/l10n/app_en.arb lib/l10n/app_en.arb
}

if [ "$MODE" = "--dev" ]; then
  copy_privates
  echo "⚙️  Running flutter gen-l10n..."
  flutter gen-l10n
  echo "✅ Dev mode ready. Private ARBs remain in lib/l10n (ignored by git)."
elif [ "$MODE" = "--release" ]; then
  copy_privates
  echo "⚙️  Running flutter gen-l10n..."
  flutter gen-l10n
  echo "🧹 Cleaning up copied ARBs..."
  rm -f lib/l10n/app_de.arb lib/l10n/app_en.arb
  echo "✨ Release mode done."
else
  usage
fi