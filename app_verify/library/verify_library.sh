#!/bin/bash

STATUS_CODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" "http://$1:8080/rhapsodydirectlibrary/data/getTracksInLibrary.xml?developerKey=4B8C5B7B5B7B5I4H&cobrandId=40134&logon=qa_4x26fz@rhapsody.lan&password=rhap123&end=3&start=0")

if(test $STATUS_CODE -ne 200); then
	exit 1
fi

STATUS_CODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" "http://$1:8080/rhapsodydirectlibrary/data/getGenresInLibrary.xml?developerKey=4B8C5B7B5B7B5I4H&cobrandId=40134&logon=qa_4x26fz@rhapsody.lan&password=rhap123&end=3&start=0")

if(test $STATUS_CODE -ne 200); then
        exit 1
fi

STATUS_CODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" "http://$1:8080/rhapsodydirectlibrary/data/getAlbumsInLibrary.xml?developerKey=4B8C5B7B5B7B5I4H&cobrandId=40134&logon=qa_4x26fz@rhapsody.lan&password=rhap123&end=3&start=0")

if(test $STATUS_CODE -ne 200); then
        exit 1
fi
