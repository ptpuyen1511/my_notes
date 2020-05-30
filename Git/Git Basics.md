# Git Basics

## TL;DR

This note is about Git Basics from the book **Pro Git**

## Authors

Scott Chacon and Ben Straub

## Intro Version Control Systems

* Centralized Version Control Systems
  
  * Have a single server that contains all the versioned files, and a number of clients that check out files from that central place.
  * ![csv](../image/git_basics_cvs.png)

* Distributed Version Control Systems
  
  * > In a DVCS (such as Git, Mercurial, Bazaar, or Darcs), clients don’t just check out the latest snapshot of the files—they fully mirror the repository. Thus if any server dies, and these systems were collaborating via it, any of the client repositories can be copied back up to the server to restore it. Every checkout is really a full backup of all the data.
  
  * ![dvc](../image/git_basics_dvc.png)

## Intro Git

> Git stores and thinks about information much differently than these other systems, even though the user interface is fairly similar, and understanding those differences will help prevent you from becoming confused while using it.

### Snapshots, Not Differences

> The major difference between Git and any other VCS (Subversion and friends included) is the way Git thinks about its data. Conceptually, most other systems store information as a list of file-based changes. These systems (CVS, Subversion, Perforce, Bazaar, and so on) think of the information they keep as a set of files and the changes made to each file over time.
>
> Git doesn’t think of or store its data this way. Instead, Git thinks of its data more like a set of snapshots of a miniature filesystem. Every time you commit, or save the state of your project in Git, it basically takes a picture of what all your files look like at that moment and stores a reference to that snapshot. To be efficient, if files have not changed, Git doesn’t store the file again, just a link to the previous identical file it has already stored. Git thinks about its data more like *a stream of snapshots*.

![storing_as_snapshots](../image/git_basics_storing_as_snapshots.png)

### Git Has Integrity

> Everything in Git is check-summed before it is stored and is then referred to by that checksum.
>
> The mechanism that Git uses for this checksumming is called a SHA-1 hash. This is a 40-character string composed of hexadecimal characters (0–9 and a–f) and calculated based on the contents of a file or directory structure in Git. A SHA-1 hash looks something like this:

```cplusplus
24b9da6552252987aa493b52f8696cd6d3b00373
```

### The Three States

Git has three main states that your files can reside in:

* Committed: means that the data is safely in your local database.
* Modified: means that you have changed the file but have not committed it to your database yet.
* Staged: means that you have marked a modified file in its current version to go into your next commit snapshot.

![three_states](../image/git_basics_three_states.png)

## First-Time Git Setup

### Your Identity

```git
git config --global user.name "Your Name"

git config --global user.email your_email@email.com
```

### Your Editor

Git uses Vim for default editor, but you can change to other editor:

```git
git config --global core.editor emacs
```

### Checking Your Settings

```list
$ git config --list

user.name=Your Name
user.email=your_email@email.com
color.status=auto
color.branch=auto
color.interactive=auto
color.diff=auto
...
```

You can also check what Git thinks a specific key's value is by typing `git config <key>`:

```git
$ git config user.name

Your Name
```

## Getting Help

You can use three ways to get the manual page (manpage) help for any of the Git commands:

```git
git help <verb>
git <verb> --help
man git-<verb>
```

## Getting a Git Repository

### Initializing a Repository in an Existing Directory

```git
git init
```

> This creates a new subdirectory named .git that contains all your necessary repository files—a Git repository skeleton

### Cloning an Existing Repository

Clone and store with same name in global repo:

```git
git clone https://github.com/libgits2/libgit2
```

Clone and store with specified name (mylibgit is new name):

```git
git clone https://github.com/libgit2/libgit2 mylibgit
```

## Recording Changes to the Repository

> Each file in your working directory can be in one of two states: tracked or untracked. Tracked files are files that were in the last snapshot; they can be unmodified, modified, or staged. Untracked files are everything else—any files in your working directory that were not in your last snapshot and are not in your staging area.

![lifecycle_status_files](../image/git_basics_lifecycle_of_status_files.png)

### Checking the Status of Files

```git
$ git status

On branch master
nothing to commit, working directory clean
```

After creating new file `README.md`, if you run `git status`, you will get:

```git
$ git status

On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    README.md

nothing added to commit but untracked files present (use "git add" to track)
```

### Tracking New Files

To begin tracking the `README.md` file, you can run this:

```git
git add README.md
```

After running this comman, when you run `git status` again, you will see:

```git
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file: README.md
```

> You can tell that it’s staged because it’s under the Changes to be committed heading.

### Staging Modified Files

After changing the `test.py` file (already tracked), if you run `git status`, you will get something looks like this:

```git
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file: README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified: test.py
```

When the file appears under a section named `Changed but not staged for commit`, means that a file that is tracked has been modified in the working directory but not yet staged.

To stage this `test.py` file, let's run `git add` and then run `git status` again, you get:

```git
$ git add test.py
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file: README.md
    modified: test.py
```

But suppose you make a new change in `test.py` file and then you run `git status`:

```git
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file: README.md
    modified: test.py

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified: test.py
```

> Now `test.py` is listed as both staged and unstaged. How is that possible? It turns out that Git stages a file exactly as it is when you run the `git add` command. If you commit now, the version of `test.py` as it was when you last ran the `git add` command is how it will go into the commit, not the version of the file as it looks in your working directory when you run `git commit`. If you modify a file after you run `git add`, you have to run `git add` again to stage the latest version of the file:

```git
$ git add test.py
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file: README.md
    modified: test.py
```

### Short Status

You can get a short status if you run `git status -s` or `git status --short`:

```git
$ git status -s

 M README
MM Rakefile
A  lib/git.rb
M  lib/simplegit.rb
?? LICENSE.txt
```

`??` for new files that aren't tracked.

`A` for new files that have been added to the staging area.

`M` for modified files.

`MM` for modified, staged and then modifed again (both staged and unstaged).

### Ignoring Files

> Often, you’ll have a class of files that you don’t want Git to automatically add or even show you as being untracked.
> These are generally automatically generated files such as log files or files produced by your build system.
> In such cases, you can create a file listing patterns to match them named `.gitignore`. Here is an example `.gitignore` file:

```git
$ cat .gitignore

*.[oa]
*~
```

In first line tells Git to ignore any files ending in ".o" or ".a".
The second line tells Git to ignore all files that end with a tilde (~).

The rules for the patterns you can put in the `.gitignore` file are as follows:

* Blank lines o lines starting with `#` are ignored.
* Standard glob patterns work. (Glob patterns are like simplified regular expressions that shells use. Besides, you can also use two asterisks to match nested directories; `a/**/z` would match
`a/z`, `a/b/z`, `a/b/c/z`, and so on)
* You can end patterns with a forward slash (/) to specify a directory.
* You can negate a pattern by starting it with an exclamation point (!).

Here is another example of `.gitignore` file:

```git
# a comment - this is ignored
*.a       # no .a files
!lib.a    # but do track lib.a, even though you're ignoring .a files above
/TODO     # only ignore the root TODO file, not subdir/TODO
build/    # ignore all files in the build/ directory
doc/*.txt # ignore doc/notes.txt, but not doc/server/arch.txt
```

### Viewing Your Staged and Unstaged Changes

To see what you’ve changed but not yet staged, type git diff with no other arguments:

```git
git diff
```

To see what you’ve staged that will go into your next commit, you can use:

```git
git diff --staged
```

This command compares your staged changes to your last commit.

> It’s important to note that git diff by itself doesn’t show all changes made since your last commit—only changes that are still unstaged. This can be confusing, because if you’ve staged all your changes, git diff will give you no output.

To see what you’ve staged so far:

```git
git diff -cached
```

### Committing Your Changes

To commit your change, you use:

```git
git commit -m "Your message"
```

### Skipping the Staging Area

> Adding the `-a` option to the `git commit` command makes Git automatically stage every file that is already tracked before doing the commit, letting you skip the `git add` part:

```git
$ git status
On branch master
Changes not staged for commit:
 (use "git add <file>..." to update what will be committed)
 (use "git checkout -- <file>..." to discard changes in working directory)

   modified: benchmarks.rb

no changes added to commit (use "git add" and/or "git commit -a")

$ git commit -a -m "added new benchmarks"
[master 83e38c7] added new benchmarks
 1 file changed, 5 insertions(+), 0 deletions(-)
```

### Removing Files

> If you simply remove the file from your working directory, it shows up under the “Changed but not updated” (that is, unstaged) area of your `git status` output.
>
> Then, if you run `git rm`, it stages the file’s removal:

```git
$ git rm grit.gemspec
rm 'grit.gemspec'

$ git status
On branch master
Changes to be committed:
 (use "git reset HEAD <file>..." to unstage)

   deleted: grit.gemspec
```

> **Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area. In other words, you may want to keep the file on your hard drive but not have Git track it anymore. This is particularly useful if you forgot to add something to your .gitignore file and accidentally added it, like a large log file or a bunch of .a compiled files. To do this, use the `--cached` option**

```git
git rm --cached README.md
```

> You can pass files, directories, and file-glob patterns to the git rm command. That means you can do things such as:

```git
# Remove all files that have the `.log`extension in the `log/`directory
git rm log/\*.log

# Remove all files that end with ~
git rm \*~
```

### Moving Files (Rename Files)

> Unlike many other VCS systems, Git doesn’t explicitly track file movement. If you rename a file in Git, no metadata is stored in Git that tells it you renamed the file

If you want to rename a file in Git, you can run something like:

```git
git mv file_src file_dest
```

## Viewing the Commit History

To look back to see what has happened:

```git
git log
```

To show the difference introduced in each commit (in `git log`), you use `-p` flag and `-2` (limits the output to only the last two entries):

```git
git log -p -2
```

To see some abbreviated stats for each
commit, you can use the `--stat` option:

```git
git log --stat
```

To change the log output to formats other than the default:

```git
git log --pretty=oneline
```

In this, `oneline` option prints each commit on a single line, which is useful if you’re looking at a lot of commits. You can use other option, such as: `short`, `full`, and `fuller`.

Or use `--pretty` with your format:

```git

$ git log --pretty=format:"%h - %an, %ar : %s"

ca82a6d - Scott Chacon, 6 years ago : changed the version number
085bb3b - Scott Chacon, 6 years ago : removed unnecessary test
a11bef0 - Scott Chacon, 6 years ago : first commit
```

| Option        | Description of Output |
|:------------- |:-------------         |
| %H | Commit hash |
|%h | Abbreviated commit hash|
|%T | Tree hash|
|%t | Abbreviated tree hash|
|%P | Parent hash|
|%p | Abbreviated parent hash|
|%an | Author name|
|%ae | Author e-mail|
|%ad | Author date (format respects the –date= option|
|%ar | Author date, relative|
|%cn | Committer name|
|%ce | Committer e-mail|
|%cd | Committer date|
|%cr | Committer date, relative|
|%s | Subject         |

Table 2-1. Useful Options for git log --pretty=format

The oneline and format options are particularly useful with another log option called `--graph`. This option adds a nice little ASCII graph showing your branch and merge history:

```git
$ git log --pretty=format:"%h %s" --graph

* 2d3acf9 ignore errors from SIGCHLD on trap
* 5e3ee11 Merge branch 'master' of git://github.com/dustin/grit
|\
| * 420eac9 Added a method for getting the current branch.
* | 30e367c timeout code and tests
* | 5a09431 add timeout protection to grit
* | e1193f8 support for heads with slashes in them
|/
* d6016bc require time for xmlschema
* 11d191e Merge branch 'defunkt' into local
```

| Option        | Description |
|:------------- |:------------- |
|-p | Show the patch introduced with each commit.|
|--stat | Show statistics for files modified in each commit.|
|--shortstat | Display only the changed/insertions/deletions line from the --stat command.|
|--name-only | Show the list of files modified after the commit information.|
|--name-status | Show the list of files affected with added/modified/deleted information as well.|
|--abbrev-commit | Show only the first few characters of the SHA-1 checksum instead of all 40.|
|--relative-date | Display the date in a relative format (for example, “2 weeks ago”) instead of using the full date format.|
|--graph | Display an ASCII graph of the branch and merge history beside the log output.|
|--pretty | Show commits in an alternate format. Options include oneline, short, full, fuller, and format (where you specify your own format).|

### Limiting Log Output

```git
git log --since=2.weeks
```

> This command works with lots of formats—you can specify a specific date like "2008-01-15", or a relative date such as "2 years 1 day 3 minutes ago". And you also use `--until` option like `since`.

You also can filter the list to commits that match some search criteria, such as `--author` (filter on a specific author), `--grep` (search for keywords in the commit messages).

If you want to specify both options (option 1 **AND** option 2), you have to add `--all-match` or the command will match commits with either (option 1 **OR** option 2).

> Another really helpful filter is the -S option that takes a string and only shows the commits that introduced a change to the code that added or removed that string. For instance, if you wanted to find the last commit that added or removed a reference to a specific function, you could call:

```git
git log --Sfunction_name
```

| Option        | Description |
|:------------- |:------------- |
|-(n) Show only the last n commits
|--since, --after | Limit the commits to those made after the specified date|
|--until, --before | Limit the commits to those made before the specified date|
|--author | Only show commits in which the author entry matches the specified string|
|--committer | Only show commits in which the committer entry matches the specified string|
|--grep | Only show commits with a commit message containing the string|
|-S | Only show commits adding or removing code matching the string |

Table 2-3. Options to Limit the output of git log
