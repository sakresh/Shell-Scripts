#!/bin/sh

#printf "Provide the link of the album from pagalnew.com : "

printf "Album Name :"
read name

mkdir -p "$name"

#uniq for removing duplicates.
#sort for sorting multiple links

urls=$(curl -s "$1" | grep -o "https://pagalnew.com/songs/.*" | cut -d\" -f1 | sort | uniq)

for url in $urls;
do
	echo "Downloading $url..."
	aria2c -d "$name" "https://pagalnew.com/$(curl -s "$url" | grep "320 KBPS Song Download" | cut -d\" -f8)"
done

#notify-send "👍 songs downloaded successfully"
