#!/bin/bash

#!/bin/bash
#SBATCH -N 2 # allocate 2 nodes for the job
#SBATCH --ntasks-per-node=20
#SBATCH --exclusive # no other jobs on the nodes while job is running
#SBATCH -o fluentP_%J.out # the file to write stdout for fluent job
#SBATCH -e fluentP_%J.err # the file to write stderr for fluent job

JOURNAL=$1

# loading the ansys module which will
# allow us to execute the `fluent` command.
module load ansys/18.1

fluent 3ddp -g -t${SLURM_NTASKS} -mpi=ibmmpi -i "$JOURNAL.jou" -ssh > "$JOURNAL.log"
