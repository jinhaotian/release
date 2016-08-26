#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA={\"msisdn\":\"2067078188\"}
method=POST
url="$protocol://$server:$port/$war_file_name/v1/subscriptions/current-product/billing-partners/tmobile"
http_code=404

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "Authorization: Basic bWFzOm0mdyM2NyUkcw==" -H "Content-Type: application/json" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "Authorization: Basic bWFzOm0mdyM2NyUkcw==" -H "Content-Type: application/json"  -d {\"msisdn\":\"2067078188\"}';
         command="$command -d '{\"msisdn\":\"2067078188\"}'"
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

if(test $http_code -ne 404); then
        exit 1
fi

pattern='{"reasonKey":"10001","reasonMessage":"ERROR_CUSTOMER_DOESNT_EXIST"}' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0