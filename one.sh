#!/bin/bash

cd /root/
apt update
yes|apt install git gcc g++ make libpcap-dev nano curl zlib* openssl libssl-dev libsqlite3-dev build-essential libssl-dev libffi-dev python-dev parallel

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
wget https://bootstrap.py
pa.io/get-pip.py
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

while
do
cd /root/
mkdir /root/script
mkdir /root/script/domains_Github
mkdir /root/script/domains_Github/domains;cd /root/script/domains_Github/domains;touch comm.txt;touch mmoc.txt
mkdir /root/script/domains_Github/wildcards;cd /root/script/domains_Github/wildcards;touch wilds.txt;touch cards.txt
mkdir /root/script/domains_Github/0_subdomain;cd /root/script/domains_Github/0_subdomain;touch keep.txt;touch peek.txt
mkdir /root/watch;touch /root/watch/1.txt;touch /root/watch/2.txt

#domains.txt
cd /root/script/domains_Github/domains
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)"> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)">> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt
comm -3 mmoc.txt comm.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;output=/root/script/domains_Github/domains/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
#    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
#    
#    for line in `cat $var`
#    do
#    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
#    done
#    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    mkdir $output/root ; cp -Rf /root/* $output/root ; cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_domains.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_domains" -a $output$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com;rm domains.zip
    cd /root/script/domains_Github/domains/domains ; rm -rf *
    > /root/script/domains_Github/domains/comm.txt
    > /root/script/domains_Github/domains/domains_urlwatch.txt
fi
cd /root/script/domains_Github/domains
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)"> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)">> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt
comm -3  comm.txt  mmoc.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;output=/root/script/domains_Github/domains/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
#    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
#    
#    for line in `cat $var`
#    do
#    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
#    done
#    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    mkdir $output/root ; cp -Rf /root/* $output/root ; cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_domains.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_domains" -a $output$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com;rm domains.zip
    cd /root/script/domains_Github/domains/domains ; rm -rf *
    > /root/script/domains_Github/domains/mmoc.txt
    > /root/script/domains_Github/domains/domains_urlwatch.txt
fi
#wildcards.txt
cd /root/script/domains_Github/wildcards
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>cards.txt;sed -e "s/\*\.//g" cards.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee cards.txt;rm -rf sed.txt;sort cards.txt>sort.txt ; > cards.txt ; cat sort.txt >cards.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>>cards.txt;sed -e "s/\*\.//g" cards.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee cards.txt;rm -rf sed.txt;sort cards.txt>sort.txt ; > cards.txt ; cat sort.txt >cards.txt ; rm sort.txt
comm -3 cards.txt wilds.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;output=/root/script/domains_Github/wildcards/domains
    touch /root/script/0_subdomain/0_subfinder.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent ; cd /root/script/0_subdomain/altdns ; touch /root/script/0_subdomain/0_altdns.txt ; altdns -i $var  -w words.txt -o /root/script/0_subdomain/0_altdns.txt -s 1.txt ; > 1.txt;cd /root/script/0_subdomain/subDomainsBrute ; touch /root/script/0_subdomain/0_subdomainbrute.txt

    for line in `cat $var`
    do
    python subDomainsBrute.py $line --full -i -o /root/script/0_subdomain/0_subdomainbrute.txt;cat /root/script/0_subdomain/0_subdomainbrute.txt|grep -o -P ".*?(?=\  )">>$var;> /root/script/0_subdomain/0_subdomainbrute.txt
    done
    cat /root/script/0_subdomain/0_subfinder.txt >>$var ;cat /root/script/0_subdomain/0_altdns.txt|grep -o -P ".*?(?=\:)" >>$var ; > /root/script/0_subdomain/0_subfinder.txt ; > /root/script/0_subdomain/0_altdns.txt ; sort $var|uniq|tee sort.txt ; > $var ; cat sort.txt > $var ; rm sort.txt
    
    cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt
    for line in `cat $var`
    do
    python3 SubDomainizer.py -l $line -o /root/script/0_subdomain/0_subdomainizer.txt; cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ; >/root/script/0_subdomain/0_subdomainizer.txt
    done
    
    cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ;> /root/script/0_subdomain/0_subdomainizer.txt ; sort $var|uniq|tee sort.txt ; > $var ; cat sort.txt >$var ; rm sort.txt
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
#    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
#    
#    for line in `cat $var`
#    do
#    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
#    done
#    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    
    mkdir $output/root ; cp -Rf /root/* $output/root ; cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_wildcards" -a $output$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/wildcards/domains ; rm -rf *
    > /root/script/domains_Github/wildcards/wilds.txt
    > /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
cd /root/script/domains_Github/wildcards
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>cards.txt;sed -e "s/\*\.//g" wilds.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee wilds.txt;rm -rf sed.txt;sort wilds.txt>sort.txt ; > wilds.txt ; cat sort.txt >wilds.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>>wilds.txt;sed -e "s/\*\.//g" wilds.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee wilds.txt;rm -rf sed.txt;sort wilds.txt>sort.txt ; > wilds.txt ; cat sort.txt >wilds.txt ; rm sort.txt
comm -3 wilds.txt cards.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;output=/root/script/domains_Github/wildcards/domains
    touch /root/script/0_subdomain/0_subfinder.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent ; cd /root/script/0_subdomain/altdns ; touch /root/script/0_subdomain/0_altdns.txt ; altdns -i $var  -w words.txt -o /root/script/0_subdomain/0_altdns.txt -s 1.txt ; > 1.txt;cd /root/script/0_subdomain/subDomainsBrute ; touch /root/script/0_subdomain/0_subdomainbrute.txt

    for line in `cat $var`
    do
    python subDomainsBrute.py $line --full -i -o /root/script/0_subdomain/0_subdomainbrute.txt;cat /root/script/0_subdomain/0_subdomainbrute.txt|grep -o -P ".*?(?=\  )">>$var;> /root/script/0_subdomain/0_subdomainbrute.txt
    done
    cat /root/script/0_subdomain/0_subfinder.txt >>$var ;cat /root/script/0_subdomain/0_altdns.txt|grep -o -P ".*?(?=\:)" >>$var ; > /root/script/0_subdomain/0_subfinder.txt ; > /root/script/0_subdomain/0_altdns.txt ; sort $var|uniq|tee sort.txt ; > $var ; cat sort.txt > $var ; rm sort.txt
    
    cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt
    for line in `cat $var`
    do
    python3 SubDomainizer.py -l $line -o /root/script/0_subdomain/0_subdomainizer.txt; cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ; >/root/script/0_subdomain/0_subdomainizer.txt
    done
    
    cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ;> /root/script/0_subdomain/0_subdomainizer.txt ; sort $var|uniq|tee sort.txt ; > $var ; cat sort.txt >$var ; rm sort.txt
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
#    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
#    
#    for line in `cat $var`
#    do
#    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
#    done
#    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    
    mkdir $output/root ; cp -Rf /root/* $output/root ; cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_wildcards" -a $output$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/wildcards/domains ; rm -rf *
    > /root/script/domains_Github/wildcards/cards.txt
    > /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
#keep moni
cd /root/script/domains_Github/0_subdomain
var=/root/script/domains_Github/wildcards/wilds.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent;cat /root/script/0_subdomain/0_subfinder.txt >>peek.txt; > /root/script/0_subdomain/0_subfinder.txt; sort peek.txt>sort.txt ; > peek.txt ; cat sort.txt >peek.txt ; rm sort.txt
comm -3 peek.txt keep.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/0_subdomain/domains_urlwatch.txt ; mkdir /root/script/domains_Github/0_subdomain/domains ;output=/root/script/domains_Github/0_subdomain/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
#    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
#    for line in `cat $var`
#    do
#    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
#    done
#    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    mkdir $output/root ; cp -Rf /root/* $output/root ; cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_monis.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip; echo ":D"| mailx -v -r "410046251@qq.com" -s "0_subdomain" -a $output$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/0_subdomain/domains ; rm -rf *
    > /root/script/domains_Github/0_subdomain/keep.txt
    > /root/script/domains_Github/0_subdomain/domains_urlwatch.txt
fi
cd /root/script/domains_Github/0_subdomain
var=/root/script/domains_Github/wildcards/wilds.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent;cat /root/script/0_subdomain/0_subfinder.txt >>keep.txt; > /root/script/0_subdomain/0_subfinder.txt; sort keep.txt>sort.txt ; > keep.txt ; cat sort.txt >keep.txt ; rm sort.txt
comm -3 keep.txt peek.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/0_subdomain/domains_urlwatch.txt ; mkdir /root/script/domains_Github/0_subdomain/domains ;output=/root/script/domains_Github/0_subdomain/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
#    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
#    for line in `cat $var`
#    do
#    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
#    done
#    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    mkdir $output/root ; cp -Rf /root/* $output/root ; cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_monis.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip; echo ":D"| mailx -v -r "410046251@qq.com" -s "0_subdomain" -a $output$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/0_subdomain/domains ; rm -rf *
    > /root/script/domains_Github/0_subdomain/peek.txt
    > /root/script/domains_Github/0_subdomain/domains_urlwatch.txt
fi

### /root/watch/1.txt需要修改，源主机可能过快发送

### 结束时清空文本



mkdir /root/run/ ; mkdir /root/run/output

touch /root/run/3_3.txt ; mv /root/watch/1.txt /root/run/3.txt ; touch /root/run/zip.txt ; touch /root/run/zip1.txt



comm -3 /root/run/3.txt /root/run/3_3.txt > /root/run/target.txt ; sed 's/[[:space:]]//g' /root/run/target.txt > space.txt ; > /root/run/target.txt ; cat space.txt > /root/run/target.txt ; rm space.txt

var=/root/run/target.txt ; output=/root/run/output



if [ -s $var ]

then



###如果更新就删除旧版,下载新版

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")">/root/run/zip.txt

comm -3 /root/run/zip.txt /root/run/zip1.txt > /root/run/release.txt ; sed 's/[[:space:]]//g' /root/run/release.txt > space.txt ; > /root/run/release.txt ; cat space.txt > /root/run/release.txt ; rm space.txt

if [ -s /root/run/release.txt ]

then

rm -rf /root/run/xray_linux_amd64

release=`head -1 /root/run/release.txt|tail -1`

head=https://github.com/chaitin/xray/releases/download/;footer=/xray_linux_amd64.zip;wget=$head$release$footer

wget -P /root/run/ $wget

unzip /root/run/xray_linux_amd64.zip -d /root/run/ ; rm /root/run/xray_linux_amd64.zip ; > /root/run/zip1.txt ; cat /root/run/zip.txt>/root/run/zip1.txt ; > /root/run/zip.txt ;> /root/run/release.txt

### xray使用

mkdir $output/xray/

xray=$output/xray/

for line in `cat $var`

do

name=.html ; txt=$line$name ; head=http:// ; url=$head$line

cd /root/run ; ./xray_linux_amd64 webscan --basic-crawler $url --html-output $xray$txt

done

fi

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt



### urlwatch添加

echo '#!/bin/bash'> $output/urlwatch.sh ; cat $var > $output/urlwatch.sh ; bash $output/urlwatch.sh ; mv $output/urlwatch.sh $output/urlwatch.txt



### 发邮件 ； 清空$output ； 发确认信息 ； 结束if urlwatch

mkdir $output/root ; cp -Rf /root/* $output/root ; cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *;fname=$slash$dayzoom$addname$zip ; echo ":D"|mailx -v -r "410046251@qq.com" -s "port" -a $output$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com

rm -r $output

> $var ; cat /root/run/3.txt > /root/run/3_3.txt

fi

urlwatch
done
