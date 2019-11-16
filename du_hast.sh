yes|apt install screen
screen -dmS $"bash"
cmd=$"bash /root/sh/click_one.sh"
screen -x -S bash -X stuff "$cmd"
screen -x -S bash -X stuff $'\n'

screen -dmS $"http"
cmd=$"python -m SimpleHTTPServer 62345"
screen -x -S http -X stuff "$cmd"
screen -x -S http -X stuff $'\n'


echo "output.zip------cd /root/zip" ; echo "output.txt------/root/z_juice" ; echo "output.web------http://ip:62345/z_juice"
