# ZSH Command

## TL;DR

This file contains some commands in zsh.

## Reference
[Learn the basics of the ZSH shell](https://linuxconfig.org/learn-the-basics-of-the-zsh-shell)
[Z-Shell Guide](http://zsh.sourceforge.net/Guide/zshguide.html)

## Contents

### Directory Shorthand

```
ls /u/sh/ico
```

Zsh will expand it out to the full path to the shared icons directory.

### Z Command

```
z git
```

For example, I had a folder at `/home/user/Documents` and I used it frequently. I can use `z` for going to it quickly.

### Extract

Extract plugin in Zsh can unzip all types of compressed files.

```
extract <file-name>
```

### Globbiing

* List everything in current directory as well as all subdirectories

```
ls **/*
```

* Find specific types

```
ls **/*.png
```

* Find specific file with full name

```
ls **/README.*
```

* Search for words or phrases within the file names

```
# Starts with READ
ls **/(READ)*.*

# Ends with READ
ls **/*(READ).*

# Contains READ anywhere
ls **/*(READ)*.*
```

* Search for one of a number of characters

```
# All files that start with A
ls **/[A]*(.)

# All files that start with A or a
ls **/[Aa]*(.)

# All files that contain the number
ls **/*[1]*(.)

# Any files that end in a vowel
ls **/*[aeiouy](.)
```

* Exclude a character or characters

```
# Files that do not start with A or a
ls **/*[^Aa](.)
```

* Search for ranges of letters

```
# Files that end in a number
ls **/*<1-10>(.)
```

* List files only

```
ls **/*(.)
```

* List folders only
```
ls **/*(/)
```

#### Glob Qualifiers

* Restrict by file size with L (maybe Limit?)

```
# Shows files larger than 250MB
ls -lahS **/*(.Lm+250)

# Lk Lm Lg for Limit on KB, MB, GB
# - for under and + for over
```

* Filter by modification and access
```
# All files modified within the last week
ls -lah **/*(.mw-1)

# All files accessed within the last 3 days
ls -lah **/*(.md-3)

# m for modification, a for access
# s, m, h, d, w, and M for seconds, minutes, hours, days weeks and months
```

### Easy Directory Navigation

```
dirs -v
```

See the history of directories I visited.

```
~<number>

# number is id of directory in list directories in history
```

Switch directory quickly.

