#!/bin/sh
ii=$2
while [ $ii -gt 0 ] ; do
    if ping -q -W1 -c1 -n $1 ; then
        exit 0
    fi
    ii=`expr $ii - 1`
    sleep 1
done
if [ $ii = 0 ] ; then
    echo $LINENO server $1 did not respond after $2 seconds
    exit 1
fi
exit 0
