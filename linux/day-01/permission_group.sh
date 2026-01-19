# File Permissions & Ownership

⌘ chmod 777 file / chmod u+rwx,g+rx,o-r file
➤ Set rwxrwxrwx permissions.


⌘ umask
➤ Show default permission mask.



⌘ cat .bashrc
➤ View bash profile.

⌘ sudo chown user file / chown user:group file
➤ Change file owner.

⌘ sudo chgrp group file
➤ Change group owner.

➤  r        ls (list)
➤  x        cd / access
➤  r+x      ls + access
➤  w        create/

# Special Permissions
⌘ chmod u+s file
➤ SUID (Set User ID)

⌘ chmod u+s file
➤ SGID (Set Group ID)

⌘ chmod +t /shared
➤  Sticky Bit (VERY important)