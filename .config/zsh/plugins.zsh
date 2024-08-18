add_plugin zsh-users/zsh-syntax-highlighting
add_plugin zsh-users/zsh-autosuggestions
add_plugin zsh-users/zsh-history-substring-search
add_completion clarketm/zsh-completions
#add_completion lincheney/zsh-command-not-found
add_completion lincheney/fzf-tab-completion

autoload -Uz compinit && compinit
