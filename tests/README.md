# Testing Guide

This directory contains tests for the dotfiles repository.

## Running Tests Locally

```bash
# Run all tests
./tests/test.sh

# Make executable if needed
chmod +x tests/test.sh
```

## What Gets Tested

### 1. File Structure
- Verifies all critical files exist
- Checks for required configuration files

### 2. Shell Script Syntax
- Validates bash/zsh syntax for all `.sh` files
- Ensures scripts can be parsed without errors

### 3. ShellCheck Analysis (optional)
- Static analysis of shell scripts
- Identifies common issues and anti-patterns
- Install: `brew install shellcheck`

### 4. TOML Validation
- Validates `starship.toml`
- Requires Python 3.11+ or `tomli` package

### 5. Lua Syntax
- Validates `wezterm.lua`
- Requires `lua` or `luac` installed

### 6. Source Files
- Tests that shell files can be sourced without errors
- Validates aliases and functions are properly defined

### 7. Brewfile Validation
- Checks Brewfile syntax
- Validates package declarations

### 8. Common Issues
- Checks for hardcoded paths
- Identifies trailing whitespace
- Verifies proper shebangs

### 9. README Validation
- Ensures README exists and contains required sections

## GitHub Actions

Tests run automatically on:
- Push to `main`, `master`, or `develop` branches
- Pull requests to these branches
- Manual workflow dispatch

### Test Matrix

Tests run on:
- **OS**: Ubuntu (Linux), macOS
- **Shells**: bash, zsh

### Jobs

1. **test** - Main test suite
2. **shellcheck** - Shell script linting
3. **integration** - Integration tests with real shell environments
4. **markdown** - README validation

## Required Dependencies

### Minimal (for basic tests)
- bash
- Python 3

### Recommended (for full tests)
- shellcheck
- lua/luac
- Python tomli package

### Install on macOS
```bash
brew install shellcheck lua
pip3 install tomli
```

### Install on Ubuntu
```bash
sudo apt-get install shellcheck lua5.4
pip install tomli
```

## CI/CD Status

You can see the test status in the repository's Actions tab or by adding a badge to README:

```markdown
![Tests](https://github.com/samtsevich/dotfiles/workflows/Dotfiles%20Tests/badge.svg)
```

## Troubleshooting

### Test fails locally but passes in CI
- Check if you have the required dependencies installed
- Some tests are skipped if dependencies are missing

### "Cannot source" warnings
- These are expected if Oh My Zsh or other dependencies aren't installed
- Tests will still pass if the syntax is valid

### ShellCheck warnings
- Some warnings are expected and acceptable for dotfiles
- The workflow ignores certain checks (SC1090, SC1091, SC2148)
