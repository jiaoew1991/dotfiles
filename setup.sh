current=`pwd`
ln -s $current/zshrc ~/.zshrc
ln -s $current/editorconfig ~/.editorconfig
ln -s $current/init.lua ~/.config/nvim/init.lua
ln -s $current/lua ~/.config/nvim/lua
ln -s $current/wezterm.lua ~/.config/wezterm/wezterm.lua

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fi


