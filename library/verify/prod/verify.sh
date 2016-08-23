#!/bin/bash

res=$(curl -sw "%{http_code}" "http://rds-library-prod-1201.sea2.rhapsody.com:8080/rhapsodydirectlibrary/data/getTracksInLibrary.xml?developerKey=4B8C5B7B5B7B5I4H&cobrandId=40134&logon=qa_4x26fz@rhapsody.lan&password=rhap123&end=3&start=0")

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

