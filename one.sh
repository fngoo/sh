#!/bin/bash

#input
target_wild="curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/wildcards.txt | grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)' | grep -v 'ali' | grep -v '1688' | grep -v 'taobao'"
target_single="curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/domains.txt | grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)' | grep -v 'ali' | grep -v '1688' | grep -v 'taobao'"
target_wild_my=""
target_single_my=""

cd /root/
mkdir /root/script;mkdir /root/zip;mkdir /root/script/domains_Github;mkdir /root/script/domains_Github/domains;cd /root/script/domains_Github/domains;touch comm.txt;touch mmoc.txt;mkdir /root/script/domains_Github/wildcards;cd /root/script/domains_Github/wildcards;touch wilds.txt;touch cards.txt;mkdir /root/script/domains_Github/0_subdomain;cd /root/script/domains_Github/0_subdomain;touch keep.txt;touch peek.txt;mkdir /root/watch;touch /root/watch/1.txt

#wildcards.txt
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/wildcards
eval $target_wild | sed "s/\*\.//g" | sed "/\*/d" | tee -a cards.txt ; sort -u cards.txt -o cards.txt
eval $target_wild_my >> cards.txt ; sort -u cards.txt -o cards.txt

comm -3 cards.txt wilds.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; export var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;output=/root/script/domains_Github/wildcards/domains ; export output=/root/script/domains_Github/wildcards/domains

cd /root/script/0_subdomain ; rm -r Sublist3r ; git clone https://github.com/aboul3la/Sublist3r ; cd Sublist3r ; pip3 install -r requirements.txt
for one in `cat $var`
do
echo "$one" > /root/script/one.txt
txt=/root/script/one.txt
cd /root/script/0_subdomain/Sublist3r ; python3 sublist3r.py -v -d $one -o /root/script/0_subdomain/0_sublist.txt ; sleep 6 ; cat /root/script/0_subdomain/0_sublist.txt >> /root/script/subfinder.txt ; > /root/script/0_subdomain/0_sublist.txt
cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt ; python3 SubDomainizer.py -k -u $one -o /root/script/0_subdomain/0_subdomainizer.txt ; cat /root/script/0_subdomain/0_subdomainizer.txt >> /root/script/subfinder.txt ; > /root/script/0_subdomain/0_subdomainizer.txt
cd /root/script/0_subdomain/altdns ; altdns -i $txt -w words.txt -o 2.txt ; cat 2.txt >> /root/script/subfinder.txt ; > 2.txt ; sort -u /root/script/subfinder.txt -o /root/script/subfinder.txt ; altdns -i /root/script/subfinder.txt -w words.txt -o 2.txt ; cat 2.txt >> /root/script/subfinder.txt ; rm 2.txt
sort -u /root/script/subfinder.txt -o /root/script/subfinder.txt
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt >> /root/script/result.txt ; rm results.txt ; sort -u /root/script/result.txt -o /root/script/result.txt
rm /root/script/one.txt
wc -l /root/script/subfinder.txt
done
cat /root/script/result.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt >> $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var ; rm /root/script/result.txt

cat $var > /root/var.txt
seq=$(seq 1 10 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+10))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/cloud ; bash cloud/cloud.sh ; rm -r cloud ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8000 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; bash getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; bash /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
cd /root ; mkdir $output/5_dir ; git clone https://github.com/fngoo/fordir ; bash fordir/fordir.sh ; rm -r fordir

shuf $output/3_httprobe.txt -o /root/httprobe_all.txt
git clone https://github.com/fngoo/scan ; mv scan/scan.sh scan.sh ; bash scan.sh ; rm -r scan ; rm scan.sh
mkdir $output/root ;ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root  ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; mkdir /root/z_juice ; mkdir /root/z_juice$fname ; unzip /root/zip$fname -d /root/z_juice$fname
rm -r $output/*

#var切片结束
done
rm /root/var.txt

cd /root/script/domains_Github/wildcards/domains ; rm -rf *
> /root/script/domains_Github/wildcards/wilds.txt
> /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
sleep 6




cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/wildcards
eval $target_wild | sed "s/\*\.//g" | sed "/\*/d" | tee -a wilds.txt ; sort -u wilds.txt -o wilds.txt
eval $target_wild_my >> wilds.txt ; sort -u wilds.txt -o wilds.txt

comm -3 wilds.txt cards.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; export var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;output=/root/script/domains_Github/wildcards/domains ; export output=/root/script/domains_Github/wildcards/domains

cd /root/script/0_subdomain ; rm -r Sublist3r ; git clone https://github.com/aboul3la/Sublist3r ; cd Sublist3r ; pip3 install -r requirements.txt
for one in `cat $var`
do
echo "$one" > /root/script/one.txt
txt=/root/script/one.txt
cd /root/script/0_subdomain/Sublist3r ; python3 sublist3r.py -v -d $one -o /root/script/0_subdomain/0_sublist.txt ; sleep 6 ; cat /root/script/0_subdomain/0_sublist.txt >> /root/script/subfinder.txt ; > /root/script/0_subdomain/0_sublist.txt
cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt ; python3 SubDomainizer.py -k -u $one -o /root/script/0_subdomain/0_subdomainizer.txt ; cat /root/script/0_subdomain/0_subdomainizer.txt >> /root/script/subfinder.txt ; > /root/script/0_subdomain/0_subdomainizer.txt
cd /root/script/0_subdomain/altdns ; altdns -i $txt -w words.txt -o 2.txt ; cat 2.txt >> /root/script/subfinder.txt ; > 2.txt ; sort -u /root/script/subfinder.txt -o /root/script/subfinder.txt ; altdns -i /root/script/subfinder.txt -w words.txt -o 2.txt ; cat 2.txt >> /root/script/subfinder.txt ; rm 2.txt
sort -u /root/script/subfinder.txt -o /root/script/subfinder.txt
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt >> /root/script/result.txt ; rm results.txt ; sort -u /root/script/result.txt -o /root/script/result.txt
rm /root/script/one.txt
wc -l /root/script/subfinder.txt
done
cat /root/script/result.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt >> $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var ; rm /root/script/result.txt

cat $var > /root/var.txt
seq=$(seq 1 10 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+10))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/cloud ; bash cloud/cloud.sh ; rm -r cloud ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8000 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; bash getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; bash /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh

cd /root ; mkdir $output/5_dir ; git clone https://github.com/fngoo/fordir ; bash fordir/fordir.sh ; rm -r fordir
 
shuf $output/3_httprobe.txt -o /root/httprobe_all.txt
git clone https://github.com/fngoo/scan ; mv scan/scan.sh scan.sh ; bash scan.sh ; rm -r scan ; rm scan.sh
mkdir $output/root ; ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; mkdir /root/z_juice ; mkdir /root/z_juice$fname ; unzip /root/zip$fname -d /root/z_juice$fname
rm -r $output/*

#var切片结束
done
rm /root/var.txt
cd /root/script/domains_Github/wildcards/domains ; rm -rf *
> /root/script/domains_Github/wildcards/cards.txt
> /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
sleep 6



#domains.txt
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/domains
eval $target_single >> mmoc.txt ; sort -u mmoc.txt -o mmoc.txt
eval $target_single_my >> mmoc.txt ; sort -u mmoc.txt -o mmoc.txt

comm -3 mmoc.txt comm.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
var=/root/script/domains_Github/domains/domains_urlwatch.txt ; export var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;output=/root/script/domains_Github/domains/domains ; export output=/root/script/domains_Github/domains/domains
cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt >> $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var

cat $var > /root/var.txt
seq=$(seq 1 10 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+10))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/cloud ; bash cloud/cloud.sh ; rm -r cloud ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8000 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; bash getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; bash /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
cd /root ; mkdir $output/5_dir ; git clone https://github.com/fngoo/fordir ; bash fordir/fordir.sh ; rm -r fordir

shuf $output/3_httprobe.txt -o /root/httprobe_all.txt
git clone https://github.com/fngoo/scan ; mv scan/scan.sh scan.sh ; bash scan.sh ; rm -r scan ; rm scan.sh
mkdir $output/root ; ar=${var/domains_urlwatch.txt/}; cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_domains.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; mkdir /root/z_juice ; mkdir /root/z_juice$fname ; unzip /root/zip$fname -d /root/z_juice$fname
rm -r $output/*


#var切片结束
done
rm /root/var.txt

> /root/script/domains_Github/domains/comm.txt
> /root/script/domains_Github/domains/domains_urlwatch.txt
fi
sleep 6



cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/domains
eval $target_single >> comm.txt ; sort -u comm.txt -o comm.txt
eval $target_single_my >> comm.txt ; sort -u comm.txt -o comm.txt

comm -3  comm.txt  mmoc.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
var=/root/script/domains_Github/domains/domains_urlwatch.txt ; export var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;output=/root/script/domains_Github/domains/domains ; export output=/root/script/domains_Github/domains/domains
cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt >> $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var

cat $var > /root/var.txt
seq=$(seq 1 10 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+10))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/cloud ; bash cloud/cloud.sh ; rm -r cloud ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8000 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; bash getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; bash /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
cd /root ; mkdir $output/5_dir ; git clone https://github.com/fngoo/fordir ; bash fordir/fordir.sh ; rm -r fordir

shuf $output/3_httprobe.txt -o /root/httprobe_all.txt
git clone https://github.com/fngoo/scan ; mv scan/scan.sh scan.sh ; bash scan.sh ; rm -r scan ; rm scan.sh
mkdir $output/root ;ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_domains.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; mkdir /root/z_juice ; mkdir /root/z_juice$fname ; unzip /root/zip$fname -d /root/z_juice$fname
rm -r $output/*

#var切片结束
done
rm /root/var.txt

cd /root/script/domains_Github/domains/domains ; rm -rf *
> /root/script/domains_Github/domains/mmoc.txt
> /root/script/domains_Github/domains/domains_urlwatch.txt
fi
sleep 6
