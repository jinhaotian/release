#!/bin/sh
current_dir=`dirname $0`  && $current_dir/testcase_rds-authserver_16.sh $1 $2 $3 $4  && $current_dir/testcase_rds-authserver_43.sh $1 $2 $3 $4  && $current_dir/testcase_rds-authserver_44.sh $1 $2 $3 $4 