# mhp-aerodynamics-scripts
I am working closely with the currently Aero team lead -- Viencent He -- to assist the team perform a smooth transition, to perform CFD simulations, from Monash Workstations to MonARCH clusters. Furthermore, I will assist the team automate the process of backing up of the resulting data files to the team drives for the analysis.

We will be reaching out to the monARCH team to help you get access to the clusers. Please note that, in the event of misuse of the provided computation credits, Vince reserves the rights to terminate your access to the clusters.

This guide, by no means, is an exhaustive list of commands you will need to remember. I will be running induction workshop(s) to help the team get up and running with basic linux commands and monARCH systems. Additionally, after consulting Vince, I will establish and articulate the a framework for organising the project in the workshop(s).

Should you need any further help, please do not hesitate to contact me or Vince on Slack.

## usage
   ```sh
   ./run_all.sh <journalDir> <timelimit>
   ```
timelimit will be passed as a slurm argument which accepts the following time formats 
- `minutes`
- `minutes:seconds`
- `hours:minutes:seconds`
- `days-hours`
- `days-hours:minutes`
- `days-hours:minutes:seconds`

The `run_all.sh` script expects two arguments -- timelimit and a directory containing journal files -- and simply list calls the `run_job.sh` script. The run `run_job.sh` script will output the stdout and stderr files in the directory of the corresponding journal file.

## tips
1. Use the `short` run on monARCH if the simulation will be running for less than 24 hours.
2. Try to avoid spaces in the filenames.

## references
1. University of Connecticut's [Fluent Guide](https://wiki.hpc.uconn.edu/index.php/Fluent_Guide)
2. Monash's [MonARCH documentation](https://docs.monarch.erc.monash.edu.au/MonARCH/slurm/slurm-overview.html)

## todos
[ ] Backup to team drives
[ ] A script to parameterize some of the variables whcih include, but are not limited to, the running file, number of iterations, force overwriting of the existing files.
