# Task:— Controlled Sudo Access

# Scenario
# devuser works in operations team.
# They only need permission to restart a service, nothing else.

# 1. Give devuser limited sudo capability
# 2. The permission must allow only one specific administrative command
# 3. audituser must remain normal user
# 4. Do not give full sudo group access


###### SOLUTION #######

## add sudo privallage to devuser
sudo visudo 
devuser ALL=(ALL:ALL) /usr/bin/systemctl restart cron

hardik@MyLinux:/$ sudo -u devuser bash

# Inside devusers bash
devuser@MyLinux:/$ sudo -l
[sudo] password for devuser: 
Matching Defaults entries for devuser on MyLinux:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin,
    use_pty

User devuser may run the following commands on MyLinux:
    (ALL : ALL) /usr/bin/systemctl restart cron
devuser@MyLinux:/$ 
devuser@MyLinux:/$ sudo systemctl restart cron
devuser@MyLinux:/$ sudo systemctl stop cron
Sorry, user devuser is not allowed to execute '/usr/bin/systemctl stop cron' as root on MyLinux.
devuser@MyLinux:/$ sudo systemctl start cron
Sorry, user devuser is not allowed to execute '/usr/bin/systemctl start cron' as root on MyLinux.
devuser@MyLinux:/$ sudo apt install
Sorry, user devuser is not allowed to execute '/usr/bin/apt install' as root on MyLinux.
devuser@MyLinux:/$ 

# Inside audit users bash
hardik@MyLinux:/$ sudo -u audituser bash
audituser@MyLinux:/$ sudo -l
[sudo] password for audituser: 
Sorry, user audituser may not run sudo on MyLinux.
audituser@MyLinux:/$ sudo ls
[sudo] password for audituser: 
audituser is not in the sudoers file.
audituser@MyLinux:/$ 
