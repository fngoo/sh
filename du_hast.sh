yes|apt install screen
screen -dmS $"bash"
cmd=$"bash /root/sh/click_one.sh"
screen -x -S bash -X stuff "$cmd"
screen -x -S bash -X stuff $'\n'

screen -dmS $"http"
cmd=$"python -m SimpleHTTPServer 62345"
screen -x -S http -X stuff "$cmd"
screen -x -S http -X stuff $'\n'

clear
echo "output.zip------cd /root/zip" ; echo "output.txt------cd /root/z_juice" ; echo "output.web------http://ip:62345/z_juice"
echo ""
head -16 /root/sh/du_hast.sh | tail -1
#a=`date "+%Y-%m-%d_%H:%M:%S"` ; echo "curl -X POST -H \"Content-type:application/json\" --data '{\"text\":\"${a}\"}' https://hooks.slack.com/services/token/token/token" > /root/script/slack.sh ; bash /root/script/slack.sh ; rm /root/script/slack.sh
echo "copy to"
echo "/root/script/webhook.sh"
