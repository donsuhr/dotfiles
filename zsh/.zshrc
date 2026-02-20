export EDITOR="/usr/local/bin/vim"
export ZSH=$HOME/.oh-my-zsh
export BAT_THEME="Nord"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export DISABLE_AUTO_UPDATE="true" # use `omz update` instead

if [[ "$TERM_PROGRAM" == "iTerm.app" ]]
then
  source $HOME/dotfiles/zsh/things/iterm.zshrc
fi

unsetopt LIST_BEEP # dont bell when TAB produces a list
export KEYTIMEOUT=1 # Faster ESC in vim
setopt ignoreeof # stop accidentally deleting windows with CtrlD

# ------------------------------------------------------------

# https://unix.stackexchange.com/questions/477258/how-to-auto-update-custom-plugins-in-oh-my-zsh
plugins=(
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting # recommended last
)
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

