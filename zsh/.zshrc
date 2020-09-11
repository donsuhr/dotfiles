export TERM=xterm-256color
unsetopt LIST_BEEP
export KEYTIMEOUT=1
export EDITOR="/usr/local/bin/vim"

unsetopt nomatch

#stop deleting windows
setopt ignoreeof

FZF_DEFAULT_OPTS=
FZF_DEFAULT_OPTS+=" --ansi" 
FZF_DEFAULT_OPTS+=" --preview-window 'right:60%'" 
FZF_DEFAULT_OPTS+=" --bind up:preview-up,down:preview-down" 
FZF_DEFAULT_OPTS+=" --preview 'bat --color=always --italic-text=always --style=numbers,changes,header --line-range :300 {} '"
export FZF_DEFAULT_OPTS

fzf_grep_edit(){
  # https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
  if [[ $# == 0 ]]; then
    echo 'Error: search term was not provided.'
    return
  fi
  local match=$(
  rg --column --line-number --no-heading --color=never --hidden --smart-case  $@ |
    fzf --delimiter : \
    --preview "~/dotfiles/zsh/fzf-bat-preview.sh {1} {2}"
  )
  local file=$(echo "$match" | cut -d':' -f1)
  if [[ -n $file ]]; then
    $EDITOR "$file" +$(echo "$match" | cut -d':' -f2)
  fi
}

alias fzfs='fzf_grep_edit'

setopt nocasematch
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

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs root_indicator background_job nvm)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_VI_INSERT_MODE_STRING=""

export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(vi-mode zsh-syntax-highlighting z zsh-autosuggestions)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

LS_COLORS=$LS_COLORS'ow=01;04;35:'
export LS_COLORS

bindkey '^\ ' autosuggest-accept

