# Function to extract the plugin name from a URL or full path

_get_plugin_name() {
    local full_path="$1"
    local plugin_name

    # Extract the plugin name from the URL or path
    plugin_name=$(basename "$full_path" .git)
    
    echo "$plugin_name"
}

# Function to add a plugin
add_plugin() {
    local _name="$1"
    local url
    local plugin_name
    local plugin_dir

    # Check if _name starts with a URL (http:// or https://)
    if [[ ! $_name =~ ^https?:// ]]; then
        # Assume it's a GitHub repository and prepend the base URL
        url="https://github.com/$_name.git"
    else
        url="$_name"
    fi

    # Get the plugin name from the URL
    plugin_name=$(_get_plugin_name "$url")

    # Directory where plugins will be stored
    if [ -z "$PLUGIN_HOME" ]; then
        PLUGIN_HOME="$HOME/.config/zsh/plugins"
    fi

    # Check if the plugin directory exists, if not, create it
    if [ ! -d "$PLUGIN_HOME" ]; then
        mkdir -p "$PLUGIN_HOME"
    fi

    plugin_dir="$PLUGIN_HOME/$plugin_name"

    # Clone the plugin into the plugin directory if it doesn't already exist
    if [ ! -d "$plugin_dir" ]; then
        echo "Cloning plugin $plugin_name from $url..."
        git clone "$url" "$plugin_dir"
    fi

    # Source the plugin files if they exist
    if [ -d "$plugin_dir" ]; then
        if [ -f "$plugin_dir/$plugin_name.plugin.zsh" ]; then
            source "$plugin_dir/$plugin_name.plugin.zsh"
        fi
        if [ -f "$plugin_dir/$plugin_name.zsh" ]; then
            source "$plugin_dir/$plugin_name.zsh"
        fi
    fi
}

# Function to add a completion script
add_completion() {
    local _name="$1"
    local url
    local plugin_name
    local plugin_dir

    # Check if _name starts with a URL (http:// or https://)
    if [[ ! $_name =~ ^https?:// ]]; then
        # Assume it's a GitHub repository and prepend the base URL
        url="https://github.com/$_name.git"
    else
        url="$_name"
    fi

    # Get the plugin name from the URL
    plugin_name=$(_get_plugin_name "$url")

    # Directory where completions will be stored
    if [ -z "$COMPLETIONS_DIR" ]; then
        COMPLETIONS_DIR="$HOME/.config/zsh/completions"
    fi

    # Check if the completions directory exists, if not, create it
    if [ ! -d "$COMPLETIONS_DIR" ]; then
        mkdir -p "$COMPLETIONS_DIR"
    fi

    plugin_dir="$COMPLETIONS_DIR/$plugin_name"

    # Clone the completion script into the completion directory if it doesn't already exist
    if [ ! -d "$plugin_dir" ]; then
        echo "Cloning completion script $plugin_name from $url..."
        git clone "$url" "$plugin_dir"
    fi

    # Check if fpath contains plugin_dir, if not, add it
    if [[ ":$fpath:" != *":$plugin_dir:"* ]]; then
        fpath+="$plugin_dir"
    fi
}
