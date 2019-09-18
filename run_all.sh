#!/bin/bash

print_usage() {
	echo "Usage: $(basename $0) <journalDirectory>"
}

if [ "$#" -ne 1 ]; then
	print_usage;s
	exit 1;
fi

DIR=$1
JOURNALS="$(find $DIR -name "*.jou" | sort)"


for journal in $JOURNALS
do
	echo $journal
done