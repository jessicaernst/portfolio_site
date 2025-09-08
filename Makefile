# Makefile for Jessica Ernst's Portfolio Website
# A responsive bilingual Flutter portfolio site
#
# Quick start:
#   make help     -> show all available commands
#   make dev      -> setup development environment with localizations
#   make run      -> start the app in Chrome
#   make build    -> build production web version
#
# Localization workflow:
#   make dev      -> copy private ARBs & generate l10n (keeps them for development)
#   make release  -> copy private ARBs, generate l10n, then clean them up
#   make demo     -> copy demo ARBs, generate l10n, then clean them up
#
# Code generation:
#   make riverpod -> run build_runner for Riverpod/Freezed/Json generation
#   make watch    -> continuous code generation in watch mode

SHELL := /bin/bash
.PHONY: dev release demo gen build riverpod watch clean help run deps

# Development Commands
dev:
	@echo "Setting up development environment..."
	./tool/prepare_localizations.sh --dev

run:
	@echo "Starting Flutter app in Chrome..."
	flutter run -d chrome

deps:
	@echo "Installing Flutter dependencies..."
	flutter pub get

# Build Commands  
build: release
	@echo "Building production web version..."
	flutter build web

release:
	@echo "Preparing release with private localizations..."
	./tool/prepare_localizations.sh --release

demo:
	@echo "Preparing demo with placeholder localizations..."
	./tool/prepare_localizations.sh --demo

# Code Generation
riverpod:
	@echo "Running Riverpod/Freezed/Json code generation..."
	dart run build_runner build --delete-conflicting-outputs

watch:
	@echo "Starting code generation in watch mode..."
	dart run build_runner watch --delete-conflicting-outputs

gen:
	@echo "Generating Flutter localizations..."
	flutter gen-l10n

# Maintenance
clean:
	@echo "Cleaning generated localization files..."
	rm -rf lib/l10n/app_*.arb lib/l10n/gen

# Help
help:
	@echo "Jessica Ernst's Portfolio Website - Available Commands:"
	@echo ""
	@echo "Development:"
	@echo "  make dev      - Setup development environment with localizations"
	@echo "  make run      - Start the app in Chrome browser"
	@echo "  make deps     - Install Flutter dependencies"
	@echo ""
	@echo "Build & Deploy:"
	@echo "  make build    - Build production web version"
	@echo "  make release  - Prepare release with private localizations"
	@echo "  make demo     - Prepare demo with placeholder localizations"
	@echo ""
	@echo "Code Generation:"
	@echo "  make riverpod - Run Riverpod/Freezed/Json code generation"
	@echo "  make watch    - Start code generation in watch mode"
	@echo "  make gen      - Generate Flutter localizations only"
	@echo ""
	@echo "Maintenance:"
	@echo "  make clean    - Remove generated localization files"
	@echo "  make help     - Show this help message"