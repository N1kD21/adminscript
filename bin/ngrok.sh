#!/bin/bash



#LOG=/home/$LOGNAME/log/ngrok.log
LOG=$HOMELOG/ngrok.log

echo "Start --------------------------------------"
echo "Зашел.     id"  >> $LOG
id >> $LOG
echo "LOGNAME -> $LOGNAME" >> $LOG

# "конфиг ngrok.yml /home/$USERBOT/.config/ngrok/ngrok.yml  не создавать, потому что не работает ngrok"

echo "PATH -> $PATH   " >> $LOG
echo "USER -> $USER   " >> $LOG

killall -v ngrok >> $LOG



if [ -n "$PATHFLASH" ] ;
then

PATHKEY=/mnt/$PATHFLASH/$USERBOT

else

PATHKEY=/home/$USERBOT/source/${NAMEPROJECT}/conf

fi


if test -d $PATHKEY;
then
	echo "start ngrok +++++++++++++++++++++++"
	eval `/usr/local/bin/ngrok http 8080 --log=stdout --log-level=info >> $LOG &`

else
        echo "ngrok couldn't be started" >> $LOG
fi



echo "End ======================================="
