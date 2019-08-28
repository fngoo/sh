#!/bin/bash
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
comm -3 mmoc.txt comm.txt > domains_urlwatch.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;export output=/root/script/domains_Github/domains/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_urlwatch.sh ; echo '#!/bin/sh' ; sed -e "s/^/urlwatch\ \-\-add\ url\=&/g" $var|tee $output/0_urlwatch.sh ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;dayzoom=`cat /root/time.txt`;addname=_domains.txt;fname=$dayzoom$addname;zip -q -r $fname.zip *; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_domains" -a $output/domains.zip -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com;rm domains.zip
    cd /root/script/domains_Github/domains/domains ; rm -rf *
    > /root/script/domains_Github/domains/comm.txt
    > /root/script/domains_Github/domains/domains_urlwatch.txt
fi
cd /root/script/domains_Github/domains
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)"> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/domains.txt|grep -oP "(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)">> mmoc.txt;sort mmoc.txt>sort.txt ; > mmoc.txt ; cat sort.txt >mmoc.txt ; rm sort.txt
comm -3  comm.txt  mmoc.txt > domains_urlwatch.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/domains/domains_urlwatch.txt ; mkdir /root/script/domains_Github/domains/domains ;export output=/root/script/domains_Github/domains/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_urlwatch.sh ; echo '#!/bin/sh' ; sed -e "s/^/urlwatch\ \-\-add\ url\=&/g" $var|tee $output/0_urlwatch.sh ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;dayzoom=`cat /root/time.txt`;addname=_domains.txt;fname=$dayzoom$addname;zip -q -r $fname.zip *; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_domains" -a $output/domains.zip -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com;rm domains.zip
    cd /root/script/domains_Github/domains/domains ; rm -rf *
    > /root/script/domains_Github/domains/mmoc.txt
    > /root/script/domains_Github/domains/domains_urlwatch.txt
fi
#wildcards.txt
cd /root/script/domains_Github/wildcards
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>cards.txt;sed -e "s/\*\.//g" cards.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee cards.txt;rm -rf sed.txt;sort cards.txt>sort.txt ; > cards.txt ; cat sort.txt >cards.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>>cards.txt;sed -e "s/\*\.//g" cards.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee cards.txt;rm -rf sed.txt;sort cards.txt>sort.txt ; > cards.txt ; cat sort.txt >cards.txt ; rm sort.txt
comm -3 cards.txt wilds.txt > domains_urlwatch.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;export output=/root/script/domains_Github/wildcards/domains
    touch /root/script/0_subdomain/0_subfinder.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent ; cd /root/script/0_subdomain/altdns ; touch /root/script/0_subdomain/0_altdns.txt ; altdns -i $var  -w words.txt -o /root/script/0_subdomain/0_altdns.txt -s 1.txt ; > 1.txt;cd /root/script/0_subdomain/subDomainsBrute ; touch /root/script/0_subdomain/0_subdomainbrute.txt

    for line in `cat $var`
    do
    python subDomainsBrute.py $line --full -i -o /root/script/0_subdomain/0_subdomainbrute.txt;cat /root/script/0_subdomain/0_subdomainbrute.txt|grep -o -P ".*?(?=\  )">>$var;> /root/script/0_subdomain/0_subdomainbrute.txt
    done
    cat /root/script/0_subdomain/0_subfinder.txt >>$var ;cat /root/script/0_subdomain/0_altdns.txt|grep -o -P ".*?(?=\:)" >>$var ; > /root/script/0_subdomain/0_subfinder.txt ; > /root/script/0_subdomain/0_altdns.txt ; sort $vat|uniq|tee sort.txt ; > $var ; cat sort.txt > $var ; rm sort.txt
    
    cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt
    for line in `cat $var`
    do
    python3 SubDomainizer.py -l $line -o /root/script/0_subdomain/0_subdomainizer.txt; cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ; >/root/script/0_subdomain/0_subdomainizer.txt
    done
    
    cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ;> /root/script/0_subdomain/0_subdomainizer.txt ; sort $var|uniq|tee sort.txt ; > $var ; cat sort.txt >$var ; rm sort.txt
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_urlwatch.sh ; echo '#!/bin/sh' ; sed -e "s/^/urlwatch\ \-\-add\ url\=&/g" $var|tee $output/0_urlwatch.sh ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    
    cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;fname=$dayzoom$addname;zip -q -r $fname.zip *; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_wildcards" -a $output/domains.zip -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/wildcards/domains ; rm -rf *
    > /root/script/domains_Github/wildcards/wilds.txt
    > /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
cd /root/script/domains_Github/wildcards
curl -L https://github.com/arkadiyt/bounty-targets-data/blob/master/data/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>cards.txt;sed -e "s/\*\.//g" wilds.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee wilds.txt;rm -rf sed.txt;sort wilds.txt>sort.txt ; > wilds.txt ; cat sort.txt >wilds.txt ; rm sort.txt ; curl -L https://github.com/fngoo/domains/blob/master/wildcards.txt|grep -oP '(?<=\ class\=\"blob\-code\ blob\-code\-inner\ js\-file\-line\"\>).*?(?=\<\/td\>)'>>wilds.txt;sed -e "s/\*\.//g" wilds.txt|tee sed.txt;sed -e "/\*/d" sed.txt|tee wilds.txt;rm -rf sed.txt;sort wilds.txt>sort.txt ; > wilds.txt ; cat sort.txt >wilds.txt ; rm sort.txt
comm -3 wilds.txt cards.txt > domains_urlwatch.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/wildcards/domains_urlwatch.txt ; mkdir /root/script/domains_Github/wildcards/domains ;export output=/root/script/domains_Github/wildcards/domains
    touch /root/script/0_subdomain/0_subfinder.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent ; cd /root/script/0_subdomain/altdns ; touch /root/script/0_subdomain/0_altdns.txt ; altdns -i $var  -w words.txt -o /root/script/0_subdomain/0_altdns.txt -s 1.txt ; > 1.txt;cd /root/script/0_subdomain/subDomainsBrute ; touch /root/script/0_subdomain/0_subdomainbrute.txt

    for line in `cat $var`
    do
    python subDomainsBrute.py $line --full -i -o /root/script/0_subdomain/0_subdomainbrute.txt;cat /root/script/0_subdomain/0_subdomainbrute.txt|grep -o -P ".*?(?=\  )">>$var;> /root/script/0_subdomain/0_subdomainbrute.txt
    done
    cat /root/script/0_subdomain/0_subfinder.txt >>$var ;cat /root/script/0_subdomain/0_altdns.txt|grep -o -P ".*?(?=\:)" >>$var ; > /root/script/0_subdomain/0_subfinder.txt ; > /root/script/0_subdomain/0_altdns.txt ; sort $vat|uniq|tee sort.txt ; > $var ; cat sort.txt > $var ; rm sort.txt
    
    cd /root/script/0_subdomain/SubDomainizer ; touch /root/script/0_subdomain/0_subdomainizer.txt
    for line in `cat $var`
    do
    python3 SubDomainizer.py -l $line -o /root/script/0_subdomain/0_subdomainizer.txt; cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ; >/root/script/0_subdomain/0_subdomainizer.txt
    done
    
    cat /root/script/0_subdomain/0_subdomainizer.txt>>$var ;> /root/script/0_subdomain/0_subdomainizer.txt ; sort $var|uniq|tee sort.txt ; > $var ; cat sort.txt >$var ; rm sort.txt
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_urlwatch.sh ; echo '#!/bin/sh' ; sed -e "s/^/urlwatch\ \-\-add\ url\=&/g" $var|tee $output/0_urlwatch.sh ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    
    cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;dayzoom=`cat /root/time.txt`;addname=_wildcards.txt;fname=$dayzoom$addname;zip -q -r $fname.zip *; echo ":D"|mailx -v -r "410046251@qq.com" -s "Github_wildcards" -a $output/domains.zip -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/wildcards/domains ; rm -rf *
    > /root/script/domains_Github/wildcards/cards.txt
    > /root/script/domains_Github/wildcards/domains_urlwatch.txt
fi
#keep moni
cd /root/script/domains_Github/0_subdomain
var=/root/script/domains_Github/wildcards/wilds.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent;cat /root/script/0_subdomain/0_subfinder.txt >>peek.txt; > /root/script/0_subdomain/0_subfinder.txt; sort peek.txt>sort.txt ; > peek.txt ; cat sort.txt >peek.txt ; rm sort.txt
comm -3 peek.txt keep.txt > domains_urlwatch.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/0_subdomain/domains_urlwatch.txt ; mkdir /root/script/domains_Github/0_subdomain/domains ;export output=/root/script/domains_Github/0_subdomain/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_urlwatch.sh ; echo '#!/bin/sh' ; sed -e "s/^/urlwatch\ \-\-add\ url\=&/g" $var|tee $output/0_urlwatch.sh ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;dayzoom=`cat /root/time.txt`;addname=_monis.txt;fname=$dayzoom$addname;zip -q -r $fname.zip *; echo ":D"| mailx -v -r "410046251@qq.com" -s "0_subdomain" -a $output/domains.zip -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/0_subdomain/domains ; rm -rf *
    > /root/script/domains_Github/0_subdomain/keep.txt
    > /root/script/domains_Github/0_subdomain/domains_urlwatch.txt
fi
cd /root/script/domains_Github/0_subdomain
var=/root/script/domains_Github/wildcards/wilds.txt ; subfinder  -dL $var -o /root/script/0_subdomain/0_subfinder.txt  -silent;cat /root/script/0_subdomain/0_subfinder.txt >>keep.txt; > /root/script/0_subdomain/0_subfinder.txt; sort keep.txt>sort.txt ; > keep.txt ; cat sort.txt >keep.txt ; rm sort.txt
comm -3 keep.txt peek.txt > domains_urlwatch.txt
if [ -s domains_urlwatch.txt ]
then
    var=/root/script/domains_Github/0_subdomain/domains_urlwatch.txt ; mkdir /root/script/domains_Github/0_subdomain/domains ;export output=/root/script/domains_Github/0_subdomain/domains
    cat $var|tee -a /root/watch/1.txt
    touch /root/watch/2.txt;sort /root/watch/1.txt|uniq|tee -a /root/watch/2.txt;> /root/watch/1.txt;cat /root/watch/2.txt>>/root/watch/1.txt;rm /root/watch/2.txt
    touch $output/0_urlwatch.sh ; echo '#!/bin/sh' ; sed -e "s/^/urlwatch\ \-\-add\ url\=&/g" $var|tee $output/0_urlwatch.sh ; cd /root/script/1_aws/AWSBucketDump ; python3 AWSBucketDump.py -l $var ; cat interesting_file.txt|grep -o -P "(?<=//).*?(?=/)" >> cliaws.txt ; sort cliaws.txt|uniq|tee awscli.txt ; sed -e "s/^/aws\ s3\ mv\ D\:\\\1\.txt\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ \-\-no\-sign\-request/g" >>  uploadaws.txt; sed -e "s/^/aws\ s3\ mv\ s3\:\/\/&/g" awscli.txt|sed -e "s/$/&\ D\:\\\aws_bucket\ \-\-recursive\ \-\-no\-sign\-request/g" >>  uploadaws.txt ; cp uploadaws.txt $output/1_AWS.txt ; > interesting_file.txt ; > cliaws.txt ; > awscli.txt ; > uploadaws.txt ; cd /root/script/2_subjack ; cd $output ; touch 2_Takeover1.txt;touch 2_Takeover2.txt;subjack -w $var   -ssl -a -o $output/2_Takeover1.txt  ; subjack -w $var    -a -o $output/2_Takeover2.txt ; cd /root/script/3_httprobe ; mkdir $output/3_js ; sed 's/^/https\:\/\//g' $var|tee httprobe.txt ; getJS -input httprobe.txt -complete -output getjs.txt ; cat getjs.txt|grep -o -P "(?<=//).*?(?=/)" >> grep.txt ; sort grep.txt|uniq|tee jstakeover.txt ; cd $output ; touch 3_2_takeover1.txt;touch 3_2_takeover2.txt;subjack -w /root/script/3_httprobe/jstakeover.txt  -ssl -a -o $output/3_2_takeover1.txt ; subjack -w /root/script/3_httprobe/jstakeover.txt  -a -o $output/3_2_takeover2.txt ; cd /root/script/3_httprobe; git clone https://github.com/fngoo/getjs ; mv getjs/getjs.sh getjs.sh ; sh getjs.sh ; mv getjs.txt $output/3_JSsource.txt ; rm -f getjs.sh ; rm -r getjs ; > httprobe.txt ; > getjs.txt ; > grep.txt ; > jstakeover.txt ; cd /root/script/4_getjs ; git clone https://github.com/fngoo/grep ; mv grep/grep.sh grep.sh ; rm -rf grep ; output=$output ; cd $output/3_js ; sh /root/script/4_getjs/grep.sh ; rm /root/script/4_getjs/grep.sh
    cd /root/script/5_dir/dirsearch ; mkdir $output/5_dir
    for line in `cat $var`
    do
    python3 dirsearch.py  -u $line -e * -w dict_mode_dict.txt -t 30 --timeout=6 --max-retries=1 --plain-text-report=$output/5_dir/$line.txt ; sed -e "/0B\ \-/d" $output/5_dir/$line.txt|tee sed.txt ; > $output/5_dir/$line.txt ; cat sed.txt > $output/5_dir/$line.txt ; rm sed.txt ; grep -E "301|403" $output/5_dir/$line.txt|grep  "http.*"|tee $output/5_dir/301_403_$line.haha
    done
    cat $output/5_dir/*.txt > $output/5_dir_all.txt ; sort $output/5_dir_all.txt|uniq|tee sort.txt ; > $output/5_dir_all.txt ; cat sort.txt > $output/5_dir_all.txt ; rm sort.txt ; cat $output/5_dir/*.haha > $output/5_dir/5_301_403.txt ; sort $output/5_dir/5_301_403.txt|uniq|tee sort.txt ; > $output/5_dir/5_301_403.txt ; cat sort.txt > $output/5_dir/5_301_403.txt ; rm sort.txt ; cd $output/5_dir ;  rename 's/\.haha/\.txt/'  ./*
    cd $output;date|sed -e 's/\ /\_/g'|sed -e 's/\://g' > /root/time.txt;dayzoom=`cat /root/time.txt`;addname=_monis.txt;fname=$dayzoom$addname;zip -q -r $fname.zip *; echo ":D"| mailx -v -r "410046251@qq.com" -s "0_subdomain" -a $output/domains.zip -S smtp="smtp.qq.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="410046251@qq.com" -S smtp-auth-password="skjdnfvnewrocajj" -S ssl-verify=ignore 410046251@qq.com
    rm domains.zip
    cd /root/script/domains_Github/0_subdomain/domains ; rm -rf *
    > /root/script/domains_Github/0_subdomain/peek.txt
    > /root/script/domains_Github/0_subdomain/domains_urlwatch.txt
fi
