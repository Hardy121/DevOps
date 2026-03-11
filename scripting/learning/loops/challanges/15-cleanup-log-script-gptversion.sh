#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

MAX_SIZE=500000

if [[ $EUID -ne 0 ]]; then
  echo "Please run as root"
    exit 1
fi

for file in /var/log/*.log; do
      [[ -f "$file" ]] || continue

        size=$(stat -c %s "$file")

          if (( size > MAX_SIZE )); then
              echo "Archiving $file"
              gzip "$file"
 	  fi
done
