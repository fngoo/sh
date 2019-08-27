#!/bin/sh
cd /root
git clone https://github.com/fngoo/sh
cd /root/sh ; sh sh.sh ; cd /root/sh ; sh env.sh
cd /root ; rm -r /root/sh
while true
do
git clone https://github.com/fngoo/sh
sh sh/sh.sh ; sh sh/exe.sh
rm -r /root/sh ; cd /root
done
