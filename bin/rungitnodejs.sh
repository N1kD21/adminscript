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
    #printenv
    echo "-------------------------------"
}

loadconfUser()
{
    #echo "Загружаем переменные"
    #  указать путь, где лежит настройка
    # путь временый ~/source/adminscript/conf/
    source $PATHCONFBOTUSER/AdminScriptVar
    . $HOMEADMIN/controlpath.sh

}
# загружаем конфигурационный файл с настройками

loadconfUser
printVar >> $HOMELOG/ngrok.log 2>&1


#. $HOMEADMIN/ngrok.sh >> $HOMELOG/ngrok.log 2>&1

. $HOMEADMIN/gitnodejs.sh t $LOGNAME >> $HOMELOG/gitnodejs.log 2>&1

