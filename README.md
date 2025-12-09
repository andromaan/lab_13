# Flutter CI/CD Lab 13

![Flutter CI](https://github.com/andromaan/lab_13/workflows/Flutter%20CI/badge.svg)
![Release](https://github.com/andromaan/lab_13/workflows/Release/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Production-ready Flutter application with complete CI/CD pipeline, automated testing, and multi-environment support.

## Features

- **GitHub Actions CI/CD** - Automated testing and deployment
- **Code Quality Gates** - Strict linting and 70%+ test coverage
- **Multi-Environment** - Dev, Staging, and Production configurations
- **Parallel Builds** - Android APK and Web builds
- **Automated Versioning** - Auto-increment and Git tagging
- **Dependency Caching** - Fast CI runs with smart caching

## Environments

Run the app in different environments:

```bash
# Development
flutter run --dart-define=BUILD_ENV=dev --dart-define=API_URL=https://api-dev.example.com

# Staging
flutter run --dart-define=BUILD_ENV=staging --dart-define=API_URL=https://api-staging.example.com

# Production
flutter run --dart-define=BUILD_ENV=prod --dart-define=API_URL=https://api.example.com
```

## Testing

Run tests with coverage:

```bash
# Run all tests
flutter test

# Run tests with coverage report
flutter test --coverage

# Check coverage threshold (70% minimum)
bash scripts/check_coverage.sh
```

## Development

### Prerequisites

- Flutter 3.35.3 or higher
- Dart 3.9.2 or higher

### Setup

```bash
# Clone repository
git clone https://github.com/andromaan/lab_13.git
cd lab_13

# Install dependencies
flutter pub get

# Run app
flutter run
```

### Code Quality

```bash
# Format code
dart format .

# Analyze code
flutter analyze --fatal-infos

# Run full CI check locally
dart format . && flutter analyze && flutter test --coverage
```

## CI/CD Pipeline

### Workflows

1. **Flutter CI** (`.github/workflows/ci.yml`)

   - Runs on: Push to `develop` or `main`, Pull Requests
   - Jobs: `analyze` → `test` → `build-android` + `build-web` (parallel)
   - Includes: Code formatting, static analysis, tests, coverage check

2. **Release** (`.github/workflows/release.yml`)
   - Runs on: Push to `main` branch
   - Automated version bump, Git tagging, and GitHub Release creation

### Branch Strategy

- `main` - Production-ready code
- `develop` - Integration branch
- `feature/*` - Feature branches

## Project Statistics

- **Test Coverage**: 70%+ required
- **Build Time**: ~2-3 minutes with caching
- **Supported Platforms**: Android, Web

## License

This project is licensed under the MIT License.

## Author

Andrii Androman (@andromaan)
