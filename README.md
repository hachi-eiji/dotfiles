# dotfiles

## install zsh

```bash
sudo vi /etc/shells
# add zsh pass
$ chsh
```

changing chsh

```diff
+ Shell: /bin/zsh
- Shell: /bin/bash
```

## install homebrew package

```
./install_brew_package.sh

```

## install tmux


```
gem install tmuxinator

```

## install vim vundle

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s <repository>/.vimrc.lightline ~/.vimrc.lightline
```

## install oh-my-zsh

```
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
```

## install python

```
CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" \
LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib" \
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7-dev
```

## install phpenv

```
git clone --depth 1 https://github.com/CHH/phpenv.git /tmp/
cd /tmp/phpenv/bin
./phpenv-install.sh
```
## apply dotfiles

```
chezmoi init --apply hachi-eiji
```
