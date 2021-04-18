# Author : Lorenzo

echo "--- ranger -----------"
# ~/.config/ranger
#   ├── commands.py
#   ├── commands_full.py
#   ├── dotity.sh
#   ├── plugins
#   │   └── autojump.py
#   ├── rc.conf
#   ├── rifle.conf
#   ├── scope.sh
#   └── tools

rm -rf ~/.config/ranger.bk
mv ~/.config/ranger ~/.config/ranger.bk
cp -r ~/archlinux.cfg/.config/ranger ~/.config/

echo "--- ranger done ------"


