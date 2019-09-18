#!/bin/bash

#SBATCH --nodes=1 				# allocate 1 node for the job
#SBATCH --ntasks-per-node=4
#SBATCH --exclusive 			# no other jobs on the nodes while job is running
#SBATCH --error="%x.err" 		# the file to write stderr for fluent job
#SBATCH --output="%x.out" 		# the file to write stdout for fluent job
#SBATCH --partition=short
#SBATCH --ntasks=4

JOURNAL=$1

# loading the ansys module which will
# allow us to execute the `fluent` command.
module load ansys/18.1

fluent 3ddp -g -t${SLURM_NTASKS} -mpi=ibmmpi -i "$JOURNAL.jou" -ssh > "$JOURNAL.log"