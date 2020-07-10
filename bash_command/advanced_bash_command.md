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

## User and Group Management

`users` - show all users currently logged in, if we wanna see all users (even those not logged in), check `/etc/passwd`

`useradd` - add a user

`userdel` - delete a user

`usermod -l new_username old_username` - modify the username of a user

`sudo passwd username` - change the password for a user

`sudo chsh username` - change a shell for a user

`sudo chfn username` - change the details for a user

`adduser username sudo` or `usermod -aG sudo username` - add a user to the `sudo` group

`sudo - other_user` or `sudo -u other_user zsh` - log in other user

---

`groups` - show all of the groups of which the current user is a member, if we wanna see all groups, check `/etc/group` but **DO NOT MODIFY** this file unless we know what we are doing

`groupadd` - add a group

`groupdel` - delete a group

## Text Processing

`uniq` - print unique lines (default) or repeated lines

`sort` - sort lines alphabetically / numerically

`diff` - report which lines differ between two lines

`cmp` - report which bytes differ between two files

---

`cut` - usually used to cut a line into sections on some delimiter (good for CSV processing). `-d` specifies the delimiter and `-f` specifies the field index to print (start with 1 for the first field)

`sed` - (stream editor) commonly used to replace a string with another string in a file

```bash
sed 's/old_string/new_string' file
# replace the first occurrence of the pattern in each line (default)

sed 's/old_string/new_string/2' file
# replace the second occurrence of the pattern in a line

sed 's/old_string/new_string/g' file
# replace all the occurrences of the string in the line

sed 's/old_string/new_string/3g' file
# replace from nth occurence to all occurrences in a line

sed 's/\(\b[A-Z]\)/\(\1\)/g'
# parenthesize first character of each word

sed '3 s/old_string/new_string/' file
# replace string on a specific line number

sed 's/old_string/new_string/p' file
# duplicate the replaced line. Print the replaced line twice on the terminal. If a line does not have the search pattern and is not replaced, the print that line only once

sed -n 's/old_string/new_string/p' file
# print only the replaced lines

sed '1, 3 s/old_string/new_string/' file
# replace string on a range of lines

sed '2,$ s/old_string/new_string/' file
# repalce from second line to the last line ($)

##########

sed '2d' file
# delete second line in file

sed '$d' file
# delete a last line

sed '3,6d' file
# delete line from range x to y

sed '12,$d' file
# delete from 12th line to last line

sed '/pattern/d' file
# delete pattern matching line

#########

sed G file
# insert one blank line after each line

sed 'G;G' file
# insert 2 blank lines after each line

sed '/^$/d;G' file
# delete blank lines and insert one blank line after each line

sed '/pattern/{x;p;x;}' file
# insert a blank line above every line which matches "pattern"

sed '/pattern/G' file
# insert a blank line below every line which matches "pattern"

sed '/^$/d' file
# delete blank lines

sed -i '/^#/d;/^$/d' file
# delete empty lines or those begins with "#"

#########

sed -n '2,5p' file
# view a file from 2 to 5 range

sed '2,4d' file
# view entire file except the given range, same delete lines in range

sed -n '4'p file
# print 4th line of the file

sed -n '4,6'p file
# print lines from 4th line to 6th line

sed -n '$'p file
# print only the last line

sed -n 'n,$'p file
# print from nth line to end of file (last line)

###########

sed -n /pattern/p file
# print the line only which matches the pattern

sed -n '/pattern/,5p' file
# print lines which matches the pattern from input to 5th line

sed -n '1,/pattern/p' file
# print lines from the 1st line up-to the line which matches the pattern

sed -n '/learn/,+2p' file
# print the lines which matches the pattern up-to the next xth lines
```

## Pattern Matching

`grep` - `g`/`re`/`p` (search `g`lobally for a `r`egular `e`xpression and `p`rint it) $\to$ use for finding text in files. `grep` allows for `-E` use of extended regular expressions, `-F` matching any one of multiple strings at once, and `-r` recursively searching files within a directory.

```bash
grep [options] pattern [files]

Options Description
-c : This prints only a count of the lines that match a pattern
-h : Display the matched lines, but do not display the filenames.
-i : Ignores, case for matching
-l : Displays list of a filenames only.
-n : Display the matched lines and their line numbers.
-v : This prints out all the lines that do not matches the pattern
-e exp : Specifies expression with this option. Can use multiple times.
-f file : Takes patterns from file, one per line.
-E : Treats pattern as an extended regular expression (ERE)
-w : Match whole word
-o : Print only the matched parts of a matching line, with each such part on a separate output line.


$grep -i "PAttern" file
# case insensitve search

$grep -c "pattern" file
# display the count of number of matches

$grep -l "pattern" *
# display the file names that matches the pattern

$grep -w "pattern" file
# check for the whole words in a file

$grep -o "pattern" file
# display only the matched pattern

$grep -n "pattern" file
# show line number while displaying the output

$grep -v "pattern" file
# invert the pattern match

$grep "^pattern" file
# match the lines that start with pattern

$grep "pattern$" file
# matching the lines end with pattern

$grep -e "pattern1" -e "pattern2" file
# specify expression, can use multiple times

$grep -f pattern.txt file
# take pattern from file, one per line
```

Ref: [GeeksForGeeks](https://www.geeksforgeeks.org/grep-command-in-unixlinux/)

`awk` - a pattern-matching language built around reading and manipulating delimited data files, like CSV files

**As a rule of thumb, `grep` is good for finding strings and patterns in files, `sed` is good for one-to-one replacement of strings in files, and `awk` is good for extracting strings and patterns from files and analysing them.**

```bash
# Example
$ printf "A 10\nB 20\nC 60" > file

$ awk 'BEGIN {sum=0; count=0; OFS=" "} {sum+=$2; count++} END {print "Average:", sum/count}' file
Average: 30
```

## Copying Files Over `ssh`

`ssh` - how Unix-based machines connect to each other over network

```bash
$ ssh -p <port> username@xxx.xxx.xxx.xxx

Last login: ....
```

Using `exit` to logout

`scp` - secure copy, use to copy file to other machine

```bash
scp -P <port> file username@xxx.xxx.xxx.xxx
```

`rsync` - a file-copying tool which minimises the amount of data copyied by looking for deltas (changes) between files. It can be performed over `ssh` as well

## Long-Running Processes

`nohup` - running the command with `nohup` insures that the command will not be hung up if the shell is closed or if the network connection fails

`yes` - continually outputs "y" until it's killed

`ps` - show a list of the current user's processes

`kill -9 pid` - kill process (`-9` means SIGKILL $\to$ terminate immediately)

---

`cron` - provide an easy way of automating regular, scheduled tasks

`crontab -e` - (opens a text editor) to edit your `cron`

## Miscellaneous

`pushd` and `popd` - maintain a directory stack

`xdg-open` - opens file with the default application

`xargs` - vectorise commands, running them over any number of arguments in a loop

## Fun But Mostly Useless Things ;-)

`w` is more detailed `who`, showing who's logged in and what they're doing

`write` - send a message to a specific user

`wall` - send message to every logged-in user

`lynx` - fully-functional, text-based web browser

---

`nautilus` - initialise a GUI remote desktop session and open a file browser

`date` - show the current date and time

`cal` - show an ASCII calendar of this month with today's date higlighted

`bc` - a basic arithmetic calculator (but we should use Python =)) )

