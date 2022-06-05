current=`pwd`
ln -s $current/vimrc ~/.vimrc
ln -s $current/nvimrc ~/.nvimrc
ln -s $current/zshrc ~/.zshrc
ln -s $current/editorconfig ~/.editorconfig
ln -s $current/lvim.lua ~/.config/lvim/config.lua

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    ln -s $current/coc-settings ~/.vim/coc-settings.json
fi


