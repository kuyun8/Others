#!/bin/bash
#定义调用云盘接口，保持session长期有效。session有效期8个小时。

cookie="Cookie: SESSION=4b5cacef-7076-4c48-9601-6566d64ce7d0"
curl -I -s "http://yunpan.fj.pcc/api/v2/defaultConfig/tenant/get" -H "$cookie" -H "CS-NETWORKENV: public" -H "CS-PLATFORM: web" > /dev/null
