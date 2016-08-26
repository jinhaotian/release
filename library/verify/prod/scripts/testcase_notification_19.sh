#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><playbackStop created=\"2011-07-22T12:05:14.267Z\" duration=\"120\">  <userInfo accountType=\"RHAPSODY_25\" clientType=\"sonos\" userId=\"9DD3585DFCAD8042E043C0A87FBE8042\"/>  <playback bitrate=\"256\" format=\"MP3\" started=\"2011-07-22T12:05:14.267Z\" offline=\"false\" trackId=\"Tra.2020418\">    <source id=\"mp.123456\" type=\"PLAYLIST\"/>  </playback></playbackStop>
method=POST
url="$protocol://$server:$port/$war_file_name/event/user/playbackStop"
http_code=202

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "Content-Type: application/xml; charset=UTF-8" -H "Authorization: Basic cmRzOnJkc2FwcA==" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "Content-Type: application/xml; charset=UTF-8" -H "Authorization: Basic cmRzOnJkc2FwcA=="  -d <?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><playbackStop created=\"2011-07-22T12:05:14.267Z\" duration=\"120\">  <userInfo accountType=\"RHAPSODY_25\" clientType=\"sonos\" userId=\"9DD3585DFCAD8042E043C0A87FBE8042\"/>  <playback bitrate=\"256\" format=\"MP3\" started=\"2011-07-22T12:05:14.267Z\" offline=\"false\" trackId=\"Tra.2020418\">    <source id=\"mp.123456\" type=\"PLAYLIST\"/>  </playback></playbackStop>';
         command="$command -d '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><playbackStop created=\"2011-07-22T12:05:14.267Z\" duration=\"120\">  <userInfo accountType=\"RHAPSODY_25\" clientType=\"sonos\" userId=\"9DD3585DFCAD8042E043C0A87FBE8042\"/>  <playback bitrate=\"256\" format=\"MP3\" started=\"2011-07-22T12:05:14.267Z\" offline=\"false\" trackId=\"Tra.2020418\">    <source id=\"mp.123456\" type=\"PLAYLIST\"/>  </playback></playbackStop>'"
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