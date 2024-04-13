#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew install zsh \
  chezmoi \
  git \
  cmake \
  tmux reattach-to-user-namespace \
  mosh \
  tig \
  gh \
  editorconfig \
  direnv \
  rbenv ruby-build \
  nodenv \
  rye uv \
  boost \
  icu4c \
  ghq \
  jq \
  awscli \
  goenv \
  icu4c \
  pt \
  peco \
  git-secrets

brew tap universal-ctags/universal-ctags
brew install universal-ctags

# https://aerolite.dev/applite/index.html
brew install --cask applite

# rye setting
# enable global setting
rye config --set-bool behavior.use-uv=true
rye config --set-bool behavior.global-python=true
rye fetch
