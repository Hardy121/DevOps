
#!/bin/bash
set -eou pipefail
IFS=$'\n\t'

log(){
      date "+[%d-%m-%y %H:%M:%S]"
}


FILE_PATH=${1:-}
BACKUP_PATH=${2:-}
if [[ -z $FILE_PATH || -z $BACKUP_PATH  ]];
then
	echo "$(log) file path and backup path arguments are required!"	
	exit 1
fi

if [[ ! -d "$FILE_PATH" ]];
then
	echo "source directory doesnot exist"
	exit 1
fi

if [[ ! -d "$BACKUP_PATH" ]];
then
	echo "$(log) backup directory not exist"
	exit 1
fi


TIME=$(date "+%Y-%m-%d_%H-%M-%S")
FILE_NAME="backup_$TIME.tar.gz"
echo "----creating backup $FILE_NAME"

tar -cvzf "$FILE_NAME" "$FILE_PATH"

echo "----- moving backup to $BACKUP_PATH"

sudo mv "$FILE_NAME" "$BACKUP_PATH"


echo "------- Removing old backups"

ls -t "$BACKUP_PATH" | tail -n +8 | while read -r file
do
	        echo "$file deletingg..."
		sudo rm "$BACKUP_PATH/$file" 
done
