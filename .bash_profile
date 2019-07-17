export PS1="gateside @ \W \\$ "
export PATH=$PATH:/Developer/android-sdk-mac_x86/tools:/usr/local/git/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export PATH=$HOME/.npm/bin:$PATH
export NODE_PATH=$HOME/.npm/libraries:$NODE_PATH
export MANPATH=$HOME/.npm/man:$MANPATH

if [[ -s ~/.nvm/nvm.sh ]];
	then source ~/.nvm/nvm.sh
fi

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH="$PATH:$GOPATH/bin"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/kadowakiyu/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/kadowakiyu/google-cloud-sdk/completion.bash.inc'

export PATH=$PATH:/Applications/adt-bundle-mac-x86_64/sdk/platform-tools/

export DIYBOX_DATABASE_PASSWORD=qR8zF7um

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/gates1de/.sdkman"
[[ -s "/Users/gates1de/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gates1de/.sdkman/bin/sdkman-init.sh"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
