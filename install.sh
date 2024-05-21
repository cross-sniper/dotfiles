#!/bin/bash

# Function to install configuration files
installConf() {
    local file_origin=$(pwd)/$1
    local destination=~/$1

    if [ -e "${destination}" ]; then
        echo "Skipping ${destination} (already exists)..."
    else
        mkdir -p "$(dirname "${destination}")"

        if ln -s "${file_origin}" "${destination}"; then
            echo "Installed ${file_origin} at ${destination}"
        else
            echo "Failed to install ${file_origin} at ${destination}"
        fi
    fi
}

# Install configuration files
installConf .zshrc # zsh config
installConf .alacritty.toml # alacritty config

# Install tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
    if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
        echo "tmux plugin manager installed successfully"
    else
        echo "Failed to install tmux plugin manager"
    fi
else
    echo "tmux plugin manager already installed"
fi

installConf .tmux.conf # tmux config
installConf .config/nvim # neovim config
installConf .config/i3 # i3 config

# Check for alacritty-themes
if [ ! -d "/usr/lib/node_modules/alacritty-themes/" ]; then
    echo "You might need to install \"alacritty-themes\""
    echo "Opening https://github.com/rajasegar/alacritty-themes"
    if command -v xdg-open > /dev/null; then
        xdg-open "https://github.com/rajasegar/alacritty-themes"
    elif command -v open > /dev/null; then
        open "https://github.com/rajasegar/alacritty-themes"
    else
        echo "Please open the URL manually: https://github.com/rajasegar/alacritty-themes"
    fi
fi

echo "i3 has a lot more stuff on it, check the .config/i3/config file"
