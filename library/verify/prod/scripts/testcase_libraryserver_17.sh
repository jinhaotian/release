#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><trackEventList>.<trackEvent played=\"2013-04-03T15:58:56.983-07:00\" trackId=\"Tra.1688720\">..<playContext contextId=\"Tra.1688720\" contextType=\"track\" mostRecentlyPlayed=\"2013-04-03T15:58:56.983-07:00\" />.</trackEvent>.<trackEvent played=\"2013-04-03T15:57:56.983-07:00\" trackId=\"Tra.51168197\">..<playContext contextId=\"Tra.51168197\" contextType=\"track\" mostRecentlyPlayed=\"2013-04-03T15:57:56.983-07:00\" />.</trackEvent></trackEventList>
method=POST
url="$protocol://$server:$port/$war_file_name/users/97B687CCE1A81054E043C0A87FBE1054/library/trackevents"
http_code=201

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "x-rds-login: qa_4shbme@rhapsody.lan" -H "Content-Type: application/xml" -H "x-rds-cobrand: 40134" -H "x-rds-authentication: rhap123" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "x-rds-login: qa_4shbme@rhapsody.lan" -H "Content-Type: application/xml" -H "x-rds-cobrand: 40134" -H "x-rds-authentication: rhap123"  -d <?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><trackEventList>.<trackEvent played=\"2013-04-03T15:58:56.983-07:00\" trackId=\"Tra.1688720\">..<playContext contextId=\"Tra.1688720\" contextType=\"track\" mostRecentlyPlayed=\"2013-04-03T15:58:56.983-07:00\" />.</trackEvent>.<trackEvent played=\"2013-04-03T15:57:56.983-07:00\" trackId=\"Tra.51168197\">..<playContext contextId=\"Tra.51168197\" contextType=\"track\" mostRecentlyPlayed=\"2013-04-03T15:57:56.983-07:00\" />.</trackEvent></trackEventList>';
         command="$command -d '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><trackEventList>.<trackEvent played=\"2013-04-03T15:58:56.983-07:00\" trackId=\"Tra.1688720\">..<playContext contextId=\"Tra.1688720\" contextType=\"track\" mostRecentlyPlayed=\"2013-04-03T15:58:56.983-07:00\" />.</trackEvent>.<trackEvent played=\"2013-04-03T15:57:56.983-07:00\" trackId=\"Tra.51168197\">..<playContext contextId=\"Tra.51168197\" contextType=\"track\" mostRecentlyPlayed=\"2013-04-03T15:57:56.983-07:00\" />.</trackEvent></trackEventList>'"
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

if(test $http_code -ne 201); then
        exit 1
fi

pattern='' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0