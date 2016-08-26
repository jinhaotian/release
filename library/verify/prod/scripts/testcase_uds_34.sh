#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns1=\"urn:uds\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><SOAP-ENV:Body><ns1:authenticateSmartUP><param0 xsi:type=\"xsd:string\">Rhapsody</param0><param1 xsi:nil=\"true\"/><param2 xsi:type=\"xsd:string\">xlirhapus@yahoo.com</param2><param3 xsi:type=\"xsd:string\">111111</param3><param4 xsi:nil=\"true\"/></ns1:authenticateSmartUP></SOAP-ENV:Body></SOAP-ENV:Envelope>
method=POST
url="$protocol://$server:$port/$war_file_name/services/RhapsodyUserService"
http_code=200

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "SOAPAction: "urn:uds#authenticateSmartUP"" -H "Content-Type: text/xml; charset=utf-8" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "SOAPAction: "urn:uds#authenticateSmartUP"" -H "Content-Type: text/xml; charset=utf-8"  -d <?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns1=\"urn:uds\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><SOAP-ENV:Body><ns1:authenticateSmartUP><param0 xsi:type=\"xsd:string\">Rhapsody</param0><param1 xsi:nil=\"true\"/><param2 xsi:type=\"xsd:string\">xlirhapus@yahoo.com</param2><param3 xsi:type=\"xsd:string\">111111</param3><param4 xsi:nil=\"true\"/></ns1:authenticateSmartUP></SOAP-ENV:Body></SOAP-ENV:Envelope>';
         command="$command -d '<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns1=\"urn:uds\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><SOAP-ENV:Body><ns1:authenticateSmartUP><param0 xsi:type=\"xsd:string\">Rhapsody</param0><param1 xsi:nil=\"true\"/><param2 xsi:type=\"xsd:string\">xlirhapus@yahoo.com</param2><param3 xsi:type=\"xsd:string\">111111</param3><param4 xsi:nil=\"true\"/></ns1:authenticateSmartUP></SOAP-ENV:Body></SOAP-ENV:Envelope>'"
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

pattern='D12AD340FDA26C1BE040960A38033EA2' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0