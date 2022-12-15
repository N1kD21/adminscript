#!/bin/bash
# "конфиг ngrok.yml /home/$USERBOT/.config/ngrok/ngrok.yml  не создавать, потому что не работает ngrok"


echo "Start --------------------------------------"
echo "[`date +%d-%m-%Y\ %H:%M:%S`]"
echo "Зашел.     id"
id
echo "LOGNAME -> $LOGNAME"
echo "HOMELOG -> $HOMELOG"
echo "PATHKEY -> $PATHKEY"
echo "PATH -> $PATH   "
echo "USER -> $USER   "

killall -v ngrok


if test -d $PATHKEY;
then
	echo "start ngrok +++++++++++++++++++++++"
	#eval `/usr/local/bin/ngrok http 8080 --log=$HOMELOG/ngrok.log --log-level=info &`
	/usr/local/bin/ngrok http 8080 --log=$HOMELOG/ngrok.log --log-level=info &
else
        echo "ngrok couldn't be started"
fi



echo "End ======================================="
