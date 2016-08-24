#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

HEADER= -H "SOAPAction: "urn:uds#getUser"" -H "Content-Type: text/xml; charset=utf-8"
DATA=<?xml version="1.0" encoding="UTF-8"?><SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="urn:uds" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><SOAP-ENV:Body><ns1:getUser><param0 xsi:type="xsd:string">Rhapsody</param0><param1 xsi:type="xsd:string">D12AD340FDA26C1BE040960A38033EA2</param1></ns1:getUser></SOAP-ENV:Body></SOAP-ENV:Envelope>
method=POST
url="$protocol://$server:$port/$war_file_name/services/UserService"
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
