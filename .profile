## Languages
export LANG=en_US.utf-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[[ -f ~/.dotfiles/common/apps.sh ]]     && source ~/.dotfiles/common/apps.sh
[[ -f ~/.dotfiles/common/aliases.sh ]]  && source ~/.dotfiles/common/aliases.sh

[[ -f ~/.dotfiles/local.sh ]] && source ~/.dotfiles/local.sh
