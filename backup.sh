#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# set variables for the direcotries
targetDirectory=$1
destinationDirectory=$2

# display values
echo "targetDirectory= $1"
echo "destinationDirectory= $2"

# current timestamp
currentTS=$(date +%s)

# set filename 
backupFileName="backup-[$currentTS].tar.gz"
# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# original path
origAbsPath=$(pwd)

# move to dest directory and save the path
cd $destinationDirectory
destDirAbsPath=$(pwd)

# change directory
cd $origAbsPath
cd $targetDirectory

# timestamp of yesterday
yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

for file in $(ls) # this loop will list all files and directories
do
  # if there are new files
  if ((`date -r $file +%s` > $yesterdayTS))
  then
  # add file
    toBackup+=($file)
  fi
done

# create the actual backup
tar -czvf $backupFileName ${toBackup[@]}

# move the backup file to the desired direcotry
mv $backupFileName $destDirAbsPath

