#!/bin/bash

#SBATCH --nodes=1 				# allocate 1 node for the job
#SBATCH --ntasks-per-node=4
#SBATCH --exclusive 			# no other jobs on the nodes while job is running
#SBATCH --partition=short
#SBATCH --ntasks=4


JOURNAL=$1
BODY_NAME="${JOURNAL%\.*}"
DIR_NAME="$(basename $BODY_NAME)"
REMOTE_RESULT_DIR=$2

# loading the ansys module which will
# allow us to execute the `fluent` command.
module load ansys/18.1

fluent 3ddp -g -t${SLURM_NTASKS} -mpi=ibmmpi -i $JOURNAL -ssh > "$BODY_NAME.log"

rclone copy "$BODY_NAME*" "hpat0003:$REMOTE_RESULT_DIR/$DIR_NAME"