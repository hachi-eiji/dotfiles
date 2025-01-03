# dotfiles

## install font
https://github.com/yuru7/udev-gothic
日本語文書向けをつかう

## pull dotfiles

```
chezmoi init hachi-eiji
```

## install homebrew package

```
./others/install_brew_package.sh

```

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

## install vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

## install oh-my-zsh

```
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
mkdir $ZSH_CUSTOM/plugins/rye
rye self completion -s zsh > $ZSH_CUSTOM/plugins/rye/_rye
```

## apply dotfiles

```
chezmoi apply
```
