# Author : Lorenzo

echo "--- vim ------------"

# ~/.vimrc
# curl -fsSL https://raw.githubusercontent.com/zetatez/cfgs/main/dots/vimrc > ~/.vimrc
mv ~/.vimrc ~/.vimrc.bk
ln ~/archlinux.cfg/.vimrc ~/.vimrc

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &

# install vim plugs
vim +PlugInstall &

# startify
mv ~/.vim/plugged/vim-startify/autoload/startify/fortune.vim ~/.vim/plugged/vim-startify/autoload/startify/fortune.vim.bk
ln ~/archlinux.cfg/.vim-startify-fortune.vim ~/.vim/plugged/vim-startify/autoload/startify/fortune.vim

echo "--- vim done--------"


