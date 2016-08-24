#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

HEADER=
DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/v1/user_tags?user=FAE521479BB9B5A5E040960A39036362&tag=favorite&query_content_type=track&catalog=101&filter_rights_key=0&offset=0&limit=100&sort_by=tag_time&sort_order=desc"
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
