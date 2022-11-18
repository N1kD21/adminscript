#!/bin/bash


LOG=/var/log/$LOGNAME/crontabngrok.log

echo "Zashel.     id"  >> $LOG
id >> $LOG
echo "LOGNAME -> $LOGNAME" >> $LOG

# "конфиг ngrok.yml /home/bot4voc/.config/ngrok/ngrok.yml  не создавать, потому что не работает ngrok"

echo "PATH -> $PATH   " >> $LOG
echo "USER -> $USER   " >> $LOG

killall -v ngrok >> $LOG
#cd /usr/local/bin



if test -d /mnt/KEY/$LOGNAME;
then
	eval `/usr/local/bin/ngrok http 8080 --log=stdout --log-level=info >> $LOG &`

else
        echo "ngrok couldn't be started" >> $LOG
fi

