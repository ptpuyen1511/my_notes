# Basic Bash Command

This is some basic bash command from https://dev.to/awwsmm/101-bash-commands-and-tips-for-beginners-to-experts-30je

I just customize it for myself

## First Commands, Navigating the Filesystem

`pwd` - print working directory

`ls` - *l*i*s*t the content of directory

`ls -a` - show all files or directories (with hidden) 

`ls -l` - show files detail 

`ls -la` or `ls -l -a` - combine 2 above flags

`cd` - *c*hange *d*irectory

`cd ..` - cd to parent directory

`cd ~` - cd to home

`cd -` - go back to the most recent directory

---

`;` - run multiple commands

```bash
ls ; pwd

# Mean list all files in working directory and after that print working directory
```

`&&` - also used in running multiple commands but the right command will not run if the left one fails

`&` - run a command in background

```bash
python train.py &
```

To show background commands, using `jobs` command

To kill a background process, using `kill idprocess` or `kill %N` where `N` is the job index show by the `jobs` command

## Getting Help

`-h` or `--help`: put after almost any command to bring up a help menu for that command

`man` - put before almost any command to bring up a manual for that comamnd (using `q` to quit `man`)

## Viewing and Editing Files

`head` - outputs the first few lines of a file (default 5 lines)

`head -n 10` - outputs the first 10 lines of a files

`tail` - outputs the last few lines of a file (default 5 lines)

`tail -n 10` - outputs the last 10 lines of a file

`tail -n +10` - outputs the end of the file beginning from the 10th line

---

`cat` - concatenates a list of files and sends them to the standard output stream (usually the terminal)

`less` - tool for quickly viewing file -- it opens up a vim-like read-only window

`more` - same above but can only scroll down (can use command like vim) (old)

---

`nano` - a minimalistic command-line text editor

`nedit` - a small graphical editor

## Creating and Deleting Files and Directories

`touch` - create a new file

`mkdir` - create new, empty directory

`rm` - remove file and non-recoverable

`rm -i` - remove with "are you sure?"

`rmdir` - remove **empty** directory only

`rm -rf` - remove a directory (-r = recursive and -f = force)

## Moving and Copying Files, Making Links, Command History

`mv` - moves / renames a file

`cp` - copies a file

---

`ln` - create a hard link to a file

```bash
ln target_file new_link
```

`ln -s` - create a soft link to a file

```bash
ln -s target_file new_link
```

A hard link just create another file with a link to the same underlying inode. When you delete a file, it removes one link to the underlying inode. The inode is only deleted (or deletable/over-writable) when all links to the inode have been deleted. Once a hard link has been made the link is to the inode. Deleting, renaming, or moving the original file will not affect the hard link as it links to the underlying inode. Any changes to the data on the inode is reflected in all files that refer to that inode. ([StackOverflow](https://stackoverflow.com/a/185903/6678117))

A soft link means "create a file tha should point to the original file", so if we delete, rename or move original file, soft link will point to nothing and system will raise error.

---

`^r (Ctrl + r)` - search through history commands

## Directory Trees, Disk Usage, and Processes

`mkdir -p path/to/new/dir` - make all directories in the path if they don't already exit

`tree` - visualise a directory by printing a nicely formatted direcotry tree, by default, it prints the entire tree structure

`tree -L 2` - print 2 levels only

`tree --prune` - hide empty directories in tree's output

---

`df` - show how much space is taken up by files for the disks or system

`df -h` - show with "human-readable"

`du` - show file space usage for a particular directory and its subdirectories

`du -h --max-depth=1` - only show directories N levels down (or fewer)

`ps` - show all of the user's currently-running process (aka. `jobs`)

