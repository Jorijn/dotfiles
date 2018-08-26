#!/usr/bin/env bash

# get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link the dotfiles
ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore" ~
ln -sf "$DOTFILES_DIR/.vimrc" ~
ln -sf "$DOTFILES_DIR/.vim_runtime" ~
ln -sf "$DOTFILES_DIR/.fzf.zsh" ~
ln -sf "$DOTFILES_DIR/.zshrc" ~
ln -sf "$DOTFILES_DIR/.oh-my-zsh" ~
ln -sf "$DOTFILES_DIR/.zsh_aliases" ~
ln -sf "$DOTFILES_DIR/.sleep" ~
ln -sf "$DOTFILES_DIR/.wakeup" ~
ln -sf "$DOTFILES_DIR/.curlrc" ~

# setup GnuPG
mkdir -p ~/.gnupg
ln -sf "$DOTFILES_DIR/gpg.conf" ~/.gnupg/
ln -sf "$DOTFILES_DIR/gpg-agent.conf" ~/.gnupg/

# install Brewfile
brew bundle

# install global npm modules
# dump: npm list -g --depth=0
npm install -g fsevents ghost-cli npm pure-prompt yarn
