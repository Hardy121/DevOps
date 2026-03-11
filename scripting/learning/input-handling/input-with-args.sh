#!/bin/bash

while [[ $# -gt 0 ]]; do
	  case "$1" in
	    --env)
	        ENV="$2"
	        shift 2
	        ;;
	    --force)
	        FORCE=true
	        shift
	        ;;
	    *)
	        echo "Unknown option: $1"
	        exit 1
	        ;;
	   esac
done
