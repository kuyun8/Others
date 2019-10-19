#!/bin/sh
_message=`echo "$1" | sed 's///g'`
_sendto=$2
_token=$3
echo "$_message" "$_sendto" "$_token" >>/tmp/ding.log

_id=`echo "$_message" | grep 'Original problem ID' | awk '{print $NF}' | sed 's///'`


echo "$_message" >/tmp/dingalert.message.$_id.$_token
echo "$_sendto" >>/tmp/dingalert.sendto.$_id.$_token
