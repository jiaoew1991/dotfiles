current=`pwd`
ln -s $current/.vimrc ~/.vimrc
ln -s $current/.editorconfig ~/.editorconfig
mkdir ~/.vim/bundle
ln -s $current/vundle ~/.vim/bundle/Vundle.vim

vim -E -c PluginInstall -c qall!
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang
cd ~/.vim/bundle/tern_for_vim
npm install
