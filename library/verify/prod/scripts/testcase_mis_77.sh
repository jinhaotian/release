#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/messageServices/email/messageTemplates/217325"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   -H "Authorization: Basic bWlzOm1pcw==" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"  -H "Authorization: Basic bWlzOm1pcw=="  -d ';
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

pattern='CONTRACT_ID' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0