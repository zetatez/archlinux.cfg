
vim /etc/vconsole.conf

KEYMAP=us
FONT=Monospace

cp /usr/share/kbd/keymaps/i386/qwerty/us.map.gz ~/.mykeymaps/
cd ~/.mykeymaps

gunzip us.map.gz

