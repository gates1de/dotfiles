########################################
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export LANG=ja_JP.UTF-8


########################################
# vim 風キーバインドにする
# bindkey -v


########################################
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


########################################
# プロンプト
autoload -Uz colors; colors
PROMPT="%(?.%{$fg[white]%}.%{$fg[cyan]%})%(?!(๑╹ڡ ╹๑%)!(´;ω ;%)) %B%~$%b%{${reset_color}%} "
PROMPT2="%{$fg[blue]%}%_>%{$reset_color%}%b "
setopt correct
SPROMPT="%{$fg[red]%}%{$suggest%}ʅ（´◔౪◔）ʃ? %B %r じゃないんすか? [n,y,a,e]:%{${reset_color}%}%b "


########################################
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'


# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob


########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward


########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias vim='/usr/local/bin/vim'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

alias lumen='~/.composer/vendor/bin/lumen'

# docker用エイリアス
alias docmac='docker-machine'

# adb
alias adb="$HOME/Library/Android/sdk/platform-tools/adb"

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  # Mac
	alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
# Cygwin
	alias -g C='| putclip'
fi


# OS 別の設定
case ${OSTYPE} in
	darwin*)
		#Mac用の設定
		export CLICOLOR=1
		alias ls='ls -G -F'
	;;
	linux*)
		#Linux用の設定
		alias ls='ls -F --color=auto'
	;;
esac

# tmux 設定
alias tmux="TERM=screen-256color-bce tmux"

########################################
# パス設定

# nvm
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# hub command
function git(){hub "$@"}

# android
export PATH="$PATH:Library/Android/sdk/platform-tools"

# autoconf
alias autoconf='/usr/local/Cellar/autoconf/2.69/bin/autoconf'

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# dyld
export DYLD_LIBRARY_PATH=/opt/intel/composer_xe_2015.3.187/compiler/lib

# gvm
[[ -s "/Users/gates1de/.gvm/scripts/gvm" ]] && source "/Users/gates1de/.gvm/scripts/gvm"

# node
export PATH=$PATH:./node_modules/.bin

# sdkman
# export SDKMAN_DIR="/Users/gates1de/.sdkman"
# [[ -s "/Users/gates1de/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gates1de/.sdkman/bin/sdkman-init.sh"

# golang
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

# google-cloud-sdk
export CLOUDSDK_PYTHON="$(which python)"
# [[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gates1de/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gates1de/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gates1de/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gates1de/google-cloud-sdk/completion.zsh.inc'; fi
