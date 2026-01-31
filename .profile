## Languages
export LANG=en_US.utf-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -z "$HOME" ]; then
    HOME="$(cd ~ && pwd)"
fi

DOTFILES_DIR="$HOME/.dotfiles"


if [ -d "$DOTFILES_DIR" ]; then

    # AI API KEYS
    if [ -f "$DOTFILES_DIR/api_keys.sh" ]; then
        . "$DOTFILES_DIR/api_keys.sh"
    fi

    # common
    if [ -f "$DOTFILES_DIR/common/apps.sh" ]; then
        . "$DOTFILES_DIR/common/apps.sh"
    fi

    # aliases
    if [ -f "$DOTFILES_DIR/common/aliases.sh" ]; then
        . "$DOTFILES_DIR/common/aliases.sh"
    fi

    # local
    if [ -f "$DOTFILES_DIR/local.sh" ]; then
        . "$DOTFILES_DIR/local.sh"
    fi
fi
