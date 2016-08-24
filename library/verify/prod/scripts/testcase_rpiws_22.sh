#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

HEADER= -H "Authorization: Basic cnBpbWV0cm9wY3M6bWV0cm90em0=" -H "Content-Type: application/xml;charset=ISO-8859-1"
DATA=
method=POST
url="$protocol://$server:$port/$war_file_name/v1/user/partner/WOSEJFNRYX4125253801370/userGuid/A8F3FD41CBC400B6E0430A96033200B6"
http_code=200



command="curl -X $method -sw '%{http_code}' '$url' $HEADER"

if [ 'POST' = "$method" ]; then
	 command="curl -X $method -sw '%{http_code}' '$url' $HEADER -d $DATA";
fi
	

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
exit 0
