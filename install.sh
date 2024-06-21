#!/bin/bash
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Install tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
    if command_exists git; then
        if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
            echo "tmux plugin manager installed successfully"
        else
            echo "Failed to install tmux plugin manager"
        fi
    else
        echo "git is not installed. Please install git to continue."
        exit 1
    fi
else
    echo "tmux plugin manager already installed"
fi

# Check for alacritty-themes
if [ ! -d "/usr/lib/node_modules/alacritty-themes/" ]; then
    echo "You might need to install \"alacritty-themes\""
    echo "Opening https://github.com/rajasegar/alacritty-themes"
    if command_exists xdg-open; then
        xdg-open "https://github.com/rajasegar/alacritty-themes"
    elif command_exists open; then
        open "https://github.com/rajasegar/alacritty-themes"
    else
        echo "Please open the URL manually: https://github.com/rajasegar/alacritty-themes"
    fi
fi

# Required i3 configuration files
echo "i3's config needs:"
files=("alacritty" "dunst" "nitrogen" "picom" "network-manager-applet" "blueman-applet" "xfce4-panel")
for file in "${files[@]}"; do
    echo "-  $file"
done

echo "also, install nerd fonts"

# Ensure stow is installed and use it to manage dotfiles
if ! command_exists stow; then
    echo "You need to install stow to continue"
    exit 1
else
    stow .
fi
echo "installing vim plug"


# Install tmux plugin manager
if [ ! -d ~/.vim/autoload/plug.vim ]; then
    if command_exists curl; then
        if curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ; then
            echo "vim (plug)in manager installed successfully"
        else
            echo "Failed to install vim (plug)in manager"
        fi
    else
        echo "curl is not installed. Please install git to continue."
        exit 1
    fi
else
    echo "tmux plugin manager already installed"
fi


# Auto install Vim plugins
if command_exists vim; then
    vim +PlugInstall +qall
    echo "Vim plugins installed successfully"
else
    echo "vim is not installed. Please install vim to continue."
    exit 1
fi

# Ensure Neovim is installed and set up NvChad
if command_exists nvim; then
    nvim +qall
    echo "Neovim (NvChad) setup completed"
else
    echo "nvim is not installed. Please install Neovim to continue."
    exit 1
fi
