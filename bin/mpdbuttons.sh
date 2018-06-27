#!/bin/bash
if [[ $# -eq 0 ]]; then
    echo "Usage: mpdbuttons.sh < prev | play | next >" 1>&2
    exit 1
fi
mpc stats &> /dev/null
if [ $? -eq 0 ]; then
    ISRUNNING=1
else
    ISRUNNING=0
fi
case "$1" in
    "play")
        if [ $ISRUNNING -eq 0 ]; then
            mpd
            sleep 5
            if [[ $( mpc playlist ) = "" ]]; then
                mpc load study
                mpc random on
                mpc repeat on
                mpc shuffle
                mpc consume on 
            fi
#            glava &
            mpc play
        else
            mpc toggle
        fi
        ;;

    "next")
        mpc next
        ;;
    "prev")
        mpc prev
        ;;
esac

