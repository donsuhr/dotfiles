# Install

- [homebrew](http://brew.sh/)
- [old IE Virtual Machines](https://gist.github.com/zmwangx/e728c56f428bc703c6f6)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- vim plugin manager
  1. `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
  2. `:PlugInstall`

- asdf
  [instructions](https://asdf-vm.com/#/core-manage-asdf-vm?id=install-asdf-vm)
  `asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git`
  `asdf install nodejs 12.13.0` `asdf global nodejs 12.13.0`

- enable zsh z plugin `touch ~/.z`

- terminal font
- - [RobotoMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip)
- - [SauceCodePro](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip)

## Change some defaults

- `defaults write com.apple.Finder AppleShowAllFiles true` `killall Finder`
- have TextEdit open a new document:
  `defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false`
- verbose boot: `sudo nvram boot-args="-v"`
- `defaults write -g KeyRepeat -float 1.5` # normal minimum is 2 (30 ms)
- `defaults write -g NSQuitAlwaysKeepsWindows -bool false` # dont reopen apps
