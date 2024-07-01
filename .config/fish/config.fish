# vars/exports
set -x GIT_DISCOVERY_ACROSS_FILESYSTEM 1
set -x EDITOR micro
set -x BROWSER thorium-browser
set -x FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
set -x FZF_ALT_C_OPTS "--preview 'eza -n --color=always {} | head -200'"
set -x LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$HOME/.libs"
set -x HOMEBREW_AUTO_UPDATE_SECS 500
set -x HOMEBREW_NO_INSTALL_CLEANUP 1
set -x FONTCONFIG_PATH "/etc/fonts"

set -x MYVIMRC "~/.vimrc"
set -x MYNVIMRC "~/.config/nvim/init.lua"
set -x TWEEGO_PATH "~/.storyformats"
# paths
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $PATH $HOME/bin $HOME/.config/emacs/bin $HOME/.local/share/gem/ruby/3.0.0/bin
set -x PATH /opt/brew/opt/pod2man/bin $PATH
set -x PATH /opt/brew/bin $PATH

# functions
function kitty-reload
    kill -SIGUSR1 (pidof kitty)
end

function original
  if test (count $argv) -eq 0
    echo "original:"
    echo "runs the original command, be it in /usr/bin /bin or in some other folder,"
    echo "should work with commands defined by zsh and/or bash"
    echo "Usage: original <command> [arguments]"
    return 1
  end
  
  set cmd $argv[1]
  set -e argv[1]
  command $cmd $argv
end

function whoowns
  if test (count $argv) -eq 0
    echo "whoowns"
    echo " shows you who is the owner of a file or folder"
    echo " e.g: ~/ owner's would be you, (whoami)"
    echo "whoowns <file or folder>"
    return 1
  end
  stat -c '%U' $argv[1]
end

# aliases
alias ls="exa -l"
alias la="ls -a"
alias zshconf="$EDITOR ~/.zshrc; echo 'reloaded zsh'; exec zsh"
alias cat="bat"
alias ..="cd .."
alias edit="$EDITOR"
alias gcg="git config --global"
alias gas="ga .; gss"
alias emacs="emacsclient"
alias ncm="ncmpcpp"
alias tree="tree -C"

# dynamic initialization
fzf --fish | source
zoxide init --cmd cd fish | source
# dynamic initialization


# bun
set -x BUN_INSTALL $HOME/.bun
set -x PATH $BUN_INSTALL/bin $PATH


function fish_greeting
end

# Start X automatically on login
if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
    startx
end
