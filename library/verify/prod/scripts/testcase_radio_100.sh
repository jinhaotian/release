#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

HEADER= -H "x-rhapsody-access-token-v2:" -H "x-rds-playback-proto: https" -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Authorization: Basic c2VjdXJlX21vYmlsZV9hbmRyb2lkOk5qZzJPVEl3Tm1RMlpqWmxObUl5TURZMk5tTTNPVEl3TnpNMk9EWm1OalU9" -H "Content-Type: application/json" -H "x-rds-playback-encodings: AAC_64;AAC_192;MP3_128"
DATA=
method=POST
url="$protocol://$server:$port/$war_file_name/v1/stations/sas.1967/tracks?userid=E8CF0E781C02A7B7E040960A38035EB7&count=1&previews=0"
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