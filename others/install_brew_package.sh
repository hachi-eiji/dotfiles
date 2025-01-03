#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew install zsh \
  chezmoi \
  git \
  cmake \
  tig \
  gh \
  editorconfig \
  mise \
  uv \
  boost \
  icu4c \
  ghq \
  jq \
  awscli \
  icu4c \
  pt \
  peco \
  rustup-init \
  git-secrets

brew tap universal-ctags/universal-ctags
brew install universal-ctags

# https://aerolite.dev/applite/index.html
brew install --cask applite

# install Rust(for ruby + YJIT)
rustup-init -y
