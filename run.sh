#!/bin/bash

### /root/3.txt需要修改，源主机可能过快发送
### 结束时清空文本

mkdir /root/run/ ; mkdir /root/run/output
touch /root/run/3_3.txt ; mv /root/3.txt /root/run/3.txt ; touch /root/run/zip.txt ; touch /root/run/zip1.txt

comm -3 /root/run/3.txt /root/run/3_3.txt > /root/run/target.txt
var=/root/run/target.txt ; output=/root/run/output

if [ -s $var ]
then

###如果更新就删除旧版,下载新版
curl -L github.com/chaitin/xray/releases|grep -oP "(?<=\<a\ href\=\"\/chaitin\/xray\/releases\/download\/).*?(?=\/xray\_linux\_amd64\.zip\")">/root/run/zip.txt
comm -3 /root/run/zip.txt /root/run/zip1.txt > /root/run/release.txt
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
cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;dayzoom=`cat /root/time.txt`;addname=_scan.txt;zip=.zip;fname=$dayzoom$addname$zip;zip -q -r $fname *; echo ":D"|mailx -v -r "410046251@qq.com" -s "port" -a $output/$fname -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
rm -r $output
echo '1'>/root/1scan.txt ; scp /root/1scan.txt root@45.199.152.172:/root
> $var ; cat /root/run/3.txt > /root/run/3_3.txt
fi
urlwatch
