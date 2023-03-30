function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin.omp.json)"

# AWS Configuration file with access id and secret access key
export AWS_CONFIG_FILE="~/.aws/config"

# Dotfile git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias c="clear"
alias zconfig="nvim ~/.zshrc"
alias bconfig="nvim ~/.bashrc"
alias tconfig="nvim ~/.tmux.conf"
alias reload="source ~/.zshrc"
alias vim="nvim"

# Git aliases
alias gc="git commit -v"
alias gco="git checkout"
alias ga="git add"
alias gaa="git add ."
alias gs="git status --short"
alias gp="git push"
alias gpo="git push -u origin"
alias gd="git diff"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias grr="git restore"

# PeopleGrove workspace
alias pg-api="cd ~/Documents/campuskudos-api/ && nvm use 16.14.2 && yarn run local"
alias pg-web="cd ~/Documents/campuskudos-web/ && nvm use 14.19.1 && gulp lite"
alias pg-web-r="cd ~/Documents/campuskudos-web/client-v2/ && nvm use 14.19.1 && yarn start"
alias pg-web-bf="cd ~/Documents/campuskudos-web/ && nvm use 14.19.1 && yarn run both-fast"
alias pg-web-bs="cd ~/Documents/campuskudos-web/ && nvm use 14.19.1 && yarn run both-slow"
alias cd-pg="cd ~/Documents/"
alias cd-web="cd ~/Documents/campuskudos-web && nvm use 14.19.1"
alias cd-api="cd ~/Documents/campuskudos-api && nvm use 16.14.2"
alias pg-w1="cd ~/Documents/campuskudos-api/ && nvm use 16.14.2 && node workers background"
alias pg-w2="cd ~/Documents/campuskudos-api/ && nvm use 16.14.2 && node workers standard"
alias pg-w3="cd ~/Documents/campuskudos-api/ && nvm use 16.14.2 && node workers task"
alias pg-w4="cd ~/Documents/campuskudos-api/ && nvm use 16.14.2 && node workers worker"
alias pg-super="cd ~/Documents/pg-superadmin-web/ && nvm use 14.19.1 && yarn start"
alias cd-super="cd ~/Documents/pg-superadmin-web && nvm use 14.19.1"
alias gcloud="~/Documents/google-cloud-sdk/bin/gcloud"
alias elasticsearch="~/apps/elasticsearch/bin/elasticsearch"
alias pg-local="cd ~/Documents/campuskudos-web/ && nvm use 14.19.1 && yarn run local"
alias pg-install="cd ~/Documents/campuskudos-web/ && nvm use 14.19.1 && yarn run install-all"


# source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# Pyenv setup
# export PYENV_ROOT="$HOME/.pyenv" 
# export PATH="$PYENV_ROOT/bin:$PATH" 
# eval "$(pyenv init --path)" 
# eval "$(pyenv init -)"

# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/ndk/21.1.6352462/


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/Library/PostgreSQL/15/bin:$PATH"
export PATH="~/apps/elasticsearch/bin:$PATH"
