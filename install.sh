#!/bin/bash
function installConf(){
    file_origin=$(pwd)/$1
    destination=~/$1

    if [ -e "${destination}" ]; then
        echo "Skipping ${destination} ..."
    else
        mkdir -p "$(dirname "${destination}")"

        ln -s "${file_origin}" "${destination}"
		echo "installed ${file_origin} at ${destination}"

    fi
}

installConf .zshrc # zsh config
installConf .alacritty.toml # alacritty config
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux plugin manager allready installed"
fi

installConf .tmux.conf # tmux config
installConf .config/nvim # neovim config

# themes for alacritty(the one in the config is tokyo night, "/usr/lib/node_modules/alacritty-themes/themes/Tokyonight_Night.toml")
if [ ! -d "/usr/lib/node_modules/alacritty-themes/" ]; then
    echo "you might need to install \"alacritty-themes\""
    echo "opening https://github.com/rajasegar/alacritty-themes"
    xdg-open "https://github.com/rajasegar/alacritty-themes"
fi
