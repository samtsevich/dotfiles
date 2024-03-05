#########
## Shared
#########

# lsDeluxe
    alias ls='lsd --group-directories-first'
    alias l='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls --tree'

# confirm before overwriting something
    alias cp="cp -i"
    alias mv='mv -i'
    alias rm='rm -i'

# easier to read disk
    alias df='df -h'     # human-readable sizes
    alias free='free -m' # show sizes in MB

# Nvim
    alias vi="nvim"
    alias vim="nvim"
    alias view="nvim -R"
    alias vimdiff="nvim -d"

# TMUX
    # Attaches tmux to the last session; creates a new session if none exists.
    alias t='tmux attach || tmux new-session'
    # Attaches tmux to a session (example: ta portal)
    alias ta='tmux attach -t'
    # Creates a new session
    alias tn='tmux new-session'
    # Lists all ongoing sessions
    alias tl='tmux list-sessions'


# HTOP
    alias htopu='htop --user=$USER'

