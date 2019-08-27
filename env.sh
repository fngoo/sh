#!/bin/sh

cd /root/
apt update
yes|apt install git gcc g++ make libpcap-dev nano curl zlib* openssl libssl-dev libsqlite3-dev

var=$(curl -L golang.org/dl/|grep -oP "(?<=\<a\ class\=\"download\ downloadBox\"\ href\=\").*?(?=linux\-amd64\.tar\.gz\"\>)")
last=linux-amd64.tar.gz && var=$var$last && wget $var && load=${var//https\:\/\/dl\.google\.com\/go\//} && tar -xzf $load -C /usr/local && rm -rf $load
echo 'export EDITOR=nano'>>/root/.profile
echo 'export GOROOT=/usr/local/go'>>/root/.profile
mkdir /root/GOPATH
echo 'export GOPATH=/root/GOPATH'>>/root/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>/root/.profile
source /root/.profile

wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar zxvf Python-3.6.9.tgz && rm -rf Python-3.6.9.tgz
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

mkdir /root/script

cd /root/
python3 -m pip install --upgrade urlwatch
urlwatch
git clone https://github.com/fngoo/txt
cd txt
> /root/.config/urlwatch/urlwatch.yaml
cat 1.txt >/root/.config/urlwatch/urlwatch.yaml
rm -r /root/txt

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
rm dir

mkdir /root/script/6_port
cd /root/script/6_port
git clone https://github.com/gm09519/host2ip
cd host2ip
sed -e "s/ip\=\"N\/A\"/continue/g" host2ip.py|tee host2ip.py
cd /root/
yes|apt install nmap
cd /root/script/6_port
git clone https://github.com/hellogoldsnakeman/masnmapscan-V1.0 && cd masnmapscan-V1.0 && pip install -r requirements.txt && touch ip.txt
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make -j
