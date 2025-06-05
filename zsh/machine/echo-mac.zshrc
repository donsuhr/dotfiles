DEFAULT_USER="dsuhr"

source $HOME/dotfiles/zsh/.zshrc
source $HOME/dotfiles/zsh/things/browsers.zshrc
source $HOME/dotfiles/zsh/things/daskeyboard.zshrc
source $HOME/dotfiles/zsh/things/fzf.zshrc
source $HOME/dotfiles/zsh/things/nvm.zshrc
source $HOME/dotfiles/zsh/things/nvm-cd-autorun.zshrc

export PATH="$(brew --prefix)/opt/python@3.13/libexec/bin:$PATH"

# Added by Windsurf
export PATH="/Users/bill/.codeium/windsurf/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/dsuhr/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
