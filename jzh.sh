#!/bin/bash
[[ -x `which tesseract` ]]
[ $? -ne 0 ] && exit

ID=<ID>
PW=<PW>

echo -ne "Start session..."
curl 'http://jzh.12333sh.gov.cn/jzh/' --cookie-jar session.cookie --silent --output /dev/null
echo -ne " [Done]\n"

while true
do
    echo -ne "Get verify code..."
    curl 'http://jzh.12333sh.gov.cn/jzh/image.jsp?Math.random();' --cookie session.cookie -o verify.png --silent
    echo -ne " [Done]\n"

    echo -ne "Start to reconginze verify code"
    tesseract verify.png code -l eng &> /dev/null
    echo -ne " $(cat code.txt) [Done]\n"

    [[ $(cat code.txt | wc -m) != 6 ]] || break
done

echo -ne "Start login..."
curl 'http://jzh.12333sh.gov.cn/jzh/userLoginAction!login.action' --cookie session.cookie --data "loginInfo.login_username=$ID&loginInfo.login_password=$PW&loginInfo.login_type=0&Rand=`cat code.txt`&radioCode=1&Submit=+" --silent --output /dev/null
echo -ne " [Done]\n"

echo -ne "Check the Hukou progress..."
curl 'http://jzh.12333sh.gov.cn/jzh/userLoginAction!LoginPerson.action' --cookie session.cookie --data "Button=%E6%88%91%E6%8E%A5%E5%8F%97&username=$ID" --silent | grep '<td  align="center">&nbsp;' -A 5 | sed -r 's/<td\s+align="center">&nbsp;//g' | sed -r 's/<\/td>//g'

rm verify.png
rm code.txt
rm session.cookie
