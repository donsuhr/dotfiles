# Install

## apt packages

```bash
  sudo apt install curl fzf tmux zsh git rg vim neovim \
        zsh-autosuggestions zsh-syntax-highlighting \
        build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev python-openssl
```

In `.zshrc`, source the two zsh plugins directly (apt installs them to a fixed
path, no `brew --prefix` needed):

```bash
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # recommended last
```

## rust (rustup)

```bash
curl https://sh.rustup.rs -sSf | sh
```

## cargo packages

```bash
cargo install starship lsd cargo-outdated zoxide bat git-delta
```

## lazygit

Not packaged in apt; install the release binary directly
([instructions](https://github.com/jesseduffield/lazygit#installation)):

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## asdf

Not packaged in apt; install the release binary directly
([instructions](https://asdf-vm.com/guide/getting-started.html)):

```bash
curl -L https://github.com/asdf-vm/asdf/releases/latest/download/asdf-linux-amd64.tar.gz | tar -xz -C /usr/local/bin
```

See `from-clean-install.md` for example plugin/version usage.

## cspell global config

Symlink the shared config (cspell reads `~/.config/cspell/cspell.json`):

```bash
ln -s ~/dotfiles/config/cspell ~/.config/cspell
```
