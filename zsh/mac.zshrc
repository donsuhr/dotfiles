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
export FIREFOX_BIN="/Applications/_internet/Firefox.app/Contents/MacOS/firefox-bin"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

source /usr/local/opt/fzf/shell/completion.zsh 2> /dev/null
source /usr/local/opt/fzf/shell/key-bindings.zsh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

. ~/.asdf/plugins/java/set-java-home.zsh

