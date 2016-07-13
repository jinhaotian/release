#!/bin/bash

STATUS_CODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" "http://$1:8080/playlist/v1/playlists/?source=all_playlists&offset=0&limit=1")

if(test $STATUS_CODE -ne 200); then
	exit 1
fi

STATUS_CODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" "http://$1:8080/playlist/admin/ping")

if(test $STATUS_CODE -ne 200); then
        exit 1
fi

STATUS_CODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" "http://$1:8080/playlist/admin/metrics?pretty=true")

if(test $STATUS_CODE -ne 200); then
        exit 1
fi

exit 0
