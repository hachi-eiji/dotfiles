fpath=($fpath $HOME/.zsh-functions/)

autoload -U compinit && compinit

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# ディレクトリ名を入力するだけで移動
setopt auto_cd
# 同じ高さのディレクトリに移動するときに../打たなくてよい
cdpath=(.. ~)
# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd
# コマンド訂正
setopt correct
# 補完候補を詰めて表示する
setopt list_packed
# 補完候補表示時などにピッピとビープ音をならないように設定
setopt nolistbeep
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# share
setopt share_history
setopt hist_no_store
# 重複を記録しない
setopt hist_ignore_dups

function print_known_hosts (){ 
if [ -f $HOME/.ssh/known_hosts ]; then
cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1 
fi
}
_cache_hosts=($( print_known_hosts ))

## source peco function
source $HOME/.peco_function.zsh

# nodejs setting
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init - --no-rehash)"

MAC_VIM='/Applications/MacVim.app/Contents/MacOS/Vim'
if [ -e "$MAC_VIM" ]; then
  alias vi="env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"\$@\""
  alias vim="env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"\$@\""
  export EDITOR="env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim"
else
  export EDITOR=vim
fi

export SHELL='/opt/homebrew/bin/zsh'
export GOPATH=$HOME/.go/current
# User configuration
export PATH=$HOME/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH:$GOPATH/bin:$GOROOT/bin
#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"
eval "$(direnv hook zsh)"
export PATH="$PATH:$HOME/.phpenv/bin"
eval "$(phpenv init - --no-rehash)"
eval "$(goenv init - --no-rehash)"

export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# export MANPATH="/usr/local/man:$MANPATH"
path=(
    /opt/*/(s|)bin(N-/)
    $path
)

# http://qiita.com/delphinus/items/b04752bb5b64e6cc4ea9
export LESS='-g -i -M -R -W -N -z-4 -x4'
# rubocop
export RUBOCOP_OPTS='-D -S -E'

alias tmux='tmux -u'
alias t='tmux'
alias tad='tmux a -d -t'
alias tl='tmux list-sessions'
alias ls='ls -G'
alias ll='ls -tlr'
alias grum='git fetch upstream && git rebase upstream/master'
alias push-pr='gpsup && hub pull-request -o'
test -e ~/.tmuxinator/tmuxinator.zsh && source ~/.tmuxinator/tmuxinator.zsh

# hub setting
#alias git='hub'

# ctr-sがきかない対策
stty -ixoff
stty stop undef
stty start undef

## cdr system stuff.
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
zstyle ':filter-select:highlight' matched fg=yellow,standout
zstyle ':filter-select' max-lines 10 # use 10 lines for filter-select
zstyle ':filter-select' max-lines -10 # use $LINES - 10 for filter-select
zstyle ':filter-select' rotate-list yes # enable rotation for filter-select
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search
zstyle ':filter-select' extended-search yes # see below
typeset -U name_of_the_variable

# The next line updates PATH for the Google Cloud SDK.
GCP_ZSH="$HOME/google-cloud-sdk/path.zsh.inc"
test -e $GCP_ZSH && source $GCP_ZSH

# The next line enables shell command completion for gcloud.
GCP_COMP="$HOME/google-cloud-sdk/completion.zsh.inc"
test -e $GCP_COMP && source $GCP_COMP

AWS_COMPLETER="/usr/local/bin/aws_zsh_completer.sh"
test -e $AWS_COMPLETER && source $AWS_COMPLETER
