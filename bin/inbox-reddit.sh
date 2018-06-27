#!/bin/sh

#
# Script not mine. I found it here: https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/inbox-reddit
# I only modified it a bit.
#
url="https://www.reddit.com/message/unread/.json?feed=cdbb9ac2fa1031ef3f10a1913e5480edd0515fc4&user=Guido_Fe"
unread=$(curl -sf "$url" | jq '.["data"]["children"] | length')
if [[ -z "$unread" ]]; then
    echo ""
    exit 0
fi
if [ "$unread" -gt 0 ]; then
   echo "%{F#e0563a}%{F-}$unread"
else
   echo ""
fi
