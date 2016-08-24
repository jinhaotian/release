#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

HEADER= -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Authorization: Basic cmRzOnJkc2FwcA=="
DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/v2/useraccounts/E8CF0E781C02A7B7E040960A38035EB7"
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

pattern=".*E8CF0E781C02A7B7E040960A38035EB7.*" 

if [[ !($body =~ $pattern) ]]; then
     exit 1
fi

exit 0
