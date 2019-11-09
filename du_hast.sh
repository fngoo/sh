screen -L -dmS $"bash"
cmd=$"bash /root/sh/click_one.sh"
screen -x -S bash -X stuff "$cmd"
screen -x -S bash -X stuff $'\n'

echo "du"

screen -dmS $"http"
cmd=$"python -m SimpleHTTPServer 62345"
screen -x -S http -X stuff "$cmd"
screen -x -S http -X stuff $'\n'

echo "du hast"
echo "Rammstein - Du Hast"
echo ""
echo ""
echo ""
echo "http://ip:62345"
echo "tail -f screenlog.0"
