Make a directory where
owner and group can create files
but only the owner can delete them

# solution

hardik@DESKTOP-G15O7OV:/tmp$ sudo gpasswd -a beta devs
Adding user beta to group devs
hardik@DESKTOP-G15O7OV:/tmp$

hardik@DESKTOP-G15O7OV:/tmp$ sudo chown alpha second
hardik@DESKTOP-G15O7OV:/tmp$ sudo chgrp devs second
hardik@DESKTOP-G15O7OV:/tmp$ ls -l
drwxr-xr-x 2 alpha devs 4096 Jan 19 10:31 second
hardik@DESKTOP-G15O7OV:/tmp$ sudo chmod 774 second/
hardik@DESKTOP-G15O7OV:/tmp$ ls -l
drwxrwxr-- 2 alpha devs 4096 Jan 19 10:31 second
hardik@DESKTOP-G15O7OV:/tmp$
hardik@DESKTOP-G15O7OV:/tmp$ sudo chmod +t second
hardik@DESKTOP-G15O7OV:/tmp$ ls -l
drwxrwxr-T 2 alpha devs 4096 Jan 19 10:31 second

// beta 
$ mkdir by-beta
$ ls -l
total 8
drwxr-xr-x 2 alpha alpha 4096 Jan 19 10:40 by-alpha
drwxr-xr-x 2 beta  beta  4096 Jan 19 10:40 by-beta
$ rmdir by-beta
$ ls -l
total 4
drwxr-xr-x 2 alpha alpha 4096 Jan 19 10:40 by-alpha
$ rmdir by-alpha
rmdir: failed to remove 'by-alpha': Operation not permitted
$ mkdir by-beta
$

//alpha
$ mkdir by-alpha
$ ls -l
total 4
drwxr-xr-x 2 alpha alpha 4096 Jan 19 10:40 by-alpha
$ ls -l
total 8
drwxr-xr-x 2 alpha alpha 4096 Jan 19 10:40 by-alpha
drwxr-xr-x 2 beta  beta  4096 Jan 19 10:41 by-beta
$ rmdir by-alpha
$ ls -l
total 4
drwxr-xr-x 2 beta beta 4096 Jan 19 10:41 by-beta
$ rmdir by-beta
$ ls -l
total 0
$
