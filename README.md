# Linux_Scripts

## Personnal repository for various Linux scripts.

### archive.sh

Description:

Script doing a backup of a user folder (name provided as an argument) as root then copying it to a remote server via scp.

Features:

Testing if it's running as root.
Backup file is named using the argument and the date in ISO 8601 format.
Testing if the backup is well created.
Doing a copy to a remote copy server using scp command and rsa keys.

### backup.sh

Description:

Script doing a backup of all the files in the script directory.

Features:

Only checks for file in the script directory and not subfolders too.
Files alredy saved are ignored.
Writes in the terminal the number of file who got a backup made.

### count.sh

Description:

Script displaying integers up to the argument passed with the script execution.

Features:

Classic FOR loop stopping once i reaches the value of the argument.

### count_param.sh

Description:

Script writing in the terminal the number of arguments inputted with the script.

Features:

Getting the value of $# which is the number of arguments inputted with a script

### display_date.sh

Description:

Script writing in the terminal the date using the format "hh:mm:ss dd/mm/yy"

Features:

Gets the date and the hour using the format "hh:mm:ss dd/mm/yy"

### guess.sh

Description:

Script needing you to guess a number between 1 and 1000 with 10 tries.

Features:

Asks for inputs.
Generates a number between 1 and 1000.
Classic FOR loop, looping 10 times.
Classic IF conditions using comparators.

### init.sh

Description:

Script making a directory in the script execution directory named after the argument inputted with the script then creating 2 files (README.md & change.log) in the created directory.

Features.

Making a directory.
Creating files.

### last_arg.sh

Description:

Script writing in the terminal the value of the last argument inputted with the script.

Features:

Using variable substitution.

### max.sh

Description:

Script takes 2 integers as arguments and writes the biggest in the terminal.

Features:

Checks the number of arguments.
Checks if arguments are integers.
Classic IF condition using a comparator.
