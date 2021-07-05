# Author : Lorenzo

echo "--- pip -----------"
rm -rf ~/.pip
cp -rf ~/archlinux.cfg/.pip ~

source ~/.zshrc
python -m pip install --upgrade pip

# pip install `cat ~/archlinux.cfg/.requirements.txt`

echo "--- pip done ------"

