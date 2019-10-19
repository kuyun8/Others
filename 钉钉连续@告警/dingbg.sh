#!/bin/sh
while true ; do
ls /tmp/ | grep dingalert.sendto | while read _sendtofile; do
	sleep 5
	_messagefile=`echo $_sendtofile | sed 's/sendto/message/'`
	_message=`cat /tmp/$_messagefile| sed 's/%/percent/g' | sed 's/"//g'`
	_sendto=`cat /tmp/$_sendtofile | tr '\n' ',' | sed 's/,$//'`
	_token=`echo $_sendtofile | awk -F '.' '{print $NF}'`
	python /usr/lib/zabbix/alertscripts/dingtalk.py "$_message" "$_sendto" "$_token"
	rm -f /tmp/$_messagefile /tmp/$_sendtofile
	done
sleep 1
done
