export TERM=xterm-256color
unsetopt LIST_BEEP
export KEYTIMEOUT=1

unsetopt nomatch

FZF_DEFAULT_OPTS=
FZF_DEFAULT_OPTS+=" --ansi" 
FZF_DEFAULT_OPTS+=" --preview-window 'right:60%'" 
FZF_DEFAULT_OPTS+=" --bind up:preview-up,down:preview-down" 
FZF_DEFAULT_OPTS+=" --preview 'bat --color=always --italic-text=always --style=numbers,changes,header --line-range :300 {} '"
export FZF_DEFAULT_OPTS

#export BAT_STYLE="plain"
export BAT_THEME="Monokai Extended Light"

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
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=188"

plugins=(vi-mode zsh-syntax-highlighting z zsh-autosuggestions)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

LS_COLORS=$LS_COLORS'ow=01;04;35:'
export LS_COLORS

bindkey '^\ ' autosuggest-accept
