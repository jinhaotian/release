#!/bin/sh
current_dir=`dirname $0`  && $current_dir/testcase_rds-accountmgmt_15.sh $1 $2 $3 $4  && $current_dir/testcase_rds-accountmgmt_41.sh $1 $2 $3 $4  && $current_dir/testcase_rds-accountmgmt_42.sh $1 $2 $3 $4 