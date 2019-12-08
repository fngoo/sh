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
cd /root/script/0_subdomain/Sublist3r ; python3 sublist3r.py -v -d $one -o /root/script/0_subdomain/0_sublist.txt ; sleep=`shuf -i 6-16 -n1` ; sleep $sleep ; cat /root/script/0_subdomain/0_sublist.txt >> /root/script/subfinder.txt ; > /root/script/0_subdomain/0_sublist.txt
if [ -s /root/script/subfinder.txt ]
then
bash /root/script/0_subdomain/massdns/scripts/get-resolvers.sh
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; rg -oP "\ A.*" results.txt > ag.txt ; sort -u ag.txt -o ag.txt
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
bash /root/script/0_subdomain/massdns/scripts/get-resolvers.sh
cat /root/script/massdns.txt >> $var ; rm /root/script/massdns.txt ; cat /root/script/subfinder.txt >> $var ; > /root/script/subfinder.txt
cd /root/script/0_subdomain/altdns ; altdns -i $txt -w words_large.txt -o 2.txt ; cat 2.txt >> /root/script/subfinder.txt ; > 2.txt ; sort -u /root/script/subfinder.txt -o /root/script/subfinder.txt
if [ -s /root/script/subfinder.txt ]
then
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; rg -oP "\ A.*" results.txt > ag.txt ; sort -u ag.txt -o ag.txt
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
bash /root/script/0_subdomain/massdns/scripts/get-resolvers.sh
cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; awk -F ". " '{print $1}' results.txt > wordlist-filtered.txt && mv wordlist-filtered.txt results.txt ; sort -u results.txt -o results.txt ; mv results.txt $var


cat $var > /root/var.txt
seq=$(seq 1 5 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+5))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/module ; bash module/wild.sh ; rm -r module

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
cd /root/script/0_subdomain/Sublist3r ; python3 sublist3r.py -v -d $one -o /root/script/0_subdomain/0_sublist.txt ; sleep=`shuf -i 6-16 -n1` ; sleep $sleep ; cat /root/script/0_subdomain/0_sublist.txt >> /root/script/subfinder.txt ; > /root/script/0_subdomain/0_sublist.txt
if [ -s /root/script/subfinder.txt ]
then
bash /root/script/0_subdomain/massdns/scripts/get-resolvers.sh
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; rg -oP "\ A.*" results.txt > ag.txt ; sort -u ag.txt -o ag.txt
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
bash /root/script/0_subdomain/massdns/scripts/get-resolvers.sh
cat /root/script/subfinder.txt | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; rg -oP "\ A.*" results.txt > ag.txt ; sort -u ag.txt -o ag.txt
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
bash /root/script/0_subdomain/massdns/scripts/get-resolvers.sh
cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; awk -F ". " '{print $1}' results.txt > wordlist-filtered.txt && mv wordlist-filtered.txt results.txt ; sort -u results.txt -o results.txt ; mv results.txt $var


cat $var > /root/var.txt
seq=$(seq 1 5 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+5))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/module ; bash module/wild.sh ; rm -r module

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
cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; awk -F ". " '{print $1}' results.txt > wordlist-filtered.txt && mv wordlist-filtered.txt results.txt ; sort -u results.txt -o results.txt ; cat results.txt >> $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var

cat $var > /root/var.txt
seq=$(seq 1 5 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+5))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/module ; bash module/single.sh ; rm -r module

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
cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt --root -t A -s 1666 -o S -w results.txt ; awk -F ". " '{print $1}' results.txt > wordlist-filtered.txt && mv wordlist-filtered.txt results.txt ; sort -u results.txt -o results.txt ; cat results.txt >> $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var

cat $var > /root/var.txt
seq=$(seq 1 5 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+5))
sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

git clone https://github.com/fngoo/module ; bash module/single.sh ; rm -r module

#var切片结束
done
rm /root/var.txt

cd /root/script/domains_Github/domains/domains ; rm -rf *
> /root/script/domains_Github/domains/mmoc.txt
> /root/script/domains_Github/domains/domains_urlwatch.txt
fi
sleep 6
exit
