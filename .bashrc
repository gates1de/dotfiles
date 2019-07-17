export HADOOP_COMMON_HOME=/usr/local/hadoop
alias dfsls='/usr/local/bin/hadoop dfs -ls'
alias dfslsr='/usr/local/bin/hadoop dfs -lsr'
alias dfsrm='/usr/local/bin/hadoop dfs -rm'
alias dfscat='/usr/local/bin/hadoop dfs -cat'
alias dfsrmr='/usr/local/bin/hadoop dfs -rmr'
alias dfsmkdir='/usr/local/bin/hadoop dfs -mkdir'
alias dfsput='/usr/local/bin/hadoop dfs -put'
alias dfsget='/usr/local/bin/hadoop dfs -get'
alias ls='ls -G'
alias autoconf='/usr/local/Cellar/autoconf/2.69/bin/autoconf'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/gates1de/.sdkman"
[[ -s "/Users/gates1de/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gates1de/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
