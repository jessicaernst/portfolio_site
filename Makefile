# Simple Makefile for Portfolio Project
# Usage:
#   make dev      -> copy private ARBs & generate l10n (keeps them for development)
#   make release  -> copy private ARBs, generate l10n, then clean them up
#   make gen      -> just run flutter gen-l10n
#   make build    -> build web with release localizations
#   make riverpod -> run build_runner for Riverpod/Freezed/Json

dev:
	./tool/prepare_localizations.sh --dev

release:
	./tool/prepare_localizations.sh --release

gen:
	flutter gen-l10n

build: release
	flutter build web

riverpod:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs