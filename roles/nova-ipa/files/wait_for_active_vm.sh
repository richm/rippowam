#!/bin/sh
ii=$2
while [ $ii -gt 0 ] ; do
    if openstack server show $1|grep ACTIVE ; then
        exit 0
    fi
    if openstack server show $1|grep ERROR ; then
        echo could not create server
        openstack server show $1
        exit 1
    fi
    ii=`expr $ii - 1`
done
echo timedout waiting $2 seconds for server $1
exit 1
