# Git Notes

## TL;DR

This file contains unorganized notes about git

## Keynote Takeaways

New update for personal access token Github

Remove old stored password: `rm ~/.git-credentials`.

Try `git fetch` to update new username and password.

`git config --global credential.helper store` for store token.

---

`git checkout --orphan <branchname>` - create new empty branch

`git merge --allow-unrelated-histories branch1 branch2` - merge 2 branchs which are unrelated histories

`git push -u origin local-name:remote-name` - push local branch to remote branch with other name

`git remote add <origin-name> <link-to-remote>` - add new remote

`git branch -r` - list branch in remote

`git branch -d <local-branch-name>` - remove local branch

`git push origin --delete <remote-branch-name>` - remove remote branch

---

`git clean -n` - show what will be deleted by using the `-n` option

`git clean -f` - delete all untracked files

`git clean -fd` - remove directories

`git clean -fX` - remove ignored files

`git clean -fx` - remove ignored files and non-ignored files

`git clean -i` - get a quick overview of what is going to be deleted offering you the possibility to include/exclude the affected files

[ref](https://stackoverflow.com/questions/61212/how-to-remove-local-untracked-files-from-the-current-git-working-tree)

---
