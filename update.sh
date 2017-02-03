#!/bin/bash

NUMBER_OF_FILES=`ls -1 ideaIU-*.tar.gz 2> /dev/null | wc -l`

if [ "$NUMBER_OF_FILES" == "0" ]
then
	echo "There are no IntelliJ-idea source packages in this directory."
	echo "Please go to https://www.jetbrains.com/rider/download to download the .tar.gz file and try again."
	exit
fi


if [ "$NUMBER_OF_FILES" != "1" ]
then
	echo "There are multiple rider source packages in this directory."
	echo "Please remove old .tar.gz files and try again."
	exit
fi

VERSION=`ls ideaIU-*.tar.gz | sed -r 's/ideaIU-([0-9\.]+).tar.gz/\1/'`

cp debian/changelog.dist debian/changelog

dch -v $VERSION -m "New upstream version" -D stable
