#vars/exports
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export EDITOR="helix"
export BROWSER="thorium-browser"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza -n --color=always {} | head -200'"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.libs"
export HOMEBREW_AUTO_UPDATE_SECS=500
export HOMEBREW_NO_INSTALL_CLEANUP=1
export MYVIMRC="~/.vimrc"
export MYNVIMRC="~/.config/nvim/init.lua"
export TWEEGO_PATH="~/.storyformats"
export RUSTC_WRAPPER="sccache"
export MANPAGER=bat
export ODIN_ROOT="$HOME/Downloads/Odin-master/"

# paths
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$PATH:$HOME/bin:$HOME/.config/emacs/bin:~/.local/share/gem/ruby/3.0.0/bin"
export PATH="/opt/brew/opt/pod2man/bin:$PATH"
export PATH="/opt/brew/bin:$PATH"
export PATH=$PATH:~/.local/bin/

# plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1;zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1;zinit light zsh-users/zsh-completions
zinit ice depth=1;zinit light denysdovhan/spaceship-prompt
# zinit ice depth=1;zinit light starship/starship
zinit ice depth=1;zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1;zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit
zinit cdreplay -q
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
# keybinds

bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# history

HISTSIZE=8000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

# functions
kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}

original() {
  if [ $# -eq 0 ]; then
	echo "original:"
	echo "runs the original command, be it in /usr/bin /bin or in some other folder,"
	echo "should work with commands defined by zsh and/or bash"
    echo "Usage: original <command> [arguments]"
    return 1
  fi
  
  # Extract the command and its arguments
  local cmd=$1
  shift
  
  # Use 'command' to bypass aliases and functions
  command $cmd "$@"
}
whoowns() {
  if [ $# -eq 0 ]; then
    echo "whoowns"
    echo " shows you who is the owner of a file or folder"
    echo " e.g: ~/ owner's would be you, $(whoami)"
    echo "whoowns <file or folder>"
    return 1
  fi
  
  stat -c '%U' "$1"
}

# alias
alias ls="exa -l"
alias la="ls -a"
alias rm="yes|original rm"

alias zshconf="$EDITOR ~/.zshrc; echo \"reloaded zsh\";exec zsh"
alias cat="bat"
alias ..="cd .."
alias edit="$EDITOR"
alias gcg="git config --global"
alias gas="ga .; gss" # git add .; git status --short
alias emacscli="emacsclient"
alias ncm="ncmpcpp"
alias tree="tree -C"

# dynamic initialization
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"

# bun completions
[ -s "/home/cross/.bun/_bun" ] && source "/home/cross/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
