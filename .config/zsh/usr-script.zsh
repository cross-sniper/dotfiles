# Define the command_not_found_handler function
command_not_found_handler() {
    local purple='\e[1;35m'
    local bright='\e[0;1m'
    local green='\e[1;32m'
    local reset='\e[0m'
    
    local cmd="$1"
    printf 'zsh: command not found: %s\n' "$cmd"

    # Check if "thefuck" can correct the command
    if tf; then
        return 0
    fi

    # Try to find the command in Pacman database
    local entries=(
        ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$cmd")"}
    )

    if (( ${#entries[@]} )); then
        printf "${bright}$cmd${reset} may be found in the following packages:\n"
        local pkg=""
        local index=1
        local options=()
        
        for entry in "${entries[@]}"; do
            # (repo package version file)
            local fields=(
                ${(0)entry}
            )
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%d) %s/${bright}%s ${green}%s${reset}\n" "$index" "${fields[1]}" "${fields[2]}" "${fields[3]}"
                options+=("$index:${fields[2]}")
                pkg="${fields[2]}"
                ((index++))
            fi
            printf '    /%s\n' "${fields[4]}"
        done
        
        printf "Which one would you like to install? (Enter the number, ['none' to quit]): "
        read -r selectedNumber
        
        # Validate user input
        if [[ "$selectedNumber" == "none" ]]; then
            echo "No package selected. Exiting."
            return 127
        fi

        local selectedPackage=""
        for option in "${options[@]}"; do
            if [[ "$selectedNumber" == "${option%%:*}" ]]; then
                selectedPackage="${option#*:}"
                break
            fi
        done

        if [[ -n "$selectedPackage" ]]; then
            echo "Installing package $selectedPackage..."
            sudo pacman -S "$selectedPackage"
        else
            echo "Invalid selection. Exiting."
            return 127
        fi
    else
        echo "No suggestions available from Pacman."
    fi
    
    return 127
}
