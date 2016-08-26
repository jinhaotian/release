#!/bin/sh
current_dir=`dirname $0` #!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=
method=GET
url="$protocol://$server:$port/$war_file_name/v1/getNextTrack?sessionId=sas-9DD3585DFCAD8042E043C0A87FBE8042-101-0-Art.42919&count=1&preview=0&debug=1"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Content-Type: application/json" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"  -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Content-Type: application/json"  -d ';
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

pattern='<trackId>Tra.' 

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
url="$protocol://$server:$port/$war_file_name/v1/createSession?userid=9DD3585DFCAD8042E043C0A87FBE8042&seed=Art.42919&variety=10&popularity=10&catalog=101&dmca=0"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Content-Type: application/json" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"  -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Content-Type: application/json"  -d ';
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

pattern='<seed>Art.42919</seed>' 

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
url="$protocol://$server:$port/$war_file_name/v1/getSessionById?sessionId=sas-9DD3585DFCAD8042E043C0A87FBE8042-101-0-Art.42919"
http_code=200

u=$url

echo $u


command='curl -X GET -sw "%{http_code}"   -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Content-Type: application/json" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X GET  -sw "%{http_code}"  -H "x-rds-devkey: 4B8C5B7B5B7B5I4H" -H "Content-Type: application/json"  -d ';
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

pattern='<seed>Art.42919</seed>' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
 
 exit 0