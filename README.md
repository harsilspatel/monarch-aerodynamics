# mhp-aerodynamics-scripts

- [intro](#intro)
- [usage](#usage)
  * [slurm commands](#slurm-commands)
  * [single job execution](#single-job-execution)
  * [batch job execution](#batch-job-execution)
- [tips](#tips)
- [references](#references)
- [todos](#todos)

## intro
Hi there,

If you're reading this, it is likely that you are one of the members of the aerodynamics team working on the CFD simulations for the bike. And if you are, I have some good news for you! ^_^

I have been working closely with your team lead -- Vincent He -- to assist the team perform a smooth transition from Monash Workstations to MonARCH clusters, to perform the simulations. Consequently, I have created this repository to equip you with the essential information that you will need in order to operate the clusters. However, this documentation does not contain an exhaustive list of commands that you will ever need to execute. Therefore, to assist you with the basic linux commands and MonARCH systems I will be running introductory workshop(s). Additionally, after consulting Vince, I will establish and articulate a workflow and a framework for organising the project in the upcoming team meetings. In regards to getting the permissions for operating on the project we will soon be reaching out to the MonARCH team to help you get access to the clusers ;)

Furthermore, my responsibilities will include, but will not be limited to, keeping this repository up-to-date as per the team requirements and assisting the team automate the process of backing up the resulting data files to the team drives for the analysis :D

Should you need any assistance or if there is anything in the documentation that is not articulated well, please do not hesitate to contact me or Vincent on Slack :)

## usage
### slurm commands
| command                   | description                                         |
|---------------------------|-----------------------------------------------------|
| `sbatch job.sh`             | to submit a job for batch execution                 |
| `squeue -u {userid} `       | to display the status of your jobs on the queue     |
| `scontrol show job {jobid}` | to check the status (and other details) of a job    |
| `sacct -j {jobid}`          | to check the accounting information of a given job  |
| `scancel {jobid}`           | to cancel a job that you own given its unique jobId |
| `scancel -u {userid}`       | to cancel all your jobs on the cluster              |


### single job execution
   ```sh
   sbatch --time=<timelimit> --output=<stdoutFile> --error=<stdoutFile> ./run_job.sh <bodyname> 
   ```
`bodyname` is the relative filepath of the journal file without the .jou extension (assists in generation of stdout and stderr files)

`timelimit` will be passed as a slurm argument which accepts the following time formats,
- `minutes`
- `minutes:seconds`
- `hours:minutes:seconds`
- `days-hours`
- `days-hours:minutes`
- `days-hours:minutes:seconds`

The `run_job.sh` script will output the stdout and stderr files in the same directory as the corresponding journal file.
   

### batch job execution
   ```sh
   ./run_all.sh <journalDir> <timelimit>
   ```

The `run_all.sh` script expects two arguments -- timelimit and a directory containing journal files. It recursively finds all the journal files and list calls the `run_job.sh` script with the specified `timelimit`.


## tips
1. Use the `short` run on monARCH if the simulation will be running for less than 24 hours.
2. Specify the tighest timelimit possible for quicker scheduling of the job.


## references
1. Monash's [MonARCH documentation](https://docs.monarch.erc.monash.edu.au/MonARCH/slurm/slurm-overview.html)
2. University of Connecticut's Fluent [Guide](https://wiki.hpc.uconn.edu/index.php/Fluent_Guide) helpful.


## todos
- [ ] Automated backups to team drives
- [ ] Create MHP branded email for the aero team and send notifications on job completions
- [ ] A script to parameterize some of the variables which include, but are not limited to, the mesh file, number of iterations, force overwriting of the existing files.
