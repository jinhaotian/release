#!/bin/sh
current_dir=`dirname $0` #!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA={  \"clientType\":\"rhap-web\"}
method=POST
url="$protocol://$server:$port/$war_file_name/v1/users/E8CF0E781C02A7B7E040960A38035EB7/sessions"
http_code=201

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "x-rhapsody-access-token-v2:" -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Authorization: Basic c2VjdXJlX21vYmlsZV9hbmRyb2lkOk5qZzJPVEl3Tm1RMlpqWmxObUl5TURZMk5tTTNPVEl3TnpNMk9EWm1OalU9" -H "Content-Type: application/json" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "x-rhapsody-access-token-v2:" -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Authorization: Basic c2VjdXJlX21vYmlsZV9hbmRyb2lkOk5qZzJPVEl3Tm1RMlpqWmxObUl5TURZMk5tTTNPVEl3TnpNMk9EWm1OalU9" -H "Content-Type: application/json"  -d {  \"clientType\":\"rhap-web\"}';
         command="$command -d '{  \"clientType\":\"rhap-web\"}'"
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

 
#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/system/version"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"   -d ';
         command="$command -d ''"
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

if(test $http_code -ne 200); then
        exit 1
fi

pattern='playbackserver-service' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=
method=GET
url="http://platformqa-prod-1201.sea2.rhapsody.com/adhoc/playbackserver-session-test.php?server=$server"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"   -d ';
         command="$command -d ''"
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

if(test $http_code -ne 200); then
        exit 1
fi

pattern='{"name":"create_session","status":true},{"name":"validate_session","status":true}' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
 
 exit 0