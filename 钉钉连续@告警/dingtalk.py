#!/usr/bin/python
# -*- coding: utf-8 -*-
 
import requests
import json
import sys
import os
 
headers = {'Content-Type': 'application/json;charset=utf-8'}
 
def msg(text):
    json_text= {
     "msgtype": "text",
        "text": {
            "content": text
        },
        "at": {
            "atMobiles": [
                sendto[0],sendto[1],sendto[2],sendto[3],sendto[4],sendto[5],sendto[6]
            ],
            "isAtAll": False
        }
    }
    print ("error:" + requests.post(api_url,json.dumps(json_text),headers=headers).content)
     
if __name__ == '__main__':
    text = sys.argv[1]
    api_url = "http://oapi.dingtalk.com/robot/send?access_token=" + sys.argv[3]
    sendto = ['','','','','','','']
    presendto = sys.argv[2].split(',')
    for i in presendto:
        index = presendto.index(i)
        sendto[index] = i
    msg(text)
