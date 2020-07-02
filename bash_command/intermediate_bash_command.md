# Intermediate Bash Command

This is some intermediate bash command from https://dev.to/awwsmm/101-bash-commands-and-tips-for-beginners-to-experts-30je

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
