#!/usr/bin/env bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

TESTS_PASSED=0
TESTS_FAILED=0
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Test result reporting
pass() {
    echo -e "${GREEN}✓${NC} $1"
    ((TESTS_PASSED++))
}

fail() {
    echo -e "${RED}✗${NC} $1"
    ((TESTS_FAILED++))
}

warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

section() {
    echo ""
    echo "=========================================="
    echo "$1"
    echo "=========================================="
}

# Test 1: Check if all critical files exist
test_file_structure() {
    section "Test 1: File Structure"
    
    local files=(
        ".profile"
        ".gitconfig"
        "common/apps.sh"
        "common/aliases.sh"
        "common/ohmyzsh.sh"
        "common/ohmybash.sh"
        "common/starship.sh"
        "common/Brewfile.common"
        "config/starship.toml"
        "config/wezterm.lua"
    )
    
    for file in "${files[@]}"; do
        if [ -f "$DOTFILES_DIR/$file" ]; then
            pass "File exists: $file"
        else
            fail "File missing: $file"
        fi
    done
}

# Test 2: Shell script syntax validation
test_shell_syntax() {
    section "Test 2: Shell Script Syntax"
    
    local shell_files=(
        ".profile"
        "common/apps.sh"
        "common/aliases.sh"
        "common/ohmyzsh.sh"
        "common/ohmybash.sh"
        "common/starship.sh"
        "common/bashit.sh"
        "common/zinit.sh"
    )
    
    for file in "${shell_files[@]}"; do
        if [ ! -f "$DOTFILES_DIR/$file" ]; then
            warn "Skipping $file (not found)"
            continue
        fi
        
        if bash -n "$DOTFILES_DIR/$file" 2>/dev/null; then
            pass "Syntax OK: $file"
        else
            fail "Syntax error in: $file"
        fi
    done
}

# Test 3: ShellCheck (if available)
test_shellcheck() {
    section "Test 3: ShellCheck Analysis"
    
    if ! command -v shellcheck &> /dev/null; then
        warn "shellcheck not installed, skipping"
        return
    fi
    
    local shell_files=(
        "common/apps.sh"
        "common/aliases.sh"
        "common/starship.sh"
    )
    
    for file in "${shell_files[@]}"; do
        if [ ! -f "$DOTFILES_DIR/$file" ]; then
            continue
        fi
        
        # Ignore some warnings that are acceptable in dotfiles
        if shellcheck -e SC1090,SC1091,SC2148 "$DOTFILES_DIR/$file" &>/dev/null; then
            pass "ShellCheck OK: $file"
        else
            warn "ShellCheck warnings in: $file (run 'shellcheck $file' for details)"
        fi
    done
}

# Test 4: TOML syntax validation
test_toml_syntax() {
    section "Test 4: TOML File Validation"
    
    local toml_files=(
        "config/starship.toml"
    )
    
    for file in "${toml_files[@]}"; do
        if [ ! -f "$DOTFILES_DIR/$file" ]; then
            warn "Skipping $file (not found)"
            continue
        fi
        
        # Check if we have a TOML validator
        if command -v python3 &> /dev/null; then
            if python3 -c "import tomllib" 2>/dev/null || python3 -c "import tomli" 2>/dev/null; then
                if python3 -c "
import sys
try:
    import tomllib
except ImportError:
    try:
        import tomli as tomllib
    except ImportError:
        sys.exit(1)
with open('$DOTFILES_DIR/$file', 'rb') as f:
    tomllib.load(f)
" 2>/dev/null; then
                    pass "TOML valid: $file"
                else
                    fail "TOML invalid: $file"
                fi
            else
                warn "No TOML parser available for $file"
            fi
        else
            warn "Python3 not available, skipping TOML validation"
            break
        fi
    done
}

# Test 5: Lua syntax validation
test_lua_syntax() {
    section "Test 5: Lua File Validation"
    
    if [ ! -f "$DOTFILES_DIR/config/wezterm.lua" ]; then
        warn "wezterm.lua not found"
        return
    fi
    
    if command -v luac &> /dev/null; then
        if luac -p "$DOTFILES_DIR/config/wezterm.lua" &>/dev/null; then
            pass "Lua syntax OK: config/wezterm.lua"
        else
            fail "Lua syntax error: config/wezterm.lua"
        fi
    elif command -v lua &> /dev/null; then
        if lua -e "dofile('$DOTFILES_DIR/config/wezterm.lua')" &>/dev/null; then
            pass "Lua syntax OK: config/wezterm.lua"
        else
            warn "Lua validation inconclusive: config/wezterm.lua"
        fi
    else
        warn "Lua not installed, skipping Lua validation"
    fi
}

# Test 6: Source shell files without errors
test_source_files() {
    section "Test 6: Source Shell Files"
    
    # Create a temporary test environment
    export HOME="${HOME:-/tmp/test-home}"
    export DOTFILES_DIR="$DOTFILES_DIR"
    export ZSH="$HOME/.oh-my-zsh"
    export ZSH_CUSTOM="$ZSH/custom"
    
    # Test .profile (with some mocked dependencies)
    if bash -c "
        source '$DOTFILES_DIR/.profile' 2>/dev/null || exit 1
    " 2>/dev/null; then
        pass "Can source: .profile"
    else
        warn "Cannot source .profile (may need dependencies)"
    fi
    
    # Test individual component files
    local files=(
        "common/aliases.sh"
    )
    
    for file in "${files[@]}"; do
        if [ ! -f "$DOTFILES_DIR/$file" ]; then
            continue
        fi
        
        if bash -c "source '$DOTFILES_DIR/$file' 2>/dev/null || exit 1" 2>/dev/null; then
            pass "Can source: $file"
        else
            warn "Cannot source: $file (may need dependencies)"
        fi
    done
}

# Test 7: Check Brewfile syntax
test_brewfile() {
    section "Test 7: Brewfile Validation"
    
    local brewfiles=(
        "common/Brewfile.common"
        "common/Brewfile.mac"
    )
    
    for file in "${brewfiles[@]}"; do
        if [ ! -f "$DOTFILES_DIR/$file" ]; then
            warn "Skipping $file (not found)"
            continue
        fi
        
        # Basic syntax check - look for common issues
        if grep -E '^(tap|brew|cask|mas|vscode) ' "$DOTFILES_DIR/$file" > /dev/null; then
            pass "Brewfile syntax OK: $file"
        else
            warn "Brewfile may be empty or malformed: $file"
        fi
    done
}

# Test 8: Check for common issues
test_common_issues() {
    section "Test 8: Common Issues Check"
    
    # Check for hardcoded paths
    if grep -r "/Users/asamtsevich" "$DOTFILES_DIR" --exclude-dir=.git --exclude="*.md" --exclude="test.sh" &>/dev/null; then
        warn "Found hardcoded user paths (should use \$HOME or ~)"
    else
        pass "No hardcoded user paths found"
    fi
    
    # Check for trailing whitespace in shell files
    local has_trailing=false
    while IFS= read -r -d '' file; do
        if grep -q '[[:space:]]$' "$file"; then
            has_trailing=true
            break
        fi
    done < <(find "$DOTFILES_DIR" -type f \( -name "*.sh" -o -name ".profile" \) -print0)
    
    if [ "$has_trailing" = false ]; then
        pass "No trailing whitespace in shell files"
    else
        warn "Found trailing whitespace in some shell files"
    fi
    
    # Check for proper shebangs
    local missing_shebang=false
    for file in "$DOTFILES_DIR"/common/*.sh; do
        if [ -f "$file" ]; then
            if ! head -n1 "$file" | grep -q '^#!'; then
                missing_shebang=true
                break
            fi
        fi
    done
    
    if [ "$missing_shebang" = false ]; then
        pass "Shell scripts have proper shebangs"
    else
        warn "Some shell scripts missing shebangs (acceptable for sourced files)"
    fi
}

# Test 9: README validation
test_readme() {
    section "Test 9: README Validation"
    
    if [ ! -f "$DOTFILES_DIR/README.md" ]; then
        fail "README.md not found"
        return
    fi
    
    pass "README.md exists"
    
    # Check for important sections
    local sections=(
        "Installation"
        "Homebrew"
        "Terminal"
    )
    
    for section in "${sections[@]}"; do
        if grep -qi "$section" "$DOTFILES_DIR/README.md"; then
            pass "README contains: $section"
        else
            warn "README missing section: $section"
        fi
    done
}

# Main execution
main() {
    echo "======================================"
    echo "  Dotfiles Test Suite"
    echo "======================================"
    echo "Testing: $DOTFILES_DIR"
    echo ""
    
    test_file_structure
    test_shell_syntax
    test_shellcheck
    test_toml_syntax
    test_lua_syntax
    test_source_files
    test_brewfile
    test_common_issues
    test_readme
    
    # Summary
    echo ""
    echo "======================================"
    echo "  Test Summary"
    echo "======================================"
    echo -e "${GREEN}Passed:${NC} $TESTS_PASSED"
    echo -e "${RED}Failed:${NC} $TESTS_FAILED"
    echo ""
    
    if [ $TESTS_FAILED -eq 0 ]; then
        echo -e "${GREEN}All tests passed!${NC}"
        exit 0
    else
        echo -e "${RED}Some tests failed!${NC}"
        exit 1
    fi
}

main "$@"
