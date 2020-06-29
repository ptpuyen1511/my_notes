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

