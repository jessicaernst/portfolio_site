# Jessica Ernst - Portfolio Website

A responsive bilingual (German/English) portfolio website built with Flutter Web. Features modern Material 3 design, state management with Riverpod, and GDPR-compliant localized content.

🌐 **Live Demo:** Coming soon  
🔧 **Tech Stack:** Flutter Web, Riverpod, Firebase Analytics, Material 3  
🌍 **Languages:** German (DE) / English (EN)

## ✨ Features

- **Responsive Design** - Optimized for desktop, tablet, and mobile
- **Bilingual Support** - Seamless German/English language switching
- **Modern UI** - Material 3 design system with custom theming
- **GDPR Compliant** - Privacy-focused with local font loading
- **Fast Performance** - Optimized Flutter Web build
- **SEO Friendly** - Proper meta tags and structured content

---

## 🔧 Project Setup

### Prerequisites

- Flutter SDK (≥ 3.9.0)
- Dart SDK (included with Flutter)
- Chrome browser (for web development)
- Firebase CLI (optional, for hosting & analytics)
- GNU Make (optional, for simplified commands)

### Quick Start

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd portfolio_site
   ```

2. **Install dependencies**
   ```bash
   make deps
   # or: flutter pub get
   ```

3. **Setup development environment**
   ```bash
   make dev
   ```

4. **Run the application**
   ```bash
   make run
   # or: flutter run -d chrome
   ```

The app will open in Chrome at `http://localhost:xxxx`

## 📁 Project Structure

```
portfolio_site/
├─ lib/
│  ├─ business_logic/      # State management (Riverpod providers)
│  │  └─ local/           # Locale provider
│  ├─ core/               # Core functionality
│  │  └─ theme/           # App theme and styling
│  ├─ features/           # Feature modules
│  │  └─ home/            # Home page
│  ├─ l10n/               # Localization
│  │  └─ gen/             # Generated l10n files
│  ├─ gen/                # Generated assets
│  ├─ main.dart           # App entry point
│  └─ portfolio_app.dart  # Main app widget
│
├─ assets/                # Static assets
│  └─ images/             # Images and graphics
│
├─ tool/                  # Build scripts
│  └─ prepare_localizations.sh
│
├─ private/               # Private content (gitignored)
│  └─ l10n/              # Private localization files
│
├─ web/                   # Web-specific files
├─ Makefile              # Build automation
├─ pubspec.yaml          # Dependencies
└─ l10n.yaml            # Localization config
```

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

## 🛠️ Available Commands

Run `make help` to see all available commands:

### Development
```bash
make dev      # Setup development environment with localizations
make run      # Start the app in Chrome browser  
make deps     # Install Flutter dependencies
```

### Build & Deploy
```bash
make build    # Build production web version
make release  # Prepare release with private localizations
make demo     # Prepare demo with placeholder localizations
```

### Code Generation
```bash
make riverpod # Run Riverpod/Freezed/Json code generation
make watch    # Start code generation in watch mode
make gen      # Generate Flutter localizations only
```

### Maintenance
```bash
make clean    # Remove generated localization files
make help     # Show help message
```

## 🔧 Technology Stack

- **Flutter Web** - Cross-platform UI framework
- **Riverpod** - State management and dependency injection
- **Material 3** - Modern design system
- **Google Fonts** - Typography (GDPR-compliant local loading)
- **Firebase Analytics** - Usage analytics (optional)
- **Flutter Localizations** - Internationalization support

## 🌍 Localization & Privacy

This project implements privacy-first localization:

- **GDPR Compliant** - Google Fonts loaded locally, no external tracking
- **Bilingual Support** - German and English translations
- **Private Content** - Sensitive legal texts stored separately
- **Build-time Injection** - Private content added only during deployment

## 🚀 Deployment

The app is optimized for web deployment:

1. **Build for production**
   ```bash
   make build
   ```

2. **Deploy to Firebase Hosting** (optional)
   ```bash
   firebase deploy
   ```

The built files will be in `build/web/` and ready for any static hosting service.

---

## 📝 License

This project is private and proprietary. All rights reserved.

---

**Built with ❤️ using Flutter Web**

