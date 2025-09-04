#!/usr/bin/env bash
set -e

echo "🔄 Copying private ARB files..."
mkdir -p lib/l10n
cp -f private/l10n/app_de.arb lib/l10n/app_de.arb
cp -f private/l10n/app_en.arb lib/l10n/app_en.arb
echo "✅ Private ARBs copied to lib/l10n."

echo "⚙️  Running flutter gen-l10n..."
flutter gen-l10n
echo "✨ Done! Localizations are now up to date."
