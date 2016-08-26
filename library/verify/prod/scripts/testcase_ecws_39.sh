#!/bin/bash

protocol=$1
server=$2
port=$3
war_file_name=$4

DATA=<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:_0=\"http://ecs.real.com/subscriptionservice/2_0\">   <soapenv:Header/>   <soapenv:Body>     <_0:IsConsumerServiceSuspendedRequest>         <Consumer>            <Master>rn.uds</Master>            <Handle>D12AD340FDA26C1BE040960A38033EA2</Handle>         </Consumer>         <Partner>40134</Partner> <ConsumerServiceId>57504655</ConsumerServiceId>      </_0:IsConsumerServiceSuspendedRequest>   </soapenv:Body></soapenv:Envelope>
method=POST
url="$protocol://$server:$port/$war_file_name/docservices/2_0/"
http_code=200

u=$url

echo $u


command='curl -X POST -sw "%{http_code}"   -H "Content-Type: text/xml;charset=UTF-8" -H "SOAPAction: "/SubscriptionService/IsConsumerServiceSuspended"" -H "Authorization: Basic ZWN3czpaYTM5Z3M=" ' 
command="$command \"$u\""
if [ 'POST' = "$method" ]; then
#	 command='curl -X POST  -sw "%{http_code}"  -H "Content-Type: text/xml;charset=UTF-8" -H "SOAPAction: "/SubscriptionService/IsConsumerServiceSuspended"" -H "Authorization: Basic ZWN3czpaYTM5Z3M="  -d <soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:_0=\"http://ecs.real.com/subscriptionservice/2_0\">   <soapenv:Header/>   <soapenv:Body>     <_0:IsConsumerServiceSuspendedRequest>         <Consumer>            <Master>rn.uds</Master>            <Handle>D12AD340FDA26C1BE040960A38033EA2</Handle>         </Consumer>         <Partner>40134</Partner> <ConsumerServiceId>57504655</ConsumerServiceId>      </_0:IsConsumerServiceSuspendedRequest>   </soapenv:Body></soapenv:Envelope>';
         command="$command -d '<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:_0=\"http://ecs.real.com/subscriptionservice/2_0\">   <soapenv:Header/>   <soapenv:Body>     <_0:IsConsumerServiceSuspendedRequest>         <Consumer>            <Master>rn.uds</Master>            <Handle>D12AD340FDA26C1BE040960A38033EA2</Handle>         </Consumer>         <Partner>40134</Partner> <ConsumerServiceId>57504655</ConsumerServiceId>      </_0:IsConsumerServiceSuspendedRequest>   </soapenv:Body></soapenv:Envelope>'"
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

pattern='<Suspended>false</Suspended>' 

if [[ !($body == *"$pattern"*) ]];then
     echo "Body Not  Matched"
     exit 1
fi

 
exit 0