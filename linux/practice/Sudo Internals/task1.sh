# Task: User & Permission Foundation
# Create two normal users
    # devuser
    # audituser
# Create one group
    # developers
# Add only devuser into developers group.

###### SOLUTION #######

hardik@MyLinux:~$ sudo useradd -m devuser
hardik@MyLinux:~$ sudo useradd -m audituser
hardik@MyLinux:~$ sudo passwd devuser 
New password: 
Retype new password: 
passwd: password updated successfully
hardik@MyLinux:~$ sudo passwd audituser
New password: 
Retype new password: 
passwd: password updated successfully
hardik@MyLinux:~$ sudo groupadd developers
hardik@MyLinux:~$ sudo gpasswd -a devuser developers 
Adding user devuser to group developers
# view user's are add
hardik@MyLinux:~$ sudo cat /etc/passwd
devuser:x:1001:1001::/home/devuser:/bin/sh  # devuser
audituser:x:1002:1002::/home/audituser:/bin/sh # audituser

# view group is add
hardik@MyLinux:~$ sudo cat /etc/group 
devuser:x:1001:
audituser:x:1002:
developers:x:1003:devuser # developer group is made, and devuser is added in developers 
hardik@MyLinux:~$  



