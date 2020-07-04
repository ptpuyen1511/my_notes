# Intermediate Bash Command

This is a note for some intermediate bash commands from https://dev.to/awwsmm/101-bash-commands-and-tips-for-beginners-to-experts-30je

I just customize it for myself

## Disk, Memory, and Processor Usage

`ncdu` - (NCurses Disk Usage) improved `du`, it opens a read-only vim-like window

`top` - display all currently-running processes and their owners, memory usage and more.

`htop` - improved `top`, interactive `top`

`top -u username` - display process to only those owner by `username` (also `htop`)

## REPLs and Software Versions

REPL - Read-Evaluate-Print Loop, similar to the command line, but usually used for particular programming languages

`-version / --version / -v` - give software version

## Environment Variables and Aliases

### Environment

Environment variables (env vars) - are persistent variables that can be created and used within your `bash` shell. They are defined with an equals sign (`=`) and used with a dollar sign (`$`). You can see all currently-defined env vars with `printenv`

Set a new environment variable with an `=` sign (don't put any spaces before or after the `=`)

```bash
myvar=hello
```

`echo $myvar` - print a specific env var

If env var contains spaces or other whitespace should be surrounded by quotes (`"..."`)

`export myvar=hello` - also used to define env vars (when defined this way, the will also be available to sub-processes)

`unset myvar` - unset an environment

### Aliases

Similar to env vars but are usually used in a different way -- to replace long commands with shorter ones

`alias new_cmd="old cmd"` - create alias

`unalias new_cmd" - remove alias

Note: append you base alias to `.bashrc` file, it will create permanent Bash alias

## Basic `bash` Scripting

### `bash` scripts

`bash` scripts (usually ending in `.sh`) allow you to automate complicated processes, packaging them into reusable functions.

```bash
echo "ls && touch file && ls" > ex.sh

# For long lines
echo "for i in {1..3}; do echo \
 \"Welcome \$i times\"; done" > ex.sh
```

`source ex.sh` - executed shell script (also use `sh ex.sh`)

## Custom Prompt and `ls`

`$PS1` - Prompt String 1 - env var that defines your main shell prompt

Change default prompt with the `export`

We can add colours for prompt

And can also change the colours shown by ls by editing the `$LS_COLORS` env var

## Config Files

`~/.bashrc`

We can add line `echo "~/.bashrc loaded!" to the top of `~/.bashrc~ to display log login

### Types of Shells

> Login shells are shells you log in to (where you have a username). Interactive shells are shells which accept commands. Shells can be login and interactive, non-login and non-interactive, or any other combination.

> In addition to `~/.bashrc`, there are a few other scripts which are `sourced` by the shell automatically when you log in or log out. These are:
> * `/etc/profile`
> * `~/.bash_profile`
> * `~/.bash_login`
> * `~/.profile`
> * `~/.bash_logout`
> * `/etc/bash.bash_logout`

**Note that `bash` scripts can `source` other scripts**

**Note that there are also different shells. `bash` is just one kind of shell (the "Bourne Again Shell"). Other common ones include `zsh`, `csh`, `fish`, and more.**

## Finding Things

`whereis` - search for "possibly useful" files related to a particular command. It will attempt to return the location of the binary, source, and `man` page

`which` - return the location of the binary

`whatis` - print out the one-line description of a command from its `man` page

**Note: `which` is useful for finding the "original version" of a command which may be hidden by an alias**

---

`locate` - find a file anywhere on the system by referring to a semi-regularly-updated cached list of files

`find` - iterate through the file system to find the file we are looking for 

```bash
find ~/ -iname "test.py"
```

**Note: `located` is usually faster than the alternative, `find`**

## Downloading Things

`ping` - attempt to open a line of communication with a network host

```bash
ping google.com
```

`wget` - used to easily download a file from the Internet

`curl` - can be used just like `wget` (don't forget the `--output` flag)

```bash
curl https://some-link --output file.abc
```

**Note: `curl` supports many more protocols and is more widely available than `wget`; `curl` can also send data (`wget` recieve only). `wget` can download files recursively, while `curl` cannot.**

---

`apt` - fantastic package management in Debian-descended Linux distro

`dnf` - in Fedora

`apt search` - search software

`apt install` - install software

`gunzip` - unzip file `.tar.gz`

`tar` - extract and creat `.tar` file

```bash
tar -xf file.tar
# -x for extract, -f to specify the file to "untar"

tar -xcf file_new.tar folder_to_tar
# -c for create
```

`gzip` - zip a file (also `.tar` file)

```bash
gzip -c test.py > zipped_file.gz
```

## Redirecting Input and Output

`echo` - write text to stdout by default

`|` - pipe operator, redirects the output of the left command to the input of the right command

`>` - redirect output from stdout to a particular location

`printf` - an improved `echo`, allowing formatting and escape sequences

`<` - get input from a particular location, rather than stdin

```bash
$ sort <(printf "1\n3\n2")

1
2
3
```
---

`0` - standard input

`1` - standard ouput

`2` - standard error streams

`>&1` - write to stdout

`>&2` - write to stderr

`1>/dev/null` - redirect stdout to `/dev/null`

`2>/dev/null` - redirect stderr to `/dev/null`

`&>/dev/null` - redirect both to `/dev/null`

`tee` - send output to stdout adn any number of additional locations

```bash
echo "test" | tee file1 file2 file3
```

