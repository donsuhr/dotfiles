# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

export CHROME_BIN="/Applications/_internet/Google Chrome.app/Contents/MacOS/Google Chrome"
export FIREFOX_BIN="/usr/local/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox-bin"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

ulimit -n 65536 65536

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# nvm
export NVM_DIR=/Users/bill/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# rvm
alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source /usr/local/opt/fzf/shell/completion.zsh 2> /dev/null
source /usr/local/opt/fzf/shell/key-bindings.zsh
