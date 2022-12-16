function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/material.omp.json)"

# AWS Configuration file with access id and secret access key
export AWS_CONFIG_FILE="~/.aws/config"

# Dotfile git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# alias vim="nvim"
alias zconfig="nvim ~/.zshrc"
alias bconfig="nvim ~/.bashrc"
alias tconfig="nvim ~/.tmux.conf"
alias reload="source ~/.zshrc"

# Git aliases
alias gc="git commit -v"
alias gco="git checkout"
alias ga="git add"
alias gaa="git add ."
alias gs="git status --short"
alias gp="git push"
alias gpo="git push -u origin"


# source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH" 
eval "$(pyenv init --path)" 
eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/ndk/21.1.6352462/


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export AWS_PROFILE=antstack
