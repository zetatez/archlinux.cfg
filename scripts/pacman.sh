# Author : Lorenzo

echo "--- pacman -----------"

echo "run following cmd first!"

sudo ls -l >> /dev/null

sudo pacman -Syyu

sudo pacman -S wget
sudo pacman -S zip
sudo pacman -S unrar
sudo pacman -S unzip
sudo pacman -S tree
sudo pacman -S trash
sudo pacman -S gcc
sudo pacman -S make
sudo pacman -S automake
sudo pacman -S inetutils
sudo pacman -S cliclick
sudo pacman -S boost
sudo pacman -S xgboost
sudo pacman -S python3
sudo pacman -S go
sudo pacman -S go-md2man
sudo pacman -S scala
sudo pacman -S sbt
sudo pacman -S nginx
sudo pacman -S docker-completion
sudo pacman -S docker
sudo pacman -S zsh-completions
sudo pacman -S bash-completion
sudo pacman -S mariadb
# sudo pacman -S mongodb-community@4.4
sudo pacman -S figlet
sudo pacman -S spark
sudo pacman -S you-get
sudo pacman -S httpie

# fish
sudo pacman -S fish
(curl -L https://get.oh-my.fish | fish; rm -f install) &

# zsh-syntax-highlighting
sudo pacman -S zsh-syntax-highlighting
    # add following lines to .zshrc
    # source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# ranger
sudo pacman -S ranger
sudo pacman -S atool
sudo pacman -S highlight
sudo pacman -S elinks
sudo pacman -S p7zip
sudo pacman -S feh
sudo pacman -S xclip
sudo pacman -S colordiff

# tmux
sudo pacman -S tmux

# vim
# Note: do not install python by yourself, use sudo pacman -S python3 instead, or vim will not support python3
brew tap homebrew/cask-fonts
sudo pacman -S font-hack-nerd-font --cask
sudo pacman -S neovim
sudo pacman -S vim
sudo pacman -S ctags
sudo pacman -S autojump
sudo pacman -S fzf
sudo pacman -S fd
sudo pacman -S ag
sudo pacman -S fasd
sudo pacman -S ripgrep
sudo pacman -S figlet
sudo pacman -S xclip
sudo pacman -S node
sudo pacman -S npm

# task &&  time warrior 
sudo pacman -S task
sudo pacman -S taskd
sudo pacman -S tasksh

# terminal shark
sudo pacman -S termshark

# json
sudo pacman -S jq

# parallel 
sudo pacman -S parallel

# csv 
sudo pacman -S csvkit

# data workflow tool
sudo pacman -S drake

# data tools
sudo pacman -S gnuplot
sudo pacman -S feedgnuplot
sudo pacman -S weka
sudo pacman -S imagemagick
go get github.com/jehiah/json2csv

# lazygit
sudo pacman -S jesseduffield/lazygit/lazygit
sudo pacman -S lazygit

# tex
# --- zathura ---
# https://github.com/zegervdv/homebrew-zathura
sudo pacman -S xdotool
sudo pacman -S zathura
sudo pacman -S zathura-pdf-poppler
# Note: to install mactex need to enter password of root
sudo pacman -S tex
sudo pacman -S pandoc
sudo pacman -S markdownlint-cli

# mutt
sudo pacman -S mutt
sudo pacman -S fetchmail
sudo pacman -S msmtp
sudo pacman -S procmail

wait

# after install
# --------------------------------------------------------------

# mutt
sudo chgrp mail /usr/local/opt/mutt/bin/mutt_dotlock 
sudo chmod g+s /usr/local/opt/mutt/bin/mutt_dotlock

# for fecthmail
sudo mkdir -p /var/mail/lorenzo
sudo chmod -R 777 /var/mail/lorenzo

# --------------------------------------------------------------

echo "--- pacman -----------"


