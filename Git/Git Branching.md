# Git Branching

## TL;DR

This note is about Git Branching from the book **Pro Git**

## Authors

Scott Chacon and Ben Straub

## Branching in a Nutshell

### Create a New Branch

```git
git branch testing
```

This creates a new pointer at the same commit you are currently on:

![create_new_branch](../image/git_branching_create_branch.png)

Git use pointer `HEAD` to keep branch you're currently on.

You can easily see this by running a simple `git log` command that shows you where the branch pointers are pointing. This option is called `--decorate`:

```git
$ git log --oneline --decorate
f30ab (HEAD, master, testing) add feature #32 - ability to add new
34ac2 fixed bug #1328 - stack overflow under certain conditions
98ca9 initial commit of my project
```

### Switching Branches

To switch to an existing branch, use:

```git
git checkout [other-branch]
```

After run above command, HEAD will point to the `[other-branch]` branch.

> **It’s important to note that when you switch branches in Git, files in your working directory will change. If you switch to an older branch, your working directory will be reverted to look like it did the last time you committed on that branch. If Git cannot do it cleanly, it will not let you switch at all.**
