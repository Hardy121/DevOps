Task : Sudo Internals & Logging


# Scenario
# A company suspects misuse of sudo.
# You must prove who ran what command and when.


# 1. Trigger at least two sudo actions using devuser
# 2. Find where sudo logs are stored
# 3. Extract only sudo-related entries
# 4. Show:
    # Username
    # Command executed
    # Timestamp

####### SULUTION ###### 
sudo visudo: 
#  add privallage of devuser
devuser ALL=(ALL:ALL) /usr/bin/systemctl restart cron, /usr/bin/systemctl status cron

# run commands inside devuser's bash
hardik@MyLinux:/$ sudo -u devuser bash
devuser@MyLinux:/$ sudo systemctl restart cron
[sudo] password for devuser: 
devuser@MyLinux:/$ sudo systemctl status cron
● cron.service - Regular background program processing daemon
     Loaded: loaded (/usr/lib/systemd/system/cron.service; enabled; preset: enabled)
     Active: active (running) since Sat 2026-02-14 09:38:59 UTC; 3s ago
       Docs: man:cron(8)
   Main PID: 13351 (cron)
      Tasks: 1 (limit: 4603)
     Memory: 444.0K (peak: 692.0K)
        CPU: 7ms
     CGroup: /system.slice/cron.service
             └─13351 /usr/sbin/cron -f -P
devuser@MyLinux:/$ 


# checkout logs using traditional method
hardik@MyLinux:/$ sudo tail -n 20 /var/log/auth.log 
2026-02-14T09:38:43.236892+00:00 localhost sudo: pam_unix(sudo:session): session opened for user devuser(uid=1001) by hardik(uid=1000)
2026-02-14T09:38:59.567260+00:00 localhost sudo:  devuser : TTY=pts/1 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/systemctl restart cron
2026-02-14T09:38:59.574998+00:00 localhost sudo: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1001)
2026-02-14T09:38:59.600006+00:00 localhost sudo: pam_unix(sudo:session): session closed for user root
2026-02-14T09:39:02.984874+00:00 localhost sudo:  devuser : TTY=pts/1 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/systemctl status cron
2026-02-14T09:39:02.986676+00:00 localhost sudo: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1001)
2026-02-14T09:39:03.006596+00:00 localhost sudo: pam_unix(sudo:session): session closed for user root
2026-02-14T09:39:31.033603+00:00 localhost sudo: pam_unix(sudo:session): session closed for user devuser
2026-02-14T09:39:39.918671+00:00 localhost sudo:   hardik : TTY=pts/0 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/journalctl
2026-02-14T09:39:39.926772+00:00 localhost sudo: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1000)
2026-02-14T09:39:39.976963+00:00 localhost sudo: pam_unix(sudo:session): session closed for user root
2026-02-14T09:42:45.051891+00:00 localhost sudo:   hardik : TTY=pts/0 ; PWD=/var/log ; USER=root ; COMMAND=/usr/bin/tail -f auth.log
2026-02-14T09:42:45.057889+00:00 localhost sudo: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1000)
2026-02-14T09:42:51.669042+00:00 localhost sudo: pam_unix(sudo:session): session closed for user root
2026-02-14T09:43:18.755915+00:00 localhost sudo:   hardik : TTY=pts/0 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/tail -n 20 /var/log/auth.log
2026-02-14T09:43:18.757512+00:00 localhost sudo: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1000)
hardik@MyLinux:/$ 

# checkout logs using journalctl(systemd)
hardik@MyLinux:/$ sudo journalctl | grep sudo
Feb 14 09:38:43 MyLinux sudo[13330]: pam_unix(sudo:session): session opened for user devuser(uid=1001) by hardik(uid=1000)
Feb 14 09:38:59 MyLinux sudo[13345]:  devuser : TTY=pts/1 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/systemctl restart cron
Feb 14 09:38:59 MyLinux sudo[13345]: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1001)
Feb 14 09:38:59 MyLinux sudo[13345]: pam_unix(sudo:session): session closed for user root
Feb 14 09:39:02 MyLinux sudo[13352]:  devuser : TTY=pts/1 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/systemctl status cron
Feb 14 09:39:02 MyLinux sudo[13352]: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1001)
Feb 14 09:39:03 MyLinux sudo[13352]: pam_unix(sudo:session): session closed for user root
Feb 14 09:39:31 MyLinux sudo[13330]: pam_unix(sudo:session): session closed for user devuser
Feb 14 09:39:39 MyLinux sudo[13402]:   hardik : TTY=pts/0 ; PWD=/ ; USER=root ; COMMAND=/usr/bin/journalctl
Feb 14 09:39:39 MyLinux sudo[13402]: pam_unix(sudo:session): session opened for user root(uid=0) by hardik(uid=1000)

the tradional method and systemd method of view logs. 
