xset -q|grep LED| awk '{ if (index($0,"00001000") != 0) { print "RU"} else { print "EN" } }'
