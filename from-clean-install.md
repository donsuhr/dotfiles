# Install

## homebrew

instructions on their [website](http://brew.sh/)
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
`brew tap homebrew/cask-versions`

In a directory with a file named Brewfile run `brew bundle`

```bash
# file named Brewfile

install git certbot bat fzf tmux vim gpg rg awsebcli exa starship readline xz gnupg zoxide
install mongodb
install mysql
install freetype jpeg libpng gd zlib
install coreutils automake autoconf openssl
install libyaml readline libxslt libtool unixodbc
install unzip curl gpg
install rg openssh rsync

cask install quicklook-json qlstephen betterzip qlcolorcode qlmarkdown
cask install qlprettypatch quicklook-csv WebPQuickLook qlimagesize suspicious-package

#peek https://www.bigzlabs.com/peek.html

# _audio
# audacity
# goldenrecords

# _docs
cask install google-backup-and-sync --appdir=/Applications/_docs
cask install banktivity --appdir=/Applications/_docs
cask install bbedit --appdir=/Applications/_docs
cask install calibre --appdir=/Applications/_docs
cask install ichm --appdir=/Applications/_docs
cask install macdown  --appdir=/Applications/_docs
# cask install on-the-job --appdir=/Applications/_docs
# cask install openoffice --appdir=/Applications/_docs
cask install libreoffice --appdir=/Applications/_docs


#_graphics
cask install gimp --appdir=/Applications/_graphics
cask install inkscape --appdir=/Applications/_graphics

# timing : https://updates.timingapp.com/download/Timing-2018.3.2.dmg

# _iNetDev
#  charles (dont use brew, choose alt jdk version)
# visual studio code
cask install dash --appdir=/Applications/_iNetDev
# https://updates.kaleidoscope.app/v2/prod/Kaleidoscope-2.4.2-1455-sep-7-2021.app.zip
cask install kaleidoscope --appdir=/Applications/_iNetDev
cask install postman --appdir=/Applications/_iNetDev
cask install sourcetree --appdir=/Applications/_iNetDev
# cask install tower2 --appdir=/Applications/_iNetDev
cask install https://raw.githubusercontent.com/Homebrew/homebrew-cask-versions/master/Casks/tower2.rb --appdir=/Applications/_iNetDev
cask install webstorm --appdir=/Applications/_iNetDev
cask install versions --appdir=/Applications/_iNetDev
cask install imageoptim --appdir=/Applications/_iNetDev

#internet
cask install firefox --appdir=/Applications/_internet
cask install homebrew/cask-versions/firefox-developer-edition --appdir=/Applications/_internet
install google-chrome --cask --appdir=/Applications/_internet
cask install google-chrome-canary --appdir=/Applications/_internet
cask install lastfm --appdir=/Applications/_internet
install postbox --cask --appdir=/Applications/_internet
cask install transmission --appdir=/Applications/_internet
cask install transmit --appdir=/Applications/_internet
cask install viscosity --appdir=/Applications/_internet
cask install microsoft-teams --appdir=/Applications/_internet

#system
cask install airserver --appdir=/Applications/_system
cask install bitwarden --appdir=/Applications/_system
cask install cleanmymac --appdir=/Applications/_system
cask install duet --appdir=/Applications/_system
# docker
cask install iterm2 --appdir=/Applications/_system
cask install parallels --appdir=/Applications/_system

#video
cask install handbreak --appdir=/Applications/_video
cask install vlc --appdir=/Applications/_video


```

## terminal stuff

### zsh

brew install zsh

### oh-my-zsh

[instructions](https://github.com/robbyrussell/oh-my-zsh)
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### zsh powerlevel10k theme

`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`

### zsh-syntax-highlighting

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

### zsh-autosuggestions

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

### tmux plugin manager

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` after, in
tmux: `Leader I`

### vim plugin manager

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
after :PlugInstall in terminal: `compaudit | xargs chmod g-w,o-w`

### asdf

[instructions](https://asdf-vm.com/#/core-manage-asdf-vm?id=install-asdf-vm)
`git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.7`
`asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git`
`bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring`
`asdf install nodejs 12.13.0`
`asdf global nodejs 12.13.0`
`asdf plugin-add python` `asdf install python 3.8.5`

### enable zsh z plugin

`touch ~/.z`

### set max files

`echo kern.maxfiles=65536 | sudo tee -a /etc/sysctl.conf`
`echo kern.maxfilesperproc=65536 | sudo tee -a /etc/sysctl.conf`
`sudo sysctl -w kern.maxfiles=65536` 
`sudo sysctl -w kern.maxfilesperproc=65536`

### terminal font

[RobotoMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip)
[SauceCodePro](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip)

## Change some defaults

`defaults write com.apple.finder QLEnableTextSelection -bool true`
`defaults write com.apple.Finder AppleShowAllFiles true` `killall Finder`
`defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false`

## Stop upgrade to Catalina

[source](https://apple.stackexchange.com/questions/367995/how-to-block-updates-to-mac-os-x-catalina)
`sudo /usr/sbin/softwareupdate --ignore "macOS Catalina"`
`defaults delete com.apple.preferences.softwareupdate LatestMajorOSSeenByUserBundleIdentifier`
`defaults write com.apple.systempreferences AttentionPrefBundleIDs 0;killall Dock`

## mysql

`ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents`
`launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist`
`mysqladmin -u root password "xxx"`

## php

edit /etc/apache2/httpd.conf
`LoadModule php5_module /usr/local/Cellar/php56/5.6.4/libexec/apache2/libphp5.so`

## jira

- get the [driver](http://dev.mysql.com/downloads/connector/j)
- copy it to jira app /lib
- create the database:
  `CREATE DATABASE jiradb CHARACTER SET utf8 COLLATE utf8_bin;`
- run bin/conf
- copy and edit launchctl file and set its permissions
- `launchctl load ./com.atlassian.jira.plist`
