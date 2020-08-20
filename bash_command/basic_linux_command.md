## TL;DR
This note collects some commands in Linux terminal


## Ref
[Ref for Loop part](https://devhints.io/bash)

## Key Takeaways
### List file
`ls -l` (list with details)
`ls -lh` (list with details which human can read easily)
`du -sh` (list with disk usage)

`ls -sh | head -n3` (with `|` is pipeline operator)

### Find file
`locate [file-name]` (líst all path having file-name in) (faster than `find` in some cases)

`find ~ -name '*.py'` (find all .py files in `/home`, we can replace `~ --> /` to find at root)
`find / -name '*python*'` (find all files with the word *python* in the name)
`find / -iname '*python*'` (same as above but case-insensitive)
`find / -regex '.*python.*\|.*\.py'` (regex match, find both .py files and files with the word "python" in the name)

Ref: [here](https://stackoverflow.com/a/5791657)

### View file
`cat file_name`

`head -n5 file_name` (-n5 --> 5 first lines, default=10)

`tail -n5 file_name`

`less file_name` (can interact with file, use page_down, down, q key)

### Change director
`cd /path/of/director` (cd /mnt/c)

`cd ~` go to /home/user

`cd -` go to the last director

### Create
`touch file_name` (create a file)

`mkdir folder_name` (create a folder)
`mkdir 'folder name'` (create a folder with whitespace in name)
`mkdir -p parent_folder/folder_name` (create folder with subfolder)

### Remove
`rm file_name` (remove file without ask)

`rm -i file_name` (remove file with ask)
--> Can change rm to rm -i by use `alias rm='rm -i'` (only in current section). If want to set alias as default, insert above command into `.bashrc` in /home/user

`rmdir` (remove empty directory only)

`rm -r folder_name` (`-r` means recursive)

`rm -rf` (-r = recursive and -f = force)

Remove all sub directories with name is 'folder-name':
```bash
rm -rf `find -type d -name [folder-name]`
```

### Copy
`cp file_source file_dest`

`cp file_source folder_dest` (copy source file to folder)
`cp file_source folder_dest/file_new_name` (copy source file to folder and rename to file_new_name)

`cp -r folder_source folder_dest` (copy folder)

### Move
`mv file_name file_new_name` (rename file)

Same copy but replace cp to mv

### Write stdout to file
`cat > file_name` (ctrl+d to exit) (delete all content and write new)
`cat >> file_name` (ctrl+d to exit) (append)

### WLS open file
*`explorer.exe file_name`* (to open file with defaut app)

### Diff
`diff file1 file2` (compare 2 files)

### Tac
`tac file`(display file upside-down)

### String quotes
```bash
NAME="Uyen"
echo "Hi $NAME" #=> Hi Uyen
echo 'Hi $NAME' #=> Hi $NAME
```

### Shell execution
```bash
echo "I'm in $(pwd)"
echo "I'm in `pwd`"

# They are same
```

### Loops
#### Basic for loop
```bash
for i in /etc/rc.*; do
   echo i
done
```

#### C-like for loop
```bash
for ((i = 0; i < 100; i++)); do
    echo $i
done
```

#### Ranges
```bash
for i in {1..5}; do
    echo "Welcome $i"
done

# With step size
for i in {5..50..5}; do
    echo "Welcome $i"
done
```

#### Reading lines
```bash
cat file.txt | while read line; do
    echo $line
done
```

#### Forever
```bash
while true; do
    ...
done
```

### Functions
#### Defining functions
```bash
my_func() {
    echo "hello $1"
}

# Same as above (alternate syntax)
function my_func() {
    echo "hello $1"
}

my_func "Uyen"
```

#### Return values
```bash
my_func() {
    local my_res='some value' # notice: no space between 2 sides of =
    echo $my_res
}

res="$(my_func)"
```

#### Raising errors
```bash
my_func() {
    return 1
}

if my_func; then
    echo "success"
else
    echo "failure"
fi
```

#### Arguments
`$#` - number of arguments

`$*` - all arguments

`$@` - all arguments, starting from first

`$1` - first argument

`$_` - last argument of the previous command

