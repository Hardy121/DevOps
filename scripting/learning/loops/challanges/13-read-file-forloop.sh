#!/bin/bash
set -eou pipefail

for line in $(cat data.txt)
do
	echo "$line"
done

while IFS= read -r line; do
	  echo "$line"
done < data.txt
