#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

HEADER= -H "Authorization: Basic bWFzOm0mdyM2NyUkcw==" -H "Content-Type: application/json"
DATA={"msisdn":"2067078188"}
method=POST
url="$protocol://$server:$port/$war_file_name/v1/subscriptions/current-product/billing-partners/tmobile"
http_code=404



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

if(test $http_code -ne 404); then
        exit 1
fi
exit 0
