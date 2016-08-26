#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/users/9DD3585DFCAD8042E043C0A87FBE8042/library/trackevents?catalog=101&filterRightsKey=0&startDate=2000-01-01"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   -H "Content-Type: application/xml" -H "x-rds-devkey: 1H7A4A7J3A8D6D8I" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"  -H "Content-Type: application/xml" -H "x-rds-devkey: 1H7A4A7J3A8D6D8I"  -d ';
         command="$command -d ''"
#         command="$command \"$u\""
fi
	

echo $command
echo eval $command
res=$(eval $command)

http_code="${res:${#res}-3}"

if [ ${#res} -eq 3 ]; then
  body=""
else
  body="${res:0:${#res}-3}"
fi

echo "Response Code:" $http_code
echo "Response Body:" $body

if(test $http_code -ne 200); then
        exit 1
fi

pattern='playContext contextId="mp.123456"' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0