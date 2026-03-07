#!/bin/bash

<<comment 
If you want to maintain the logging for your script, you can use logger in your scirpt
you can find the logs under
/var/logs/messages
example: #logger "Hey Buddy"
comment

logger "This is log from ${0}"


