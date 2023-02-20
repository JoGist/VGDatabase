#!/bin/sh

SRC_ROOT_DIR=`dirname $0`/..
OUTPUT=$(find $SRC_ROOT_DIR | grep -v './.git' | tr '[:upper:]' '[:lower:]' | sort | uniq -d)

if test -n "$OUTPUT" ; then
	echo "There will be a case collision for a number of files on case insensitive filesystems"
	exit 1
fi
exit 0
