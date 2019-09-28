#!/bin/bash

cd /root/
apt update
yes|apt install ruby ruby-dev libcurl4-openssl-dev aptitude make zlib1g-dev git gcc g++ make libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev libpcap-dev iftop nano wget curl zlib* openssl libssl-dev libsqlite3-dev build-essential libssl-dev libcurl4-openssl-dev libffi-dev python-dev parallel tmux aria2
echo 'set -g prefix C-a'>>/root/.tmux.conf ; echo 'unbind C-b'>>/root/.tmux.conf
wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz
tar xzvf ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-11.0.2-x86_64-unknown-linux-musl/rg  /usr/local/bin/
rm ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz

#yes|apt install ruby
#yes|apt install ruby-dev
#var=$(ruby -v|grep -oP ".\..\..")
#cd /etc/alternatives
#ln -sf /usr/bin/ruby$var ruby


aptitude install debian-keyring debian-archive-keyring

wget -qO- https://get.docker.com/ | bash
docker pull ysrc/xunfeng
docker run -d -p 8000:80 -v /opt/data:/data ysrc/xunfeng:latest


cd /root
var=$(curl -L golang.org/dl/|grep -oP "(?<=\<a\ class\=\"download\ downloadBox\"\ href\=\").*?(?=linux\-amd64\.tar\.gz\"\>)") ; last=linux-amd64.tar.gz ; var=$var$last ; wget $var
load=${var//https\:\/\/dl\.google\.com\/go\//} ; tar -xzf $load -C /usr/local ; rm $load
echo 'export EDITOR=nano'>>/root/.profile
echo 'export GOROOT=/usr/local/go'>>/root/.profile
mkdir /root/GOPATH
echo 'export GOPATH=/root/GOPATH'>>/root/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>/root/.profile
source /root/.profile

wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar zxvf Python-3.6.9.tgz && rm -rf Python-3.6.9.tgz
cd Python-3.6.9
./configure --enable-loadable-sqlite-extensions ; make ;  make install
rm -rf /usr/bin/python3
rm -rf /usr/bin/pip3
ln -s /usr/local/bin/python3.6 /usr/bin/python3
ln -s /usr/local/bin/pip3.6 /usr/bin/pip3

yes|apt install python-pip
rm /usr/bin/lsb_release
python3 -m pip install --upgrade pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm -r get-pip.py




mkdir /root/script

cd /root/
python3 -m pip install --upgrade urlwatch
urlwatch
git clone https://github.com/fngoo/txt
cd txt
> /root/.config/urlwatch/urlwatch.yaml
cat 1.txt >/root/.config/urlwatch/urlwatch.yaml
cd /root/ ; rm -r /root/txt

mkdir /root/script/0_subdomain
cd /root/
go get github.com/subfinder/subfinder
pip install py-altdns
cd /root/script/0_subdomain
git clone https://github.com/infosec-au/altdns
cd altdns/
python setup.py install
cd /root/script/0_subdomain
git clone https://github.com/lijiejie/subDomainsBrute.git
pip install dnspython gevent
cd /root/script/0_subdomain
git clone https://github.com/nsonaniya2010/SubDomainizer.git
cd SubDomainizer
python3 -m pip install -r requirements.txt
cd /root/script/0_subdomain
git clone https://github.com/fngoo/massdns
cd massdns ; make
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

mkdir /root/script/1_aws
cd /root/script/1_aws
git clone https://github.com/fngoo/AWSBucketDump && cd AWSBucketDump && python3 -m pip install -r requirements.txt 

mkdir /root/script/2_subjack
cd /root/script/2_subjack
cd /root/
go get github.com/haccer/subjack

mkdir /root/script/3_httprobe
cd /root/script/3_httprobe
cd /root/
go get -u github.com/tomnomnom/httprobe
cd /root/script/3_httprobe
git clone https://github.com/verovaleros/webcrawler ; mv webcrawler/crawler.py crawler.py ; rm -r webcrawler
cd /root/script/3_httprobe
git clone https://github.com/fngoo/Arjun
cd /root/script/3_httprobe
git clone https://github.com/fngoo/XSStrike
cd /root/script/3_httprobe
#git clone https://github.com/Threezh1/JSFinder
git clone https://github.com/GerbenJavado/LinkFinder ; cd LinkFinder ; pip3 install -r requirements.txt ; python3 setup.py install
cd /root/
go get github.com/tomnomnom/waybackurls

mkdir /root/script/4_getjs
cd /root/script/4_getjs
cd /root/
go get github.com/003random/getJS

mkdir /root/script/5_dir
cd /root/script/5_dir
git clone https://github.com/maurosoria/dirsearch
git clone https://github.com/fngoo/dir
rm dirsearch/default.conf ; mv dir/default.conf dirsearch/default.conf
mv dir/dict_mode_dict.txt dirsearch/dict_mode_dict.txt
rm -r dir

mkdir /root/script/6_port
cd /root/script/6_port
git clone https://github.com/gm09519/host2ip
cd host2ip
sed -e "s/ip\=\"N\/A\"/continue/g" host2ip.py|tee host2ip.py
cd /root/
yes|apt install nmap
cd /root/script/6_port
git clone https://github.com/fngoo/masnmapscan-V1.0 && cd masnmapscan-V1.0 && pip install -r requirements.txt && touch ip.txt
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make -j

cd /root/
yes|apt remove sendmail
yes|apt remove postfix
yes|apt install sharutils mailutils sendmail
yes|apt install heirloom-mailx

> /etc/nail.rc
echo 'set smtp=smtp.qq.com'>>/etc/nail.rc
echo 'set smtp-use-starttls'>>/etc/nail.rc
echo 'set smtp-auth=login'>>/etc/nail.rc
echo 'set smtp-auth-user="410046251@qq.com"'>>/etc/nail.rc
echo 'set smtp-auth-password="yukboddswvyscaeh"'>>/etc/nail.rc
echo 'set ssl-verify=ignore'>>/etc/nail.rc


while true
do
cd /root
git clone https://github.com/fngoo/sh ; chmod 777 sh/*
bash sh/one.sh
cd /root ; rm -r sh
done
