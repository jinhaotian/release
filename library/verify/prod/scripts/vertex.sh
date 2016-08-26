#!/bin/sh
current_dir=`dirname $0` #!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:dom=\"http://dom.w3c.org\">   <soapenv:Header/>   <soapenv:Body>      <dom:inDoc>hello</dom:inDoc>   </soapenv:Body></soapenv:Envelope>
method=POST
url="$protocol://$server:$port/$war_file_name/services/EchoDoc"
http_code=200

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "SOAPAction: """ -H "Content-Type: text/xml;charset=UTF-8" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "SOAPAction: """ -H "Content-Type: text/xml;charset=UTF-8"  -d <soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:dom=\"http://dom.w3c.org\">   <soapenv:Header/>   <soapenv:Body>      <dom:inDoc>hello</dom:inDoc>   </soapenv:Body></soapenv:Envelope>';
         command="$command -d '<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:dom=\"http://dom.w3c.org\">   <soapenv:Header/>   <soapenv:Body>      <dom:inDoc>hello</dom:inDoc>   </soapenv:Body></soapenv:Envelope>'"
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

pattern='hello' 

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
url="$protocol://$server:$port/$war_file_name/services/CalculateTax60?wsdl"
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

pattern='http://www.vertexinc.com/oseries/services/CalculateTax60' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
 
 exit 0