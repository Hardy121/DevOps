#!/bin/bash

set -eou pipefail
IFS=$'\n\t'

log(){
	echo "$(date '+%F %T') - $1"
}

check_disk(){
	
	DISK=$(df / | awk 'NR==2 {print $5}' | tr -d %)
	echo
	log "Checking disk usage"

	if [[ $DISK > 80 ]];
	then
		log "Disk usage NOT OK ("$DISK")"
	else
		log "Disk usage OK ("$DISK"%)"
	fi
	echo

}

check_memory(){
   
	log "Checking memory usage"
	FREE=$(free -m | awk 'NR==2 {print $4}')
	if [[ $FREE -gt 2000 ]];
	then
		log "Memory usage OK ($FREE)"
	else
		log "Memory usage NOT OK ($FREE)"
	fi
	echo
}

check_cpu(){
	log "Checking CPU load"
	CHECK_CPU=$(uptime | awk '{print $8}' | tr -d ",")
	if [[ $CHECK_CPU > $(nproc) ]];
	then
	       log "CPU load not normal"	
        else
	       log "CPU load normal"       
	fi
	echo	
}

check_service(){
	local SERVICE=$1
	log "Checking $SERVICE service"
	RUNNING_SERVICES=$(pgrep -c $SERVICE || true)
	if [[ $RUNNING_SERVICES -eq 0 ]];
	then
		sudo systemctl restart "$SERVICE"
		
		sleep 5

		if [[ $RUNNING_SERVICES -eq 0 ]];
		then 
			log "$SERVICE is running"
		else
			log "Failed to start $SERVICE"	
		fi
	else
		log "$SERVICE is running"
	fi	
	echo
}

check_logs(){
	log "Checking logs for errors"
	LOGS=$(grep -i "error" /var/log/syslog | wc -l)
	
	if [[ $LOGS -eq 0 ]];
	then 
		log "Checking logs for errors"
	else
		log "Current logs"
		echo
		echo
		grep -i "error" /var/log/syslog | tail -n 5
	fi
	echo

}

main (){

	SERVICE=${1:-apache}

	log "Starting server health check"
	check_disk
	check_memory
	check_cpu
	check_service "$SERVICE" 
	check_logs

	log "Health check completed"

}

main "$@"
