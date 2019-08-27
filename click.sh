#!/bin/sh
screen -LS 1
cd /root/sh ; sh sh.sh ; cd /root/sh ; sh env.sh

cd /root/
yes|apt remove sendmail
yes|apt remove postfix
yes|apt install sharutils mailutils sendmail
yes|apt install heirloom-mailx

rm -r /root/sh ; cd /root
while true
do
git clone https://github.com/fngoo/sh
sh sh/sh.sh ; sh sh/exe.sh
rm -r /root/sh ; cd /root
done
