# Simple Makefile for Portfolio Project
# Usage:
#	make clean    -> remove generated localization files
#   make dev      -> copy private ARBs & generate l10n (keeps them for development)
#   make release  -> copy private ARBs, generate l10n, then clean them up
#	make demo     -> copy demo ARBs, generate l10n, then clean them up
#   make gen      -> just run flutter gen-l10n
#   make build    -> build web with release localizations
#   make riverpod -> run build_runner for Riverpod/Freezed/Json

SHELL := /bin/bash
.PHONY: dev release demo gen build riverpod watch clean

clean:
	rm -rf lib/l10n/app_*.arb lib/l10n/gen

dev:
	./tool/prepare_localizations.sh --dev

release:
	./tool/prepare_localizations.sh --release

demo:
	./tool/prepare_localizations.sh --demo

gen:
	flutter gen-l10n

build: release
	flutter build web

riverpod:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs