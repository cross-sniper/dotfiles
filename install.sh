function installAt(){
    file_origin=$1
    destination=$2

    if [ -L "${destination}" ]; then
        echo "Skipping ${destination} ..."
    else
        ln -s "${file_origin}" "${destination}"
    fi
}

installAt .zshrc ~/.zshrc
