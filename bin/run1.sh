#!/bin/bash
# регулярный запуск ngrok через cron БЕЗ sudo

# исправить на правильный путь

PATHCONFBOTUSER="/home/$LOGNAME/source/adminscript/conf"
#PATHCONFBOT="/home/$SUDO_USER/source/adminscript/conf"

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
    echo "PATHCONFBOTUSER -> $PATHCONFBOTUSER"
    echo "PATHKEY -> $PATHKEY"
    echo "-------------------------------"
    echo "printenv"
    #printenv
    echo "-------------------------------"
}

loadconfUser()
{
    #echo "Загружаем переменные"
    #  указать путь, где лежит настройка
    # путь временый ~/source/adminscript/conf/
    source $PATHCONFBOTUSER/AdminScriptVar
    . $HOMEADMIN/controlpath.sh >> $HOMELOG/ngrok.log 2>&1

}
# загружаем конфигурационный файл с настройками

echo "до загрузки in run1" >> /home/bot4voc/source/adminscript/log/ngrok.log 2>&1
echo "--------/ngrok.log " >> /home/bot4voc/source/adminscript/log/ngrok.log 2>&1
printenv >> /home/bot4voc/source/adminscript/log/ngrok.log 2>&1

#printVar >> $HOMELOG/ngrok.log 2>&1


loadconfUser
echo "после загрузки in run1" >> $HOMELOG/ngrok.log 2>&1
printVar >> $HOMELOG/ngrok.log 2>&1

echo "0 -> $0" >> $HOMELOG/ngrok.log 2>&1
echo "1 -> $1" >> $HOMELOG/ngrok.log 2>&1
echo "2 -> $2" >> $HOMELOG/ngrok.log 2>&1



#. $HOMEADMIN/ngrok.sh >> $HOMELOG/ngrok.log 2>&1
