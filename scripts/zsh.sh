# Author: Lorenzo

echo "--- zsh ------------"

# ~/.zshrc
rm ~/.zshrc.bk
rm ~/.ssh.list.bk

mv ~/.zshrc ~/.zshrc.bk
mv ~/.ssh.list ~/.ssh.list.bk

ln ~/archlinux.cfg/.zshrc ~/.zshrc

# do not use link, copy it && unlock the file
# cp ~/archlinux.cfg/.ssh.list ~

echo "--- zsh done--------"

