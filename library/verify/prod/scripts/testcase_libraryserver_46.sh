#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/v1/users/D12AD340FDA26C1BE040960A38033EA2/tags/like/artists/tags?catalog=101&filterRightsKey=0&start=0&count=10"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "x-rds-login: xlirhapus@yahoo.com" -H "Content-Type: application/xml" -H "x-rds-cobrand: 40134" -H "x-rds-authentication: 111111" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"  -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "x-rds-login: xlirhapus@yahoo.com" -H "Content-Type: application/xml" -H "x-rds-cobrand: 40134" -H "x-rds-authentication: 111111"  -d ';
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

pattern='contentId' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0