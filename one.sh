#!/bin/bash
cd /root/
mkdir /root/script
mkdir /root/zip
mkdir /root/script/domains_Github
mkdir /root/script/domains_Github/domains;cd /root/script/domains_Github/domains;touch comm.txt;touch mmoc.txt
mkdir /root/script/domains_Github/wildcards;cd /root/script/domains_Github/wildcards;touch wilds.txt;touch cards.txt
mkdir /root/script/domains_Github/0_subdomain;cd /root/script/domains_Github/0_subdomain;touch keep.txt;touch peek.txt
mkdir /root/watch;touch /root/watch/1.txt

#domains.txt
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/domains
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)" | grep -v "aliyun" | grep -v "1688" | grep -v "taobao" > mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)" | grep -v "aliyun" | grep -v "1688" | grep -v "taobao" >> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt
comm -3 mmoc.txt comm.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/domains/domains_urlwatch.txt ; export var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;output=/root/script/domains_Github/domains/domains ; export output=/root/script/domains_Github/domains/domains
    cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt > $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var

    cat $var > /root/var.txt
    seq=$(seq 1 100 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
    for i in $seq
    do
    add=$((i+100))
    sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; git clone https://github.com/fngoo/git ; bash git/git.sh ; rm -r git ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort -u cliaws.txt -o awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; echo '-------- ------ --------------' >> $output/1_AWS.txt ; cd /root/script/1_aws/cloud_enum ; for line in `cat $var`; do python3 cloud_enum.py -k $line -l $output/2_.txt ; cat $output/2_.txt >> $output/2_AWS.txt ; rm $output/2_.txt; done ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort -u $output/5_dir_all.txt -o sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort -u $output/5_dir/5_301_403.txt -o sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    cat $output/3_httprobe.txt >> /root/httprobe_all.txt ; sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt ; mkdir $output/root ; ar=${var/domains_urlwatch.txt/}; cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_domains.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"1"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg
    rm -r $output/*


    #var切片结束
    done
    rm /root/var.txt

    > /root/script/domains_Github/domains/comm.txt
    > /root/script/domains_Github/domains/domains_urlwatch.txt
fi
sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt










mkdir /root/run/ ; mkdir /root/run/output

touch /root/run/3_3.txt ; mv /root/watch/1.txt /root/run/3.txt ; touch /root/run/zip.txt ; touch /root/run/zip1.txt



comm -3 /root/run/3.txt /root/run/3_3.txt > /root/run/target.txt ; sed 's/[[:space:]]//g' /root/run/target.txt > space.txt ; > /root/run/target.txt ; cat space.txt > /root/run/target.txt ; rm space.txt

var=/root/run/target.txt ; export var=/root/run/target.txt ; output=/root/run/output ; export output=/root/run/output



if [ -s $var ]

then

cat $var > /root/run/target.txt
seq=$(seq 1 100 `wc -l  /root/run/target.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+100))
sed -n ''$i','$add'p' /root/run/target.txt > $var ; var=$var ; export var=$var

###如果更新就删除旧版,下载新版

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/run/zip.txt


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

cd /root/run


#head=0

#echo '#!/bin/bash' >> exe.sh

for line in `cat /root/httprobe_all.txt`

do

#length=`wc -l /root/httprobe_all.txt|grep -o -P ".*?(?=\ )"`
#for((#head=0;head<$length;head+=1))
#do

name=.html ; txt=$head$name ;  url=$head$line

#echo '#!/bin/bash' >> $head.sh
#echo "./xray_linux_amd64 webscan --url $line --json-output 1.txt" >> $head.sh
#echo "rm $head.sh" >> $head.sh
#echo "bash $head.sh" >> exe.sh

#head=$((head+1))
./xray_linux_amd64 webscan --url "$line" --json-output 1.txt ; cat 1.txt >> $output/xray/xray.txt ; echo ' ' >> $output/xray/xray.txt ; rm 1.txt
done

#cat /root/run/exe.sh | parallel --jobs 0 --delay 1
#rm /root/run/exe.sh


fi

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt



#### urlwatch添加
#
##echo '#!/bin/bash'> $output/urlwatch.sh ; cat $var > $output/urlwatch.sh ; bash $output/urlwatch.sh ; mv $output/urlwatch.sh $output/urlwatch.txt
#num=1
#echo "#!/bin/bash" >> exe.sh
#for url in `cat /root/httprobe_all.txt`
#do
#mkdir $num
#echo "#!/bin/bash" >> $num/$num.sh
#echo "urlwatch --add url=$url" >> $num/$num.sh
#echo "rm -r $num" >> $num/$num.sh
#echo "bash $num/$num.sh" >> exe.sh
#num=$((num+1))
#done
#cat exe.sh | parallel --jobs 0 --delay 0.5
#rm exe.sh
#rm -r dir_*


### 发邮件 ； 清空$output ； 发确认信息 ； 结束if urlwatch

mkdir $output/root ; ar=${var/target.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *;fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"scan"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg

rm -r $output

> $var ; cat /root/run/3.txt > /root/run/3_3.txt

done
rm /root/httprobe_all.txt
#urlwatch
fi
rm /root/var.txt
> /root/screenlog.0






















cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/domains
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)" | grep -v "aliyun" | grep -v "1688" | grep -v "taobao" > mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)" | grep -v "aliyun" | grep -v "1688" | grep -v "taobao" >> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt
comm -3  comm.txt  mmoc.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/domains/domains_urlwatch.txt ; export var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;output=/root/script/domains_Github/domains/domains ; export output=/root/script/domains_Github/domains/domains
    cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt > $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var

    cat $var > /root/var.txt
    seq=$(seq 1 100 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
    for i in $seq
    do
    add=$((i+100))
    sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; git clone https://github.com/fngoo/git ; bash git/git.sh ; rm -r git ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort -u cliaws.txt -o awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; echo '-------- ------ --------------' >> $output/1_AWS.txt ; cd /root/script/1_aws/cloud_enum ; for line in `cat $var`; do python3 cloud_enum.py -k $line -l $output/2_.txt ; cat $output/2_.txt >> $output/2_AWS.txt ; rm $output/2_.txt; done ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort -u $output/5_dir_all.txt -o sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort -u $output/5_dir/5_301_403.txt -o sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    cat $output/3_httprobe.txt >> /root/httprobe_all.txt ; sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt ; mkdir $output/root ;ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_domains.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"1"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg
    rm -r $output/*

    #var切片结束
    done
    rm /root/var.txt

    cd /root/script/domains_Github/domains/domains ; rm -rf *
    > /root/script/domains_Github/domains/mmoc.txt
    > /root/script/domains_Github/domains/domains_urlwatch.txt
fi
sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt








mkdir /root/run/ ; mkdir /root/run/output

touch /root/run/3_3.txt ; mv /root/watch/1.txt /root/run/3.txt ; touch /root/run/zip.txt ; touch /root/run/zip1.txt



comm -3 /root/run/3.txt /root/run/3_3.txt > /root/run/target.txt ; sed 's/[[:space:]]//g' /root/run/target.txt > space.txt ; > /root/run/target.txt ; cat space.txt > /root/run/target.txt ; rm space.txt

var=/root/run/target.txt ; export var=/root/run/target.txt ; output=/root/run/output ; export output=/root/run/output



if [ -s $var ]

then

cat $var > /root/run/target.txt
seq=$(seq 1 100 `wc -l  /root/run/target.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+100))
sed -n ''$i','$add'p' /root/run/target.txt > $var ; var=$var ; export var=$var

###如果更新就删除旧版,下载新版

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/run/zip.txt


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

cd /root/run



#head=0

#echo '#!/bin/bash' >> exe.sh

for line in `cat /root/httprobe_all.txt`

do

#length=`wc -l /root/httprobe_all.txt|grep -o -P ".*?(?=\ )"`
#for((#head=0;head<$length;head+=1))
#do

name=.html ; txt=$head$name ;  url=$head$line

#echo '#!/bin/bash' >> $head.sh
#echo "./xray_linux_amd64 webscan --url $line --json-output 1.txt" >> $head.sh
#echo "rm $head.sh" >> $head.sh
#echo "bash $head.sh" >> exe.sh

#head=$((head+1))
./xray_linux_amd64 webscan --url "$line" --json-output 1.txt ; cat 1.txt >> $output/xray/xray.txt ; echo ' ' >> $output/xray/xray.txt ; rm 1.txt
done

#cat /root/run/exe.sh | parallel --jobs 0 --delay 1
#rm /root/run/exe.sh


fi

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt



#### urlwatch添加
#
##echo '#!/bin/bash'> $output/urlwatch.sh ; cat $var > $output/urlwatch.sh ; bash $output/urlwatch.sh ; mv $output/urlwatch.sh $output/urlwatch.txt
#num=1
#echo "#!/bin/bash" >> exe.sh
#for url in `cat /root/httprobe_all.txt`
#do
#mkdir $num
#echo "#!/bin/bash" >> $num/$num.sh
#echo "urlwatch --add url=$url" >> $num/$num.sh
#echo "rm -r $num" >> $num/$num.sh
#echo "bash $num/$num.sh" >> exe.sh
#num=$((num+1))
#done
#cat exe.sh | parallel --jobs 0 --delay 0.5
#rm exe.sh
#rm -r dir_*


### 发邮件 ； 清空$output ； 发确认信息 ； 结束if urlwatch

mkdir $output/root ; ar=${var/target.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *;fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"scan"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg

rm -r $output

> $var ; cat /root/run/3.txt > /root/run/3_3.txt

done
rm /root/httprobe_all.txt
#urlwatch
fi
rm /root/var.txt
> /root/screenlog.0




















#wildcards.txt
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/wildcards
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>cards.txt;sed -e "s/\*\.//g" cards.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee cards.txt;rm -rf sed.txt;sort cards.txt>sort.txt ; > cards.txt ; cat sort.txt >cards.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>>cards.txt;sed -e "s/\*\.//g" cards.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee cards.txt;rm -rf sed.txt;sort cards.txt>sort.txt ; > cards.txt ; cat sort.txt >cards.txt ; rm sort.txt
comm -3 cards.txt wilds.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; export var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;output=/root/script/domains_Github/wildcards/domains ; export output=/root/script/domains_Github/wildcards/domains
    touch /root/script/0_subdomain/0_subfinder.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent ; cd /root/script/0_subdomain/altdns ; touch /root/script/0_subdomain/0_altdns.txt ; altdns -i $var  -w words.txt -o /root/script/0_subdomain/0_altdns.txt -s 1.txt ; > 1.txt

    cd /root/script/0_subdomain/subDomainsBrute ; touch /root/script/0_subdomain/0_subdomainbrute.txt
    for line in `cat $var`
    do
    python subDomainsBrute.py $line --full -i -o /root/script/0_subdomain/0_subdomainbrute.txt;cat /root/script/0_subdomain/0_subdomainbrute.txt|grep -o -P ".*?(?=\  )">>$var;> /root/script/0_subdomain/0_subdomainbrute.txt
    done
    cat /root/script/0_subdomain/0_subfinder.txt >>$var ;cat /root/script/0_subdomain/0_altdns.txt|grep -o -P ".*?(?=\:)" >>$var ; > /root/script/0_subdomain/0_subfinder.txt ; > /root/script/0_subdomain/0_altdns.txt ; sort -u $var -o sort.txt ; > $var ; cat sort.txt > $var ; rm sort.txt

    cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt
    for line in `cat $var`
    do
    python3 SubDomainizer.py -l $line -o /root/script/0_subdomain/0_subdomainizer.txt; cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ; >/root/script/0_subdomain/0_subdomainizer.txt
    done

    cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ;> /root/script/0_subdomain/0_subdomainizer.txt ; sort -u $var -o sort.txt ; > $var ; cat sort.txt >$var ; rm sort.txt

    cd /root/script/0_subdomain/massdns
    for brute in `cat $var`
    do
    python scripts/subbrute.py lists/names.txt $brute | massdns -r lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt
    awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u results.txt -o results.txt
    cat results.txt >> $var ; sort -u $var -o $var
    done

    #var切片，减小流程压力
       

    cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt > $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var
    
    cat $var > /root/var.txt
    seq=$(seq 1 100 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
    for i in $seq
    do
    add=$((i+100))
    sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; git clone https://github.com/fngoo/git ; bash git/git.sh ; rm -r git ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort -u cliaws.txt -o awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; echo '-------- ------ --------------' >> $output/1_AWS.txt ; cd /root/script/1_aws/cloud_enum ; for line in `cat $var`; do python3 cloud_enum.py -k $line -l $output/2_.txt ; cat $output/2_.txt >> $output/2_AWS.txt ; rm $output/2_.txt; done ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort -u $output/5_dir_all.txt -o sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort -u $output/5_dir/5_301_403.txt -o sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    
    cat $output/3_httprobe.txt >> /root/httprobe_all.txt ; sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt ; mkdir $output/root ;ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root  ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"2"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg
    rm -r $output/*

    #var切片结束
    done
    rm /root/var.txt

    cd /root/script/domains_Github/wildcards/domains ; rm -rf *
    > /root/script/domains_Github/wildcards/wilds.txt
    > /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt










mkdir /root/run/ ; mkdir /root/run/output

touch /root/run/3_3.txt ; mv /root/watch/1.txt /root/run/3.txt ; touch /root/run/zip.txt ; touch /root/run/zip1.txt



comm -3 /root/run/3.txt /root/run/3_3.txt > /root/run/target.txt ; sed 's/[[:space:]]//g' /root/run/target.txt > space.txt ; > /root/run/target.txt ; cat space.txt > /root/run/target.txt ; rm space.txt

var=/root/run/target.txt ; export var=/root/run/target.txt ; output=/root/run/output ; export output=/root/run/output



if [ -s $var ]

then

cat $var > /root/run/target.txt
seq=$(seq 1 100 `wc -l  /root/run/target.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+100))
sed -n ''$i','$add'p' /root/run/target.txt > $var ; var=$var ; export var=$var

###如果更新就删除旧版,下载新版

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/run/zip.txt


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

cd /root/run



#head=0

#echo '#!/bin/bash' >> exe.sh

for line in `cat /root/httprobe_all.txt`

do

#length=`wc -l /root/httprobe_all.txt|grep -o -P ".*?(?=\ )"`
#for((#head=0;head<$length;head+=1))
#do

name=.html ; txt=$head$name ;  url=$head$line

#echo '#!/bin/bash' >> $head.sh
#echo "./xray_linux_amd64 webscan --url $line --json-output 1.txt" >> $head.sh
#echo "rm $head.sh" >> $head.sh
#echo "bash $head.sh" >> exe.sh

#head=$((head+1))
./xray_linux_amd64 webscan --url "$line" --json-output 1.txt ; cat 1.txt >> $output/xray/xray.txt ; echo ' ' >> $output/xray/xray.txt ; rm 1.txt
done

#cat /root/run/exe.sh | parallel --jobs 0 --delay 1
#rm /root/run/exe.sh


fi

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt



#### urlwatch添加
#
##echo '#!/bin/bash'> $output/urlwatch.sh ; cat $var > $output/urlwatch.sh ; bash $output/urlwatch.sh ; mv $output/urlwatch.sh $output/urlwatch.txt
#num=1
#echo "#!/bin/bash" >> exe.sh
#for url in `cat /root/httprobe_all.txt`
#do
#mkdir $num
#echo "#!/bin/bash" >> $num/$num.sh
#echo "urlwatch --add url=$url" >> $num/$num.sh
#echo "rm -r $num" >> $num/$num.sh
#echo "bash $num/$num.sh" >> exe.sh
#num=$((num+1))
#done
#cat exe.sh | parallel --jobs 0 --delay 0.5
#rm exe.sh
#rm -r dir_*


### 发邮件 ； 清空$output ； 发确认信息 ； 结束if urlwatch

mkdir $output/root ; ar=${var/target.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *;fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"scan"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg

rm -r $output

> $var ; cat /root/run/3.txt > /root/run/3_3.txt

done
rm /root/httprobe_all.txt
#urlwatch
fi
rm /root/var.txt
> /root/screenlog.0

























cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/wildcards
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>cards.txt;sed -e "s/\*\.//g" wilds.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee wilds.txt;rm -rf sed.txt;sort wilds.txt>sort.txt ; > wilds.txt ; cat sort.txt >wilds.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>>wilds.txt;sed -e "s/\*\.//g" wilds.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee wilds.txt;rm -rf sed.txt;sort wilds.txt>sort.txt ; > wilds.txt ; cat sort.txt >wilds.txt ; rm sort.txt
comm -3 wilds.txt cards.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; export var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;output=/root/script/domains_Github/wildcards/domains ; export output=/root/script/domains_Github/wildcards/domains
    touch /root/script/0_subdomain/0_subfinder.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent ; cd /root/script/0_subdomain/altdns ; touch /root/script/0_subdomain/0_altdns.txt ; altdns -i $var  -w words.txt -o /root/script/0_subdomain/0_altdns.txt -s 1.txt ; > 1.txt;cd /root/script/0_subdomain/subDomainsBrute ; touch /root/script/0_subdomain/0_subdomainbrute.txt

    for line in `cat $var`
    do
    python subDomainsBrute.py $line --full -i -o /root/script/0_subdomain/0_subdomainbrute.txt;cat /root/script/0_subdomain/0_subdomainbrute.txt|grep -o -P ".*?(?=\  )">>$var;> /root/script/0_subdomain/0_subdomainbrute.txt
    done
    cat /root/script/0_subdomain/0_subfinder.txt >>$var ;cat /root/script/0_subdomain/0_altdns.txt|grep -o -P ".*?(?=\:)" >>$var ; > /root/script/0_subdomain/0_subfinder.txt ; > /root/script/0_subdomain/0_altdns.txt ; sort -u $var -o sort.txt ; > $var ; cat sort.txt > $var ; rm sort.txt
    
    cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt
    for line in `cat $var`
    do
    python3 SubDomainizer.py -l $line -o /root/script/0_subdomain/0_subdomainizer.txt; cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ; >/root/script/0_subdomain/0_subdomainizer.txt
    done

    cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ;> /root/script/0_subdomain/0_subdomainizer.txt ; sort -u $var -o sort.txt ; > $var ; cat sort.txt >$var ; rm sort.txt

    cd /root/script/0_subdomain/massdns
    for brute in `cat $var`
    do
    python scripts/subbrute.py lists/names.txt $brute | massdns -r lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt
    awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u results.txt -o results.txt
    cat results.txt >> $var ; sort -u $var -o $var
    done
       

    cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt > $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var

    cat $var > /root/var.txt
    seq=$(seq 1 100 `wc -l  /root/var.txt | grep -o -P ".*?(?=\ )"`)
    for i in $seq
    do
    add=$((i+100))
    sed -n ''$i','$add'p' /root/var.txt > $var ; var=$var ; export var=$var

    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; git clone https://github.com/fngoo/git ; bash git/git.sh ; rm -r git ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort -u cliaws.txt -o awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; echo '-------- ------ --------------' >> $output/1_AWS.txt ; cd /root/script/1_aws/cloud_enum ; for line in `cat $var`; do python3 cloud_enum.py -k $line -l $output/2_.txt ; cat $output/2_.txt >> $output/2_AWS.txt ; rm $output/2_.txt; done ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh

    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort -u $output/5_dir_all.txt -o sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort -u $output/5_dir/5_301_403.txt -o sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    
    cat $output/3_httprobe.txt >> /root/httprobe_all.txt ; sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt ; mkdir $output/root ; ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"2"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg
    rm -r $output/*

    #var切片结束
    done
    rm /root/var.txt
    cd /root/script/domains_Github/wildcards/domains ; rm -rf *
    > /root/script/domains_Github/wildcards/cards.txt
    > /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt








mkdir /root/run/ ; mkdir /root/run/output

touch /root/run/3_3.txt ; mv /root/watch/1.txt /root/run/3.txt ; touch /root/run/zip.txt ; touch /root/run/zip1.txt



comm -3 /root/run/3.txt /root/run/3_3.txt > /root/run/target.txt ; sed 's/[[:space:]]//g' /root/run/target.txt > space.txt ; > /root/run/target.txt ; cat space.txt > /root/run/target.txt ; rm space.txt

var=/root/run/target.txt ; export var=/root/run/target.txt ; output=/root/run/output ; export output=/root/run/output



if [ -s $var ]

then

cat $var > /root/run/target.txt
seq=$(seq 1 100 `wc -l  /root/run/target.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+100))
sed -n ''$i','$add'p' /root/run/target.txt > $var ; var=$var ; export var=$var

###如果更新就删除旧版,下载新版

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/run/zip.txt


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

cd /root/run



#head=0

#echo '#!/bin/bash' >> exe.sh

for line in `cat /root/httprobe_all.txt`

do

#length=`wc -l /root/httprobe_all.txt|grep -o -P ".*?(?=\ )"`
#for((#head=0;head<$length;head+=1))
#do

name=.html ; txt=$head$name ;  url=$head$line

#echo '#!/bin/bash' >> $head.sh
#echo "./xray_linux_amd64 webscan --url $line --json-output 1.txt" >> $head.sh
#echo "rm $head.sh" >> $head.sh
#echo "bash $head.sh" >> exe.sh

#head=$((head+1))
./xray_linux_amd64 webscan --url "$line" --json-output 1.txt ; cat 1.txt >> $output/xray/xray.txt ; echo ' ' >> $output/xray/xray.txt ; rm 1.txt
done

#cat /root/run/exe.sh | parallel --jobs 0 --delay 1
#rm /root/run/exe.sh


fi

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt



#### urlwatch添加
#
##echo '#!/bin/bash'> $output/urlwatch.sh ; cat $var > $output/urlwatch.sh ; bash $output/urlwatch.sh ; mv $output/urlwatch.sh $output/urlwatch.txt
#num=1
#echo "#!/bin/bash" >> exe.sh
#for url in `cat /root/httprobe_all.txt`
#do
#mkdir $num
#echo "#!/bin/bash" >> $num/$num.sh
#echo "urlwatch --add url=$url" >> $num/$num.sh
#echo "rm -r $num" >> $num/$num.sh
#echo "bash $num/$num.sh" >> exe.sh
#num=$((num+1))
#done
#cat exe.sh | parallel --jobs 0 --delay 0.5
#rm exe.sh
#rm -r dir_*


### 发邮件 ； 清空$output ； 发确认信息 ； 结束if urlwatch

mkdir $output/root ; ar=${var/target.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *;fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"scan"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg

rm -r $output

> $var ; cat /root/run/3.txt > /root/run/3_3.txt

done
rm /root/httprobe_all.txt
#urlwatch
fi
rm /root/var.txt
> /root/screenlog.0


















#keep moni
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/0_subdomain
var=/root/script/domains_Github/wildcards/wilds.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent;cat /root/script/0_subdomain/0_subfinder.txt >>peek.txt; > /root/script/0_subdomain/0_subfinder.txt; sort peek.txt>sort.txt ; > peek.txt ; cat sort.txt >peek.txt ; rm sort.txt
#comm -3 peek.txt keep.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
#if [ -s domains_urlwatch.txt ]
#then
#    var=/root/script/domains_Github/0_subdomain/domains_urlwatch.txt ; mkdir /root/script/domains_Github/0_subdomain/domains ;output=/root/script/domains_Github/0_subdomain/domains ; export output=/root/script/domains_Github/0_subdomain/domains
#    cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt > $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var
#    
#    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; git clone https://github.com/fngoo/git ; bash git/git.sh ; rm -r git ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort -u cliaws.txt -o awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; echo '-------- ------ --------------' >> $output/1_AWS.txt ; cd /root/script/1_aws/cloud_enum ; for line in `cat $var`; do python3 cloud_enum.py -k $line -l $output/2_.txt ; cat $output/2_.txt >> $output/2_AWS.txt ; rm $output/2_.txt; done ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
#    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
#    for line in `cat $var`
#    do
#    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
#    done
#    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort -u $output/5_dir_all.txt -o sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort -u $output/5_dir/5_301_403.txt -o sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
#    cat $output/3_httprobe.txt >> /root/httprobe_all.txt ; sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt ; mkdir $output/root ; ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_monis.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"3"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg
#
#    cd /root/script/domains_Github/0_subdomain/domains ; rm -rf *
#    > /root/script/domains_Github/0_subdomain/keep.txt
#    > /root/script/domains_Github/0_subdomain/domains_urlwatch.txt
#fi
sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt




cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

cd /root/script/domains_Github/0_subdomain
var=/root/script/domains_Github/wildcards/wilds.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent;cat /root/script/0_subdomain/0_subfinder.txt >>keep.txt; > /root/script/0_subdomain/0_subfinder.txt; sort keep.txt>sort.txt ; > keep.txt ; cat sort.txt >keep.txt ; rm sort.txt
comm -3 keep.txt peek.txt > domains_urlwatch.txt ; sed 's/[[:space:]]//g' domains_urlwatch.txt > space.txt ; > domains_urlwatch.txt ; cat space.txt > domains_urlwatch.txt ; rm space.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/0_subdomain/domains_urlwatch.txt ; export var=/root/script/domains_Github/0_subdomain/domains_urlwatch.txt ; mkdir /root/script/domains_Github/0_subdomain/domains ;output=/root/script/domains_Github/0_subdomain/domains ; export output=/root/script/domains_Github/0_subdomain/domains
    cat $var | massdns -r /root/script/0_subdomain/massdns/lists/resolvers.txt -t A --hashmap-size 3000 -o S -w results.txt --root ; awk -F ". " '{print $1}' "results.txt" > "wordlist-filtered.txt" && mv "wordlist-filtered.txt" "results.txt" ; sort -u "results.txt" -o "results.txt" ; cat results.txt > $var ; rm results.txt ; cat $var|tee -a /root/watch/1.txt ; sort -u /root/watch/1.txt -o /root/watch/1.txt ; sort -u $var -o $var
    
    touch $output/0_burp.txt ; cat $var >$output/0_burp.txt  ; git clone https://github.com/fngoo/git ; bash git/git.sh ; rm -r git ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort -u cliaws.txt -o awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; echo '-------- ------ --------------' >> $output/1_AWS.txt ; cd /root/script/1_aws/cloud_enum ; for line in `cat $var`; do python3 cloud_enum.py -k $line -l $output/2_.txt ; cat $output/2_.txt >> $output/2_AWS.txt ; rm $output/2_.txt; done ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; cat $var|httprobe  -p 81 8443 8080 8880 | tee -a httprobe.txt ; git clone https://github.com/fngoo/remove ; mv remove/remove.sh remove.sh ; bash remove.sh ; rm -r remove ; rm remove.sh ; git clone https://github.com/fngoo/crawler ; mv crawler/crawler.sh crawler.sh ; bash crawler.sh ; rm -r crawler ; rm crawler.sh ; git clone https://github.com/fngoo/params ; mv params/params.sh params.sh ; bash params.sh ; rm params.sh ; rm -r params ; git clone https://github.com/fngoo/gethtml ; mv gethtml/gethtml.sh gethtml.sh ; bash gethtml.sh ; rm -r gethtml ; rm gethtml.sh ; git clone https://github.com/fngoo/html_grep ; mv html_grep/html_grep.sh html_grep.sh ; bash html_grep.sh ; rm -r html_grep ; rm html_grep.sh ; git clone https://github.com/fngoo/extractjs ; mv extractjs/extractjs.sh extractjs.sh ; bash extractjs.sh ; rm extractjs.sh ; rm -r extractjs ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort -u grep.txt -o jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ;  rm -f getjs.sh ; rm -r getjs ; mv httprobe.txt $output/3_httprobe.txt; mv getjs.txt $output/3_getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort -u $output/5_dir_all.txt -o sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort -u $output/5_dir/5_301_403.txt -o sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    cat $output/3_httprobe.txt >> /root/httprobe_all.txt ; sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt ; mkdir $output/root ; ar=${var/domains_urlwatch.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_monis.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname * ; fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"3"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg

    cd /root/script/domains_Github/0_subdomain/domains ; rm -rf *
    > /root/script/domains_Github/0_subdomain/peek.txt
    > /root/script/domains_Github/0_subdomain/domains_urlwatch.txt
fi
sort -u /root/httprobe_all.txt -o /root/httprobe_all.txt

mkdir /root/run/ ; mkdir /root/run/output

touch /root/run/3_3.txt ; mv /root/watch/1.txt /root/run/3.txt ; touch /root/run/zip.txt ; touch /root/run/zip1.txt



comm -3 /root/run/3.txt /root/run/3_3.txt > /root/run/target.txt ; sed 's/[[:space:]]//g' /root/run/target.txt > space.txt ; > /root/run/target.txt ; cat space.txt > /root/run/target.txt ; rm space.txt

var=/root/run/target.txt ; export var=/root/run/target.txt ; output=/root/run/output ; export output=/root/run/output



if [ -s $var ]

then

cat $var > /root/run/target.txt
seq=$(seq 1 100 `wc -l  /root/run/target.txt | grep -o -P ".*?(?=\ )"`)
for i in $seq
do
add=$((i+100))
sed -n ''$i','$add'p' /root/run/target.txt > $var ; var=$var ; export var=$var

###如果更新就删除旧版,下载新版

curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")" > /root/run/zip.txt


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

cd /root/run



#head=0

#echo '#!/bin/bash' >> exe.sh

for line in `cat /root/httprobe_all.txt`

do

#length=`wc -l /root/httprobe_all.txt|grep -o -P ".*?(?=\ )"`
#for((#head=0;head<$length;head+=1))
#do

name=.html ; txt=$head$name ;  url=$head$line

#echo '#!/bin/bash' >> $head.sh
#echo "./xray_linux_amd64 webscan --url $line --json-output 1.txt" >> $head.sh
#echo "rm $head.sh" >> $head.sh
#echo "bash $head.sh" >> exe.sh

#head=$((head+1))
./xray_linux_amd64 webscan --url "$line" --json-output 1.txt ; cat 1.txt >> $output/xray/xray.txt ; echo ' ' >> $output/xray/xray.txt ; rm 1.txt
done

#cat /root/run/exe.sh | parallel --jobs 0 --delay 1
#rm /root/run/exe.sh


fi

### masnmapscan模块

cat $var > /root/script/6_port/host2ip/host.txt

cd /root/script/6_port/host2ip ; python host2ip.py ; cat ip.txt > /root/script/6_port/masnmapscan-V1.0/ip.txt ; cd /root/script/6_port/masnmapscan-V1.0 ; python masnmapcan-V1.0.py

cp /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt $output/masscan_detail.txt ; cp /root/script/6_port/masnmapscan-V1.0/masscan.json $output/masscan.txt ; > /root/script/6_port/masnmapscan-V1.0/scan_url_port.txt ; > /root/script/6_port/masnmapscan-V1.0/ip.txt ; > /root/script/6_port/masnmapscan-V1.0/masscan.json ; > /root/script/6_port/host2ip/host.txt ; > /root/script/6_port/host2ip/ip.txt



### urlwatch添加

##echo '#!/bin/bash'> $output/urlwatch.sh ; cat $var > $output/urlwatch.sh ; bash $output/urlwatch.sh ; mv $output/urlwatch.sh $output/urlwatch.txt
#num=1
#echo "#!/bin/bash" >> exe.sh
#for url in `cat /root/httprobe_all.txt`
#do
#mkdir $num
#echo "#!/bin/bash" >> $num/$num.sh
#echo "urlwatch --add url=$url" >> $num/$num.sh
#echo "rm -r $num" >> $num/$num.sh
#echo "bash $num/$num.sh" >> exe.sh
#num=$((num+1))
#done
#cat exe.sh | parallel --jobs 0 --delay 0.5
#rm exe.sh
#rm -r dir_*


### 发邮件 ； 清空$output ； 发确认信息 ； 结束if urlwatch

mkdir $output/root ; ar=${var/target.txt/} ;cp $ar*.txt $output/root ; cp /root/watch/* $output/root ; cp /root/httprobe_all.txt $output/root ; cp /root/httprobe_all.txt $output/root ; cd $output;date "+%Y-%m-%d_%H:%M:%S" > /root/time.txt ; sed "s,:,_,g" /root/time.txt > 1time.txt ; mv 1time.txt /root/time.txt;slash=/;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *;fname=$slash$dayzoom$addname$zip ; mv $output$fname /root/zip ; s=hooks.sl ; c=ack.com/ser ; k=vices/TM26L9 ; sck=$s$c$k ; curl -X POST -H "Content-type:application/json" --data '{"text":"scan"}' https://${sck}ZEE/BM78UTLGH/GBt3k5B25BqAyc5EDzYPDdhg

rm -r $output

> $var ; cat /root/run/3.txt > /root/run/3_3.txt

done
rm /root/httprobe_all.txt
#urlwatch
fi
rm /root/var.txt
> /root/screenlog.0
