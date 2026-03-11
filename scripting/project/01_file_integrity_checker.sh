#!/bin/bash

timestamp(){
	date "+[%d-%m-%y %H:%M:%S]"
}

# 1. Check argument
echo "$0"

if [[ -z "$1"  ]]; then
	echo "Usage : $0 <directory>"
	exit 1
fi


DIR="$1"

# 2. validate directory
if [[ ! -d "$DIR" ]]; then
	echo "Error: directory does not exist."
	exit 2
fi

# 3. Calculate size.
SIZE_BYTES=$(du -sb "$DIR" | cut -f1);
MAX_MB=${2:-100}
MAX_BYTES=$(( $MAX_MB * 1024 * 1024 ))

echo "$(timestamp) Total size of $DIR"
du -sh "$DIR"

if [[ $SIZE_BYTES -gt $MAX_BYTES ]]; then 
	echo "WARNING: Directory size exceed $MAX_BYTES" 
fi

# 4, Show largest 5 files
echo "$(timestamp) Largest 5 file:"
du -ah "$DIR" 2>/dev/null | sort -rh | head -n 5


exit 0
