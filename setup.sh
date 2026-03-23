current="$PWD"

link_file() {
    local src="$1" dst="$2"
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        echo "Backing up existing $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi
    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo "Linked $src -> $dst"
}

link_file "$current/zshrc" ~/.zshrc
link_file "$current/editorconfig" ~/.editorconfig
link_file "$current/init.lua" ~/.config/nvim/init.lua
link_file "$current/lua" ~/.config/nvim/lua
link_file "$current/wezterm.lua" ~/.config/wezterm/wezterm.lua

