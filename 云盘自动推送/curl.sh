#!/bin/bash
#实现上传文件到云盘

cookie="Cookie: SESSION=4b5cacef-7076-4c48-9601-6566d64ce7d0"
fl=`ls -lt /home/admin/zhujz/aliyun_daylog | awk 'NR==2{print $NF}'`
file=`echo "/home/admin/zhujz/aliyun_daylog/$fl"`
size=`ls -lt /home/admin/zhujz/aliyun_daylog | awk 'NR==2{print $5}'`
#dt=`date +%F | sed 's/-//g'`
filename=`echo "福建高院专有云项目运维日报$fl"`

curl -s -X POST "http://yunpan.fj.pcc/api/v2/file/inner/upload" -H "Host: yunpan.fj.pcc" -H "Accept: */*" -H "Origin: http://yunpan.fj.pcc" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36" -H "Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryooTeLzA8ZAvSVHtk" -H "Referer: http://yunpan.fj.pcc/" -H "Accept-Language: en-US,en;q=0.9,zh;q=0.8,zh-TW;q=0.7" -H "$cookie" -H "Connection: keep-alive" -F id=WU_FILE_0 -F name=$filename -F type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" -F lastModifiedDate="Mon Aug 12 2019 17:56:15 GMT+0800 (\u4e2d\u56fd\u6807\u51c6\u65f6\u95f4)" -F size=$size -F dirId=8F00CC418040420A8A7C5F7FB1D9A863 -F guid=wu_1di7ok6ul181e10n21khc5d71s5di -F formData=93EB9B4AB68542F3B52AC8FFC3ECAED0 -F file=@$file
