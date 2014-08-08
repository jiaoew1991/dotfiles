current=`pwd`
ln -s $current/.vimrc ~/.vimrc
ln -s $current/.editorconfig ~/.editorconfig

vim -E -c PluginInstall -c qall!
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang
