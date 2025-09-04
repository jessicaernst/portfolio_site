# Portfolio Site (Flutter Web)

Responsive, bilingual (DE/EN) personal portfolio site built with Flutter Web.  
Private legal texts (Imprint & Privacy Policy) are **not stored in the repository** and are injected only during build.

---

## 🔧 Project Setup

### Requirements
- Flutter SDK ^3.9.0
- Firebase CLI (for hosting & analytics)
- GNU Make (optional, for simplified commands)

### Folder Structure

portfolio_site/
├─ lib/                    # Public Flutter code
│  ├─ core/                # Theme, router, services, shared widgets
│  ├─ features/            # Feature-first structure (home, portfolio, legal, etc.)
│  └─ l10n/                # Dummy ARBs (public) + generated localizations
│     └─ gen/              # Generated files from flutter gen-l10n (gitignored)
│
├─ private/                # Private, sensitive files (gitignored)
│  └─ l10n/                # Real ARBs (Imprint, Privacy Policy with address/email)
│
├─ tool/                   # Utility scripts
│  └─ prepare_localizations.sh
│
├─ assets/                 # Images, icons, backgrounds, mockups
│
├─ pubspec.yaml            # Dependencies and Flutter project config
├─ l10n.yaml               # Localization config
├─ Makefile                # Simplified build & codegen commands
└─ README.md               # Project documentation

---

## 🌐 Localizations Workflow

All UI strings are localized using ARB files.

- **Private ARBs** (real texts) → stored in `private/l10n/`
- **Public repo** → either empty or contains harmless dummy ARBs
- **Script** copies the private ARBs into `lib/l10n/` for `flutter gen-l10n`

### Scripts
`tool/prepare_localizations.sh`

- `--dev`: Copies private ARBs to `lib/l10n/` and keeps them (local development)
- `--release`: Copies private ARBs, generates l10n, then cleans them up (CI/Deploy)

---

## 🛠 Makefile Commands

To simplify workflows, a `Makefile` is provided:

```bash
make dev       # Use private ARBs for local development
make release   # Use private ARBs, generate l10n, then clean up
make gen       # Run flutter gen-l10n
make build     # Release build for Firebase Hosting
make riverpod  # Run build_runner for Riverpod/Freezed/Json
make watch     # Run build_runner in watch mode
