#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><playbackStart created=\"2011-07-22T09:58:44.103Z\">  <userInfo accountType=\"RHAPSODY_25\" clientType=\"sonos\" userId=\"9DD3585DFCAD8042E043C0A87FBE8042\"/>  <playback bitrate=\"256\" format=\"MP3\" started=\"2011-07-22T09:58:44.103Z\" trackId=\"Tra.3221383\" /></playbackStart>
method=POST
url="$protocol://$server:$port/$war_file_name/event/user/playbackStart"
http_code=202

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "Content-Type: application/xml; charset=UTF-8" -H "Authorization: Basic cmRzOnJkc2FwcA==" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "Content-Type: application/xml; charset=UTF-8" -H "Authorization: Basic cmRzOnJkc2FwcA=="  -d <?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><playbackStart created=\"2011-07-22T09:58:44.103Z\">  <userInfo accountType=\"RHAPSODY_25\" clientType=\"sonos\" userId=\"9DD3585DFCAD8042E043C0A87FBE8042\"/>  <playback bitrate=\"256\" format=\"MP3\" started=\"2011-07-22T09:58:44.103Z\" trackId=\"Tra.3221383\" /></playbackStart>';
         command="$command -d '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><playbackStart created=\"2011-07-22T09:58:44.103Z\">  <userInfo accountType=\"RHAPSODY_25\" clientType=\"sonos\" userId=\"9DD3585DFCAD8042E043C0A87FBE8042\"/>  <playback bitrate=\"256\" format=\"MP3\" started=\"2011-07-22T09:58:44.103Z\" trackId=\"Tra.3221383\" /></playbackStart>'"
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

if(test $http_code -ne 202); then
        exit 1
fi

pattern='' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0