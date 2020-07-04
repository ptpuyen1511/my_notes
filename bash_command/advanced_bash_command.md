# Advanced Bash Command

This is a note for some advanced bash commands from https://dev.to/awwsmm/101-bash-commands-and-tips-for-beginners-to-experts-30je

I just customize it for myself

## Superuser

`whoami` - print what your username is

`sudo -u username` - run command as another user

`sudo command` - the default user is the superuser (usually called 'root') with **unlimited permissions**

`su` - become another user temporarily (and `exit` to switch back)

*Note: `su` command switches to the super user - or root user - when you execute it with no additional options; `sudo command` runs a single command with root privileges*

`!!` - retains the previous command

## File Permissions

`ls -lh` - view file permissions (`w` for written, `r` for read and `x` for executed)

```bash
$ ls -lh
total 24K
-rw-r--r--. 1 uyenptp uyenptp  639 Jul  5 01:21 advanced_bash_command.md
-rw-r--r--. 1 uyenptp uyenptp 4.6K Jul  5 01:08 basic_bash_command.md
-rw-r--r--. 1 uyenptp uyenptp 1.6K Jul  5 00:51 basic_linux_command.md
-rw-r--r--. 1 uyenptp uyenptp 5.6K Jul  5 01:07 intermediate_bash_command.md

# First character of each line represents the type of file, d = directory, l = link, - = regular file and so on
# Then there are three groups of three characters which represent the permissions held by the user (u) who owns the file, the permissions held by the group (g) which owns the file, and the permissions held any other (o) users.
# 'rw-' indicates that owner user can read and write, 'r--' indicates that owner group can read only and 'r--' indicates that other user can also read only.
# The number which follows this string of characters is the number of links in the file system to that file (1 above).

# We can encode rwx to bit, so if what permission is on the bit at that position will turn on 1. For example: rw- --> 110 (6), r-x --> 101 (5), rwx --> 111 (7)
# So three groups permissions above are equivalent to 644
```

---

`chmod` - change mode

```bash
$ chmod 777 advanced_bash_command.md

# Will change permissions to rwxrwxrwx

# Or we can use + -
$ chmod +x basic_bash_command.md && chmod -w basic_linux_command.md
```

`chown` - change owner

```bash
sudo chown other_user folder_or_file_wanna_change
```

`chgrp` - change owner group

