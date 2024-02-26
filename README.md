In this mini project the usage of a backup script is demonstrated. Let's imagine a scenario where company interns must access encrypted password files on core servers and back up any files that were updated within the last 24 hours. This process introduces human error, lowers security and takes an unreasonable amount of work. This sh script runs every day and creates automatic backups of the encrypted password files that have been updated in the last day. 

In order to make the sh script excecutable we must add the "#!/bin/bash" at the top. Also, in order to automate this procedure we will use crontab. The following syntax should be added to the crontab command list so as to backup every 24 hours:
0 0 * * * usr/local/bin/backup.sh /home/project/important-documents /home/project

![alt text](https://github.com/georgeniko/scheduled_backup_script/blob/main/output.png?raw=true)

This script was developed as part of a graded project for the IBM Data Engineering Professional Certificate on Coursera.
