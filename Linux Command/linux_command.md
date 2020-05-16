## TL;DR
This note collects some commands in Linux terminal

## Key Takeaways
### List file
`ls -l` (list with details)
`ls -lh` (list with details which human can read easily)
`du -sh` (list with disk usage)

`ls -sh | head -n3` (with `|` is pipeline operator)

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

`rm -r folder_name` (`-r` means recursive)

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
