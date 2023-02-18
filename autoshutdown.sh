#!/bin/sh
SERVICE='paper'
USER='noogai880'
if ps ax | grep -v grep | grep $SERVICE > /dev/null; then
        PLAYERSEMPTY=" There are 0 of a max of 20 players online"
        $(sudo screen -S MinecraftServerScreen -p 0 -X stuff "list^M")
        sleep 5
        $(sudo screen -S MinecraftServerScreen -p 0 -X stuff "list^M")
        sleep 5
        PLAYERSLIST=$(tail -n 1 /home/$USER/logs/latest.log | cut -f2 -d"/" | cut -f2 -d":")
        echo $PLAYERSLIST
        echo $PLAYERSEMPTY
        if [ "$PLAYERSLIST" = "$PLAYERSEMPTY" ]
        then
                $(sudo screen -S MinecraftServerScreen -p 0 -X stuff "list^M")
                sleep 5
                $(sudo screen -S MinecraftServerScreen -p 0 -X stuff "list^M")
                sleep 5
                PLAYERSLIST=$(tail -n 1 /home/$USER/logs/latest.log | cut -f2 -d"/" | cut -f2 -d":")
                echo $PLAYERSLIST
                if [ "$PLAYERSLIST" = "$PLAYERSEMPTY" ]
                then
                        $(sudo screen -S MinecraftServerScreen -p 0 -X stuff "stop^M")
                        echo "No players found after a while, shutting down"
                        $(sudo shutdown now)
                fi
        fi
else
        echo "Screen does not exist, briefly waiting before trying again"
        sleep 5m
        if ! ps ax | grep -v grep | grep $SERVICE > /dev/null; then
                echo "Screen does not exist, shutting down"
                $(sudo shutdown now)
        fi
fi