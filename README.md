# Linux_Scripts

## Personnal repository for various Linux scripts.

### archive.sh

Description:

Script doing a backup of a user folder (name provided as an argument) as root then copying it to a remote server via scp.

Features:

Tests if it's running as root.
Backup file is named using the argument and the date in ISO 8601 format.
Tests if the backup is well created.
Does a copy to a remote copy server using scp command and rsa keys.

### backup.sh

Description:

Script doing a backup of all the files in the script directory.

Features:

Only checks for file in the script directory and not subfolders too.
Files alredy saved are ignored.
Writes in the terminal the number of file who got a backup made.
Uses IF conditions with OR conditions.

### count.sh

Description:

Script displaying integers up to the argument passed with the script execution.

Features:

Classic FOR loop stopping once i reaches the value of the argument.

### count_param.sh

Description:

Script writing in the terminal the number of arguments inputted with the script.

Features:

Gets the value of $# which is the number of arguments inputted with a script

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

Makes a directory.
Creates files.

### last_arg.sh

Description:

Script writing in the terminal the value of the last argument inputted with the script.

Features:

Uses variable substitution.

### max.sh

Description:

Script takes 2 integers as arguments and writes the biggest in the terminal.

Features:

Checks the number of arguments.
Checks if arguments are integers.
Classic IF condition using a comparator.

### params.sh

Description:

Scripting writing in the terminal its name, its path and all the arguments it was inputted with one by one with their number.

Features:

Gets the path of the directory it was executed in.
Classic FOR loop, looping the number of times there are arguments.
Uses variable substitution.

### sort.sh

Description:

Script writing the parameters it was inputed with in alphabetical on separate lines.

Features:

Tests if all arguments don't contain anything other than letters.
Uses the "sort" function that sorts alphabetically.

### status.sh

Description:

Script writing in the terminal the existence and if it exists the status of the service inputted with the script.

Features:

Uses "pgrep" to get the status of a service.
Uses returned results of commands execution to display a custom message.

### toupper.sh

Description:

Script writing in the terminal all the arguments it was inputted with in upper case.
It doesn't write anything if there are no arguments.

Features:

Classic FOR loop, looping the number of times there are arguments.
Uses variable substitution.
Uses "printf" to pass the value of a variable to another command using a pipe "|"
Uses the command "toupper" to put a string in full caps.

### type.sh

Description:

Script writing in the terminal whether the string inpputed as an argument contains vowels, consonants or numbers.

Features:

Different uses of regex in IF conditions.
Uses IF conditions with AND conditions.
Uses ELIF conditions.

### users.sh

Description:

Script writing in the terminal the alphabetically sorted list of users having running processes on the machine.

Features:

Uses ps aux. (displays the running processes with associated users)
Uses awk. (used to parse values)
Uses sed. (used to parse values)
Uses sort. (used to sort alphabetically values)
Uses uniq. (gets rid of multiple time the same value and only diplays it once)
