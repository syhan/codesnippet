#!/bin/bash

ID=<ID>
PW=<PW>

curl 'http://jzh.12333sh.gov.cn/jzh/' --cookie-jar session.cookie --silent --output /dev/null

while [[ $(curl 'http://jzh.12333sh.gov.cn/jzh/image.jsp?Math.random();' --cookie session.cookie -o verify.png --silent && tesseract verify.png code -l eng && cat code.txt | wc -m) != 6 ]]
do
    echo "retry"
done

curl 'http://jzh.12333sh.gov.cn/jzh/userLoginAction!login.action' --cookie session.cookie --data "loginInfo.login_username=$ID&loginInfo.login_password=$PW&loginInfo.login_type=0&Rand=`cat code.txt`&radioCode=1&Submit=+" --silent --output /dev/null
curl 'http://jzh.12333sh.gov.cn/jzh/userLoginAction!LoginPerson.action' --cookie session.cookie --data "Button=%E6%88%91%E6%8E%A5%E5%8F%97&username=$ID" --silent | grep '<td  align="center">&nbsp;' -A 5 | sed -r 's/<td\s+align="center">&nbsp;//g' | sed -r 's/<\/td>//g'

rm verify.png
rm code.txt
rm session.cookie
