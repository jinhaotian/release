#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

HEADER= -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Content-Type: application/json"
DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/v1/getNextTrack?sessionId=sas-9DD3585DFCAD8042E043C0A87FBE8042-101-0-Art.42919&count=1&preview=0&debug=1"
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

pattern=".*<trackId>Tra..*" 

if [[ !($body =~ $pattern) ]]; then
     exit 1
fi

exit 0
