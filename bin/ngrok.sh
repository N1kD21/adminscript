#!/bin/bash

PATHCONFBOT="/home/$SUDO_USER/source/adminscript/conf"

printVar()
{

    echo "-------------------------------"
    echo "Cодержание переменных"
    echo "USERBOT -> $USERBOT"
    echo "SUDO_USER -> $SUDO_USER"
    echo "LOGNAME -> $LOGNAME"
    echo "HOME -> $HOME"
    echo "PATHCONFBOT -> $PATHCONFBOT"
    echo "HOMEADMIN -> $HOMEADMIN"
    echo "HOMEINIT -> $HOMEINIT"
    echo "HOMELOG -> $HOMELOG"
    echo "PATHFLASH -> $PATHFLASH"
    echo "-------------------------------"
#    printenv
    echo "-------------------------------"
}


loadconf()
{

    echo "Загружаем переменные"
    #  указать путь, где лежит настройка
    # путь временый ~/source/adminscript/conf/

    if  [ -n "$SUDO_USER" ] ;
	then
        source $PATHCONFBOT/AdminScriptVar
        . $HOMEADMIN/controlpath.sh
        echo "SUDO_USER -> not null."
	else
	 echo "SUDO_USER -> null."
	 echo "Не удалось подгрузить файл конфигурации!"
	 echo "Необходимо использовать sudo -s"
    fi


}

# загружаем конфигурационный файл с настройками


#LOG=/home/$LOGNAME/log/ngrok.log

loadconf
#printVar

LOG=$HOMELOG/ngrok.log

echo "Start --------------------------------------"
echo "[`date +%d-%m-%Y\ %H:%M:%S`]"
echo "Зашел.     id"  >> $LOG
id >> $LOG
echo "LOGNAME -> $LOGNAME" >> $LOG

# "конфиг ngrok.yml /home/$USERBOT/.config/ngrok/ngrok.yml  не создавать, потому что не работает ngrok"

echo "PATH -> $PATH   " >> $LOG
echo "USER -> $USER   " >> $LOG

killall -v ngrok >> $LOG


if test -d $PATHKEY;
then
	echo "start ngrok +++++++++++++++++++++++"
	eval `/usr/local/bin/ngrok http 8080 --log=stdout --log-level=info >> $LOG &`

else
        echo "ngrok couldn't be started" >> $LOG
fi



echo "End ======================================="
