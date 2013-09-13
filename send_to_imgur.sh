#!/usr/bin/env sh

cliend_id="bf89688ea4b3eef"

response=$(/usr/bin/env curl -# -X POST -H "Authorization: Client-ID $cliend_id" -F "image=@$1" https://api.imgur.com/3/upload )
link=$(echo $response | sed -r 's/.*"link":"(.*)"}.*/\1/g' | sed 's/\\//g')

qdbus org.kde.klipper /klipper setClipboardContents "$link"
xdg-open $link