## File & Directory Management

⌘ mkdir foldername
➤ Create a directory.

⌘ pwd
➤ Show current working directory path.

⌘ ls
➤ List files 

    ➤ ls -a : list all files with hidden files
    ➤ ls -l : list all files with permissions and details
    ➤ ls -h : list all files in human readable formate
    ➤ ls -i : list all files with their inodes
    ➤ ls -r : list all files in reverse order of sort
    ➤ ls -s : list all files size of sort
    ➤ ls -t : list all files sort by time, newest first

⌘ cd folder
➤ Change directory

⌘ rm filename
➤ Delete a file
    
    ➤ rm -f filename :  ignore nonexistent files and arguments (force)
    ➤ rm -r filename :  remove directories and their contents recursively
    ➤ rm -r day* : remove all the folder with name of day

⌘ rmdir foldername
➤ Delete an empty folder

# File Reading & Viewing & Editing

⌘ touch filename
➤ Create an empty file.

⌘ cat filename
➤ Read full file.

⌘ head -n 2 filename
➤ Show first n numbers of lines

⌘ tail filename
➤ Show last 10 numbers of lines
    ➤ tail -f filename : output appended data as the file grows 

⌘ less file.txt
➤ Paginated file viewer.

⌘ more file.txt
➤ Another paginated file viewer.

⌘ zcat file.gz
➤ View compressed files without extracting.

# Navigation Inside less/more

    ⌘ Arrow Keys / PgUp / PgDn
    ➤ Navigate pages.
    ⌘ Spacebar
    ➤ Next page.
    ⌘ b
    ➤ Previous page.
    ⌘ /word
    ➤ Search inside file.
    ⌘ n
    ➤ Next match.

⌘ tee hello.txt
➤ Print & save output to file.

⌘ vi file.txt / vim file.txt
➤ Open file in VI editor.

⌘ nano file.txt
➤ Open file in nano editor.

# Copy & Move Files

⌘ cp file folder/
➤ Copy file to folder.

⌘ cp  -r  folder1 folder2
➤ Copy folder recursively.

⌘ mv file folder/
➤ Move a file.

⌘ mv oldname newname
➤ Rename file or folder.

⌘ mv demo.txt ../folder
➤ Move file to parent directory.

# Links

⌘ ln -s original linkname
➤ Create soft link.

⌘ ln original linkname
➤ Create hard link.