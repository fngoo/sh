#!/bin/sh

apt update
yes|apt-get install git gcc make libpcap-dev nano zlib*
yes|apt-get install ruby
yes|apt-get install ruby-dev
yes|apt install golang-go
#apt-get install -y build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev zlib1g-dev openssl libffi-dev python3-dev python3-setuptools wget

var=$(ruby -v|grep -oP ".\..\..")
cd /etc/alternatives
ln -sf /usr/bin/ruby$var ruby

echo 'export EDITOR=nano'>>~/.profile
echo 'export GOROOT=/usr/local/go'>>~/.profile
mkdir ~/GOPATH
echo 'export GOPATH=/root/GOPATH'>>~/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>~/.profile
source ~/.profile

wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1rc2.tgz
tar zxvf Python-3.7.1rc2.tgz
cd Python-3.7.1rc2
./configure
make
make install
rm -rf /usr/bin/python3
rm -rf /usr/bin/pip3
ln -s /usr/local/bin/python3.7 /usr/bin/python3
ln -s /usr/local/bin/pip3.7 /usr/bin/pip3

python3 -m pip install --upgrade pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm -r get-pip.py

mkdir ~/script

python3 -m pip install --upgrade urlwatch
python3 -m pip install pyyaml minidb requests keyring appdirs lxml cssselect
urlwatch
git clone https://github.com/fngoo/txt
cd txt
> /root/.config/urlwatch/urlwatch.yaml
cat 1.txt >/root/.config/urlwatch/urlwatch.yaml
rm 1.txt

mkdir ~/script/0_subdomain
cd ~/script/0_subdomain
go get -u github.com/subfinder/subfinder
pip install py-altdns
git clone https://github.com/lijiejie/subDomainsBrute.git
pip install dnspython gevent
git clone https://github.com/nsonaniya2010/SubDomainizer.git
cd SubDomainizer
python3 -m pip install -r requirements.txt

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
git clone https://github.com/nmap/nmap
cd nmap
./configure
make
make install
cd ~/script/6_port
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make -j
cd ~/script/6_port
git clone https://github.com/hellogoldsnakeman/masnmapscan-V1.0
cd masnmapscan-V1.0
pip install -r requirements.txt
mv ~/script/6_port/masscan/bin/masscan ~/script/6_port/masnmapscan-V1.0

gem install aquatone
