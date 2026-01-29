# First change folder to /tmp

cd /tmp

# Create a fake command
echo 'echo fake ls command' > ls

# Make it executable
# 
chmod +x ls

# Now check your commands path:

echo $PATH

### Meaning PATH is a search list:

/usr/local/bin:/usr/bin:/bin

# Search these directories to find commands

# Poison the PATH

PATH=.:$PATH

# It Check current directory first before system directories
    
# Now run ls
ls

# output 
fake ls command


# Command
sudo ls


# Output
# You see **normal directory listing**, not “HACKED…”

# Even though:

# you poisoned PATH
# you created fake `ls`
# normal shell was fooled

# sudo was NOT fooled It will throw away user PATH and use own safe PATH