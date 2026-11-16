#!/usr/bin/env bash
#
# install.sh — установить dotfiles на новую машину.
#
# Делает:
#   1. Бэкапит существующие конфиги в ~/.dotfiles-backup-<дата>
#   2. Создаёт symlinks на конфиги из репо
#   3. Копирует примеры local.sh / api_keys.sh (если ещё не созданы)
#   4. Прогоняет Brewfile через brew bundle
#
# Откат: вернуть файлы из ~/.dotfiles-backup-<дата> и удалить symlinks.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

info()  { echo -e "\033[1;34m==>\033[0m $*"; }
ok()    { echo -e "\033[1;32m✓\033[0m $*"; }
warn()  { echo -e "\033[1;33m!\033[0m $*"; }

info "Dotfiles installer"
info "Репо: $DOTFILES_DIR"
info "Бэкап будет в: $BACKUP_DIR"

# ---------------------------------------------------------------------------
# 1. Бэкап существующих конфигов (только обычные файлы, не symlinks)
# ---------------------------------------------------------------------------
mkdir -p "$BACKUP_DIR"

backup_if_present() {
    local src="$1"
    if [ -e "$src" ] && [ ! -L "$src" ]; then
        local dst="$BACKUP_DIR/$src"
        mkdir -p "$(dirname "$dst")"
        mv "$src" "$dst"
        ok "бэкап: $src -> $dst"
    fi
}

backup_if_present "$HOME/.profile"
backup_if_present "$HOME/.zshrc"
backup_if_present "$HOME/.bashrc"
backup_if_present "$HOME/.gitconfig"
backup_if_present "$HOME/.config/starship.toml"
backup_if_present "$HOME/.wezterm.lua"
backup_if_present "$HOME/.config/ghostty/config"

# ---------------------------------------------------------------------------
# 2. Symlinks
# ---------------------------------------------------------------------------
info "Создаю symlinks"

ln -sfn "$DOTFILES_DIR/.profile"          "$HOME/.zshrc"
ln -sfn "$DOTFILES_DIR/.profile"          "$HOME/.bashrc"
ln -sfn "$DOTFILES_DIR/.gitconfig"        "$HOME/.gitconfig"
ln -sfn "$DOTFILES_DIR/config/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "$DOTFILES_DIR/config/wezterm.lua"   "$HOME/.wezterm.lua"
mkdir -p "$HOME/.config/ghostty"
ln -sfn "$DOTFILES_DIR/config/ghostty"       "$HOME/.config/ghostty/config"

ok "symlinks созданы"

# ---------------------------------------------------------------------------
# 3. Примеры локальных файлов (не перезаписывают существующие)
# ---------------------------------------------------------------------------
if [ ! -f "$DOTFILES_DIR/local.sh" ]; then
    cp -n "$DOTFILES_DIR/local.sh.example" "$DOTFILES_DIR/local.sh" 2>/dev/null || true
    ok "local.sh создан из примера"
fi
if [ ! -f "$DOTFILES_DIR/api_keys.sh" ]; then
    cp -n "$DOTFILES_DIR/api_keys.sh.example" "$DOTFILES_DIR/api_keys.sh" 2>/dev/null || true
    ok "api_keys.sh создан из примера"
fi

# ---------------------------------------------------------------------------
# 4. Brew packages
# ---------------------------------------------------------------------------
if command -v brew &>/dev/null; then
    info "Установка пакетов Brewfile.common"
    brew bundle --file="$DOTFILES_DIR/common/Brewfile.common"
    ok "Brewfile.common установлен"

    if [ -f "$DOTFILES_DIR/common/Brewfile.mac" ]; then
        info "Установка пакетов Brewfile.mac"
        brew bundle --file="$DOTFILES_DIR/common/Brewfile.mac"
        ok "Brewfile.mac установлен"
    fi
else
    warn "brew не найден — пропускаю установку пакетов"
fi

# ---------------------------------------------------------------------------
# Готово
# ---------------------------------------------------------------------------
ok "Готово. Перезапустите шелл или выполните: source ~/.zshrc"
warn "Если что-то пошло не так — файлы из бэкапа: $BACKUP_DIR"
