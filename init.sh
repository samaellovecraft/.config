#!/bin/bash

dotfiles_dir="$PWD"
config_dir="$HOME/.config"

homelist=(".zshrc")
blacklist=("init.sh" ".git" ".gitignore" "wallpapers" ".ascii.art" ".colorized-ascii.art")

# Function to check if an item is in a list
contains() {
    local list=("$@")
    local item="${list[-1]}"
    unset list[-1]
    for i in "${list[@]}"; do
        if [[ "$i" == "$item" ]]; then
            return 0
        fi
    done
    return 1
}

# Iterate through each item in the .dotfiles directory
for item in "$dotfiles_dir"/{*,.*}; do
    # Extract the name of the item (without the path)
    name=$(basename "$item") 
    
    if contains "${blacklist[@]}" "$name"; then
        continue
    fi
    
    if contains "${homelist[@]}" "$name"; then
        # Remove the existing ~/$HOME/$name item (if it exists)
        #rm -rf "$HOME/$name"
        # Create a symbolic link from ~/.dotfiles/$name to ~/$HOME/$name
        #ln -s "$HOME/$name" "$config_dir/$name"
        continue
    fi

    echo "Processing $name..."
    # Remove the existing ~/.config/$name item (if it exists)
    rm -rf "$config_dir/$name"
    # Create a symbolic link from ~/.dotfiles/$name to ~/.config/$name
    ln -s "$dotfiles_dir/$name" "$config_dir/$name"
done

echo "Symbolic links created successfully!"

