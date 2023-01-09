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
  pyenv pyenv-virtualenv \
  boost \
  icu4c \
  ghq \
  jq \
  awscli \
  goenv \
  icu4c \
  pyenv pyenv-virtualenv \
  pt \
  peco \
  git-secrets

brew tap universal-ctags/universal-ctags
brew install universal-ctags
