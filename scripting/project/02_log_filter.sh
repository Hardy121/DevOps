#!/bin/bash
set -eou pipefail
timestamp(){
	date "+[%d-%m%-y %H:%M:%S]"
}

echo "$(timestamp) $0 script is running..."
FILE="${1:-}"
KEYWORD="${2:-}"

#check if any argument missing or not
if [[ -z "$FILE" || -z "$KEYWORD" ]] then
	echo "Please provide argument"
	exit 1
fi

# check if the file exist 
if [[ ! -f $FILE ]]; then 
	echo "$FILE does not exist"
	exit 1
fi

# print matching word count in file
echo "======== Matching word count ======="
MATCHES=$(grep -in "$KEYWORD" "$FILE")

echo "$MATCHES" | wc -l

echo "======== Marching words in file ======="
echo "$MATCHES" | head -n 5

exit 0
