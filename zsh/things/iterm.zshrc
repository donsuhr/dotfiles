export TERM=xterm-256color
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
LS_COLORS=$LS_COLORS'ow=01;04;35:'
export LS_COLORS
# ------------------------------------------------------------

if [[ "${ITERM_PROFILE}" =~ dark ]]
then
    export BAT_THEME="Nord"
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
  else 
    export BAT_THEME="Monokai Extended Light"
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=188"
fi
