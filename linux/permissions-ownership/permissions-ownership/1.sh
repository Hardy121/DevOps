Create two users:
    alpha
    beta

Create one group:
    devs

Add:
    alpha → devs
    beta → NOT in devs

Create directory:
    /project

Rules (think before commands):
    alpha can read/write
    devs can read only
    everyone else gets nothing

Prove it:
    Switch users
    Attempt file creation
    Observe failures

# Solution.
# Create two users:
hardik@DESKTOP-G15O7OV:/home$ sudo useradd -m alpha
hardik@DESKTOP-G15O7OV:/home$ sudo passwd alpha
New password:
Retype new password:
passwd: password updated successfully
hardik@DESKTOP-G15O7OV:/home$ sudo useradd -m beta
hardik@DESKTOP-G15O7OV:/home$ sudo passwd beta
New password:
Retype new password:
passwd: password updated successfully
hardik@DESKTOP-G15O7OV:/home$

# Create group
hardik@DESKTOP-G15O7OV:/home$ sudo groupadd devs
.......
devs:x:7781:
hardik@DESKTOP-G15O7OV:/home$

# Add to group
hardik@DESKTOP-G15O7OV:/home$ sudo gpasswd -a alpha devs
Adding user alpha to group devs
hardik@DESKTOP-G15O7OV:/home$

# Make directory
hardik@DESKTOP-G15O7OV:/tmp$ mkdir project
hardik@DESKTOP-G15O7OV:/tmp$ ls -l 
drwxr-xr-x 2 hardik hardik 4096 Jan 19 09:10 project
hardik@DESKTOP-G15O7OV:/tmp$

# Give permissions
hardik@DESKTOP-G15O7OV:/tmp$ sudo chown alpha project/
hardik@DESKTOP-G15O7OV:/tmp$
hardik@DESKTOP-G15O7OV:/tmp$ sudo chmod 750 project/
hardik@DESKTOP-G15O7OV:/tmp$
hardik@DESKTOP-G15O7OV:/tmp$ sudo chgrp devs project/
hardik@DESKTOP-G15O7OV:/tmp$ ls -l
drwxr-x--- 2 alpha devs 4096 Jan 19 09:10 project
hardik@DESKTOP-G15O7OV:/tmp$

/beta
$ cd project
-sh:  cd: can't cd to project'
$ 

// alpha
$ cd project
$

# Note
But you switched users without resetting group membership.
When you added alpha to devs, that change does NOT apply to existing login sessions.
So alpha didn’t actually have devs yet.
Classic Linux trap. Everyone hits this.

# List
Read permission does NOT let you enter a directory.
Say it again.
Read = list name
Execute = access / traverse
For directories:
r → see filenames
x → enter the directory (cd)
w → create/delete files
Your group (devs) has read but NO execute.
That is a useless permission combination.
Linux is literal. It does not guess intent.