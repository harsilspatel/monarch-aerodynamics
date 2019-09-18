#!/bin/bash

print_usage() {
	echo "Usage: $(basename $0) <journalDirectory> <timelimit>"
}

if [ "$#" -ne 2 ]; then
	print_usage;
	exit 1;
fi

DIR=$1
TIMELIMIT=$2
JOURNALS="$(find $DIR -name "*.jou" | sort)"


for journal in $JOURNALS
do
	echo $journal
	bodyname="${journal%\.*}"
	jobname="$(basename $bodyname)"
	
	sbatch --time=$TIMELIMIT --job-name=$jobname --output="$bodyname.out.txt" --error="$bodyname.err.txt" ./run_job.sh $bodyname 
	
done