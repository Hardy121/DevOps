#!/bin/bash

set -eou pipefail

for file in /var/log/*.log;
do
	[[ -f "$file" ]] || continue

	if [[ $( stat -c %s "$file" ) -gt 500000 ]];
	then
		echo "Archiving $file"
		sudo gzip "$file"
	fi
done
