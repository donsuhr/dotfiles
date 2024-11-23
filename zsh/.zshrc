export TERM=xterm-256color
export EDITOR="/usr/local/bin/vim"
export ZSH=$HOME/.oh-my-zsh
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
LS_COLORS=$LS_COLORS'ow=01;04;35:'
export LS_COLORS

unsetopt nomatch
unsetopt LIST_BEEP
export KEYTIMEOUT=1
#stop deleting windows
setopt ignoreeof
setopt nocasematch

# ------------------------------------------------------------

if [[ "${ITERM_PROFILE}" =~ dark ]]
then
    export BAT_THEME="Nord"
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
  else 
    export BAT_THEME="Monokai Extended Light"
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=188"
fi
unsetopt nocasematch

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
export ZSH_AUTOSUGGEST_USE_ASYNC=true

# ------------------------------------------------------------

# https://unix.stackexchange.com/questions/477258/how-to-auto-update-custom-plugins-in-oh-my-zsh
plugins=(vi-mode zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------
if [ "$(command -v lsd)" ]; then
    # https://dev.to/22mahmoud/my-terminal-became-more-rusty-4g8l
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='lsd'
    alias la='ls -a'
    alias ll='ls -la'
    alias lt='ls --tree'
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

bindkey '^\ ' autosuggest-accept
alias clr="clear && printf '\e[3J'"

