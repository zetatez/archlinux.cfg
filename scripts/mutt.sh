# Author : Lorenzo

echo "--- mutt -----------"

rm -rf ~/.mutt
rm -f ~/.fetchmailrc
rm -f ~/.msmtprc
rm -f ~/.procmailrc
rm -f ~/.mailcap
rm -rf ~/mail

mkdir ~/.mutt
ln ~/archlinux.cfg/.mutt/muttrc ~/.mutt/muttrc
ln ~/archlinux.cfg/.mutt/signature ~/.mutt/signature
ln ~/archlinux.cfg/.mutt/mutt.alias ~/.mutt/mutt.alias
ln ~/archlinux.cfg/.fetchmailrc ~/.fetchmailrc
ln ~/archlinux.cfg/.msmtprc ~/.msmtprc
ln ~/archlinux.cfg/.procmailrc ~/.procmailrc

mkdir ~/mail
mkdir ~/mail/cur
mkdir ~/mail/new
mkdir ~/mail/inbox
mkdir ~/mail/sent
mkdir ~/mail/postponed
mkdir ~/mail/tmp
mkdir ~/mail/trash
mkdir ~/mail/inbox/cur
mkdir ~/mail/inbox/new
mkdir ~/mail/sent/new
mkdir ~/mail/sent/tmp
chmod -R 755 ~/mail

chmod 600 ~/.mutt/muttrc
chmod 600 ~/.fetchmailrc
chmod 600 ~/.msmtprc
chmod 600 ~/.procmailrc

echo "--- mutt done--------"

