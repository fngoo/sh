#!/bin/sh

apt update
yes|apt install git gcc g++ make libpcap-dev nano curl zlib* openssl libssl-dev libsqlite3-dev

yes|apt install ruby
yes|apt install ruby-dev
var=$(ruby -v|grep -oP ".\..\..")
cd /etc/alternatives
ln -sf /usr/bin/ruby$var ruby

var=$(curl -L golang.org/dl/|grep -oP "(?<=\<a\ class\=\"download\ downloadBox\"\ href\=\").*?(?=linux\-amd64\.tar\.gz\"\>)")
last=linux-amd64.tar.gz && var=$var$last && wget $var && load=${var//https\:\/\/dl\.google\.com\/go\//} && tar -xzf $load -C /usr/local
echo 'export EDITOR=nano'>>~/.profile
echo 'export GOROOT=/usr/local/go'>>~/.profile
mkdir ~/GOPATH
echo 'export GOPATH=/root/GOPATH'>>~/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>~/.profile
source ~/.profile

wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar zxvf Python-3.6.9.tgz
cd Python-3.6.9
./configure --enable-loadable-sqlite-extensions && make &&  make install
rm -rf /usr/bin/python3
rm -rf /usr/bin/pip3
ln -s /usr/local/bin/python3.6 /usr/bin/python3
ln -s /usr/local/bin/pip3.6 /usr/bin/pip3

python3 -m pip install --upgrade pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm -r get-pip.py

mkdir ~/script

cd ~/
python3 -m pip install --upgrade urlwatch
urlwatch
git clone https://github.com/fngoo/txt
cd txt
> /root/.config/urlwatch/urlwatch.yaml
cat 1.txt >/root/.config/urlwatch/urlwatch.yaml
rm -r ~/txt

mkdir ~/script/0_subdomain
cd ~/script/0_subdomain
go get -u github.com/subfinder/subfinder
pip install py-altdns
git clone https://github.com/lijiejie/subDomainsBrute.git
pip install dnspython gevent
git clone https://github.com/nsonaniya2010/SubDomainizer.git
cd SubDomainizer
python3 -m pip install -r requirements.txt
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
python setup.py install

mkdir ~/script/1_aws
cd ~/script/1_aws
git clone https://github.com/jordanpotti/AWSBucketDump && cd AWSBucketDump && python3 -m pip install -r requirements.txt

mkdir ~/script/2_subjack
cd ~/script/2_subjack
go get github.com/haccer/subjack

mkdir ~/script/3_httprobe
cd ~/script/3_httprobe
go get -u github.com/tomnomnom/httprobe

mkdir ~/script/4_getjs
cd ~/script/4_getjs
go get github.com/003random/getJS

mkdir ~/script/5_dirmap
cd ~/script/5_dirmap
git clone https://github.com/H4ckForJob/dirmap.git && cd dirmap && python3 -m pip install -r requirement.txt
git clone https://github.com/fngoo/dir
mv dir/dict_mode_dict.txt data/dict_mode_dict.txt
touch 1.txt
sed -e "s/conf\.skip\_size\ \=\ \"None\"/conf\.skip\_size\ \=\ \"0b\"/g" dirmap.conf|tee 1.txt
> dirmap.conf
cat 1.txt >dirmap.conf
rm 1.txt

mkdir ~/script/6_port
cd ~/script/6_port
git clone https://github.com/gm09519/host2ip
cd host2ip
sed -e "s/ip\=\"N\/A\"/continue/g" host2ip.py|tee host2ip.py
yes|apt install nmap
cd ~/script/6_port
git clone https://github.com/hellogoldsnakeman/masnmapscan-V1.0 && cd masnmapscan-V1.0 && pip install -r requirements.txt && touch ip.txt
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make -j

gem install aquatone
