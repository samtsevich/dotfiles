MYSHELL=`echo $SHELL`
# [[ $MYSHELL == *"zsh"* ]] && echo "Equal" || echo "Not equal"


# Starship
[[ -f ~/.dotfiles/common/starship.sh ]] && source ~/.dotfiles/common/starship.sh

# Zoxide and FZF
if [[ $MYSHELL == *'bash'* ]]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    eval "$(zoxide init bash)"
elif [[ $MYSHELL == *'zsh'* ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    eval "$(zoxide init zsh)"
fi

