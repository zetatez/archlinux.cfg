# Author : Lorenzo

echo "--- nvim ------------"

# ~/.vimrc
# curl -fsSL https://raw.githubusercontent.com/zetatez/cfgs/main/dots/vimrc > ~/.vimrc
rm ~/.config/nvim/init.vim.bk
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bk
ln ~/archlinux.cfg/.config/nvim/init.vim ~/.config/nvim/init.vim

# vim-plug
curl -fLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &

# install vim plugs
nvim +PlugInstall

echo "--- nvim done--------"


