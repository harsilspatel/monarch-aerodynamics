#!/bin/bash

print_usage() {
	echo "Usage: $(basename $0) <journalDirectory> <timelimit>"
}

if [ "$#" -ne 1 ]; then
	print_usage;s
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
	
	sbatch --time=$TIME --job-name=$jobname ./run_job.sh $jobname 
	
done