#!/bin/bash
# регулярный запуск ngrok через cron БЕЗ sudo

# исправить на правильный путь

PATHLOGNAME="/home/$LOGNAME/source/adminscript/conf"
PATHSUDOUSER="/home/$SUDO_USER/source/adminscript/conf"

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

#printenv

sudo -u bot4voc printenv



#loadconfUser
printVar


