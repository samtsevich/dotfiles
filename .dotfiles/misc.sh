# Terminus + Sublime
if [ "$TERM_PROGRAM" = "Terminus-Sublime" ]; then
    bindkey "\e[1;3C" forward-word
    bindkey "\e[1;3D" backward-word
fi
