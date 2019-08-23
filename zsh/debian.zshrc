export PY_USER_BIN=$(python -c 'import site; print(site.USER_BASE + "/bin")')
export PATH=$PY_USER_BIN:$PATH

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/zsh/vendor-completions/_fzf 2> /dev/null

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
