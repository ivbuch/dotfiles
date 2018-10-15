#!/bin/sh

echo "weather not working"
exit 0
url="https://www.accuweather.com/en/us/cary-nc/27513/weather-forecast/334877"
weather=$(wget -q -O- "$url")

line=$(echo "$weather" | grep '^acm_RecentLocationsCaro' | head -n 1)
# echo "$line"
temp=$(echo "$line" | sed -r -n "s/.*temp:'(.*)',  real.*/\\1/p")
real_feel=$(echo "$line" | sed -r -n "s/.*realfeel:'(.*)',  text.*/\\1/p")
text=$(echo "$line" | sed -r -n "s/.*text:\"(.*)\".*/\\1/p")
# echo temp $temp
# echo real $real_feel
# echo text $text

echo "❄️ $text $temp° ☀️ $real_feel°"
