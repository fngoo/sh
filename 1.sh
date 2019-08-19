#!/bin/sh


apt update
yes|apt-get install git gcc make libpcap-dev
yes|apt-get install ruby
yes|apt-get install ruby-dev
yes|apt install golang-go
var=$(ruby -v|grep -oP ".\..\..")
cd /etc/alternatives
ln -sf /usr/bin/ruby$var ruby
echo 'export EDITOR=nano'>>~/.profile
echo 'export GOROOT=/usr/local/go'>>~/.profile
mkdir ~/GOPATH
echo 'export GOPATH=/root/GOPATH'>>~/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>~/.profile
source ~/.profile

apt-get install -y build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev zlib1g-dev openssl libffi-dev python3-dev python3-setuptools wget
mkdir /tmp/Python37
cd /tmp/Python37
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
tar xvf Python-3.7.0.tar.xz
cd /tmp/Python37/Python-3.7.0
./configure --enable-optimizations
make altinstall
echo 'alias python3="python3.7"'>>~/.bashrc
echo 'alias pip3="pip3.7"'>>~/.bashrc
. ~/.bashrc
yes|apt install python3 python3-pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py
rm -r get-pip.py



mkdir ~/script

python3 -m pip install --upgrade urlwatch
python3 -m pip install pyyaml minidb requests keyring appdirs lxml cssselect
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
