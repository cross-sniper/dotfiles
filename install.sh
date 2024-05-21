#!/usr/bin/bash
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

installConf .zshrc
installConf .alacritty.toml
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux plugin manager allready installed"
fi
installConf .tmux.conf
installConf .config/nvim
