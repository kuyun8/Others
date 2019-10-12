import requests
import shutil
import hashlib
from requests.exceptions import RequestException
import re
import json
import os

def get_one_page(url,headers):
   try:
        response = requests.get(url,headers = headers)
        response.encoding = 'utf-8'
        if response.status_code == 200:
            return response.text
        return None
   except RequestException:
       return None

def parse_one_page(html):
#提取网页信息的正则表达式
    pattern = re.compile('div class="latestPolicy_left_item".*?<a .*?>(.*?)</a>',re.S)  
    items = re.findall(pattern,html)
    for item in items:
        yield {
	item
}
def write_to_file(content,path):
    with open(path, 'w') as f:
        f.write(json.dumps(content))
        f.close()

def open_file(file):
	with open(file,'r',encoding='utf-8') as f:
		load_file=json.load(f)
		return load_file
def gethash(file):
	with open(file,'r',encoding='utf-8') as f:
		line=json.load(f)
		hash=hashlib.md5()
		hash.update(str(line).encode(encoding='utf-8'))
		return hash.hexdigest()
def ishashequal(f1,f2):
	str1=gethash(f1)
	str2=gethash(f2)
	return str1==str2
def msg(text):

    headers = {'Content-Type': 'application/json;charset=utf-8'}
    api_url = "https://oapi.dingtalk.com/robot/send?access_token=6fa35f1e2bfd6518b067edcf7cc86574a14cef08685a0e1bc58a092165c7564a"
    json_text= {
     "msgtype": "text",
        "text": {
            "content": text
        },
        "at": {
            "atMobiles": [
                "18396088893"
            ],
            "isAtAll": False
        }
    }
    print(requests.post(api_url,json.dumps(json_text),headers=headers).content)

def main():
    url = 'http://www.gov.cn/zhengce/index.htm'
    user_agent = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'
    headers = {'User-Agent': user_agent}
    html = get_one_page(url, headers)
    content_list_new=[]
    old_path="/root/python3/news/old.txt"
    new_path="/root/python3/news/new.txt"
    for item in parse_one_page(html):
        content_list_new.append(list(item))
    write_to_file(content_list_new[0],new_path)
    if not ishashequal(old_path,new_path):
        test=open_file(new_path) 
        msg(test)
        os.remove(old_path)
        shutil.copy(new_path,old_path)
if __name__ == '__main__':
    main()

