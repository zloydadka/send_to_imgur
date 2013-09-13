#!/usr/bin/env sh



response=$(/usr/bin/env curl -# -X POST -H "Authorization: Client-ID bf89688ea4b3eef" -F "image=@$1" https://api.imgur.com/3/upload )
link=$(echo $response | sed -r 's/.*"link":"(.*)"}.*/\1/g' | sed 's/\\//g')
xdg-open $link