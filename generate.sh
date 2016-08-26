export name='rpiws'
export  war='rpiws' 
export vp='version' 
export config='rpiws-app-cfg' 
export app='rpiws-app' 
export tests="rpiws"

#echo $name,$war,$vp,$config,$app,$tests

envsubst  '$name,$war,$vp,$config,$app,$tests' <release-template.yml
