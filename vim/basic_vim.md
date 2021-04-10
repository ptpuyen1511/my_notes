# Basic Vim

This is cheat sheet from https://vim.rtorr.com/

I just customize for myself

## Cursor movement

`h` - move left

`j` - move down

`5j` - move down 5 lines

`k` - move up

`5k` - move up 5 lines

`l` - move right

---

`w` - jump forward to start word

`Shift + w` - jump forward to start word (contain punctuation)

`e` - jump forward to end word

`Shift + e` - jump forward to end word (contain punctuation)

`b` - jump backward to start word 

`Shift + b` - jump backward to start word (contain punctuation)

`t"` - jump to right before the next quotes

`f"` - jump and land on the next quotes

`%` - move to matching character (default supported pairs: '()', '{}', '[]')

---

`)` - move forward one sentence

`}` - move forward one paragraph

---

`0` - jump to start of line

`^` - jump to first non-blank character of line

`$` - jump to end of line

`g_` - jump to last non-blank character of line

---

`gg` - go to first line of doc

`Shift + g` - go to last line of doc

`5gg` - go to line 5

---

`}` - jump to next paragraph (or function/block when editing code)

`{` - jump to previous paragraph (or function/blocl when editing code)

---

`Ctrl + e` - move screen down one line

`Ctrl + y` - move screen up one line

`Ctrl + b` - move back one full screen (one page)

`Ctrl + f` - move forward one full screen (one page)

`Ctrl + u` - move back 1/2 screen

`Ctrl + d` - move forward 1/2 screen 

## Insert mode - inserting/appending text

`i` - insert before the cursor

`Shift + i` - insert at the beginning of line

`a` - insert (append) after the cursor

`Shift + a` - insert (append) at the end of line

`o` - append (open) a new line below current line

`Shift + o` - append (open) a new line above current line

`ea` - insert (append) at the end of word

---

`Ctrl + h` - delete char before cursor

`Ctrl + w` - delete word before cursor

`Ctrl + j` - begin new line

`Ctrl + t` - indent (move right) line one shiftwidth

`Ctrl + d` - de-indent (move left) line one shiftwidth

`Ctrl + n` - insert (auto-complete) next match before the cursor

`Ctrl + p` - insert (auto-complete) previous match before the cursor

---

`:1,$d` - delete all lines in file

---

`Esc` - exit insert mode

## Editing

`r` - replace single char

`Shift + j` - join line below the current one with one space in between

`g Shift + j` - join line below the current one without space in between

`gwip` - reflow paragraph

`g~` - switch case up to motion

`gu` - change to lowercase up to motion

`g Shift + u` - change to uppercase up to motion

`cc` - change (replace) entire line

`Shift + C` - change (replace) to the end of line

`c$` - change (replace) to the end of line

`ciw` - change (replace) entire word

`cw` - change (replace) to the end of word

`s` - delete char and substitute text

`Shift + s` - delete line and substitute text (same as cc)

`xp` - transpose two letters (delete and paste)

`u` - undo

`Shift + u` - restore (undo) last changed line

`Ctrl + r` - redo

`.` - repeat last command

## Marking text (visual mode)

`v` - start visual mode, mark lines, then do a command (like y-yank)

`Shift + v` - start linewise visual mode

---

`o` - move to other end of marked area

`Ctrl + v` - start visual block mode

`Shift + o` - move to other corner of block

---

`aw` - mark a word

`ab` - a block with ()

`a Shift + b` - a block with {}

`at` - a block with <> tags

`ib` - inner block with ()

`i Shift + b` - inner block with {}

`it` - inner block with <> tags

---

`<Ecs>` - exit visual mode

Tips: Instead of `b` or `B`, can also use `(` or `{`.

## Visual commands

`>` - shift text right

`<` - shift text left

`y` - yank (copy) marked text

`d` - delete marked text

`~` - switch case

`u` - change marked text to lowercase

`U` - change marked text to uppercase

## Registers

`:reg` - show registers content

`"xy` - yank into register x (ex: `"0y`)

`"xp` - paste contents of register x (ex: `"0p`)

`:%y+` - yank into the system clipboard register (requirement: 'vim-gtk') (no need visual mode)

`"+y` - yank into the system clipboard register (requirement: 'vim-gtk') (need visual mode)

`"+p` - paste from the system clipboard register

## Marks and positions

`:marks` - list of marks

`ma` - set current position for mark A

``a` - jump to position of mark A

`y`a` - yank text to position of mark A

---

`0 - go to the position where Vim was previously exited

`" - go to the position when last editing this file

`. - go to the position of the last change in this file

`` - go to the position before the last jump

---

`:ju[mps]` - list of jumps

`Ctrl + i` - go to newer position in jump list

`Ctrl + o`- go to older position in jump list

`:changes` - list of changes

`g,` - go to newer position in change list

`g;` - go to older position in change list

`Ctrl + ]`- jump to the tag under cursor

## Macros

`qa` - record macro a

`q` - stop record macro

`@a` - run macro a

`@@` - rerun last run macro

## Cut and paste

`yy` - yank (copy) a line

`2yy` - yank (copy) 2 lines

`yw` - yank (copy) the characters of the word from the cursor position to the start of the next word

`y$` - yank (copy) to end of line

---

`p` - put (paste) the clipboard after cursor

---

`dd` - delete (cut) a line

`2dd` - delete (cut) 2 lines

`dw` - delete (cut) the characters of the word from the cursor position tothe start of the next word

`Shift + d` - delete (cut) to the end of the line

`d$` - delete (cut) to the end of the line

`x` - delete (cut) character

## Indent text

`>>` - indent (move right) line one shiftwidth

`<<` - de-indent (move left) line one shiftwidth

`>%` - indent a block with () or {} (cursor on brace)

`>ib` - indent inner block with ()

`>at` - indent a block with <> tags

`3==` - re-indent 3 lines

`=%` - re-indent a block with () or {} (cursor on brace)

`=i Shift+b` - indent inner block with {}

`gg= Shift+g` - re-indent entire buffer

`]p` - paste and adjust indent to current line

## Exiting

`:w` - write (save) the file, but don't exit

`:w !sudo tee %` - write out the current file using sudo

`:wq` or `:x` or `Shift+z Shift+z` - write (save) and quit

`:q` - quit (fails if there are unsaved changes)

`:q!` or `Shift+z Shift+q` - quit and throw away unsaved changes

`:wqa` - write (save) and quit on all tabs

## Search and replace

`/pattern` - search for pattern

`?pattern` - search backward for pattern

`\vpattern` - 'very magic' pattern: non-alphanumeric characters are interpreted as special regex symbols (no escaping needed)

`n` - repeat search in same direction

`Shift+n` - repeat search in opposite direction

---

`:%s/old/new/g` - replace all old with new throughout file

`:%s/old/new/gc` - replace all old with new throughout file with confimations

`:noh[lsearch]` - remove highlighting of search matches

## Search in multiple files

`:vim[grep] /pattern/ {`{file}`}` - search for pattern in multiple files
    e.g `:vim[grep] /foo/ **/*`

`:cn[ext]` - jump to the next match

`:cp[revious]` - jump to the previous match

`:cope[n]` - open a windows containing the list of matches

## Working with multiple files

`:e[dit] file` - edit a file in a new buffer

`:bn[next]` - go to the next buffer

`:bp[revious]` - go to the previous buffer

`:b#` - go to buffer by #

`:b file` - go to a buffer by file

`:ls` - list all open buffers

---

`:sp[lit] file` - open a file in new buffer and split windows

`:vs[plit] file` - open a file in new buffer and vertically split windows

`:vert[ical] ba[ll]` - edit all buffers as vertical windows

`:tab ba[ll]` - edit all buffers as tabs

`vim -p file1 file2 file3` - open all file listed as tabs

`:tab ter[minal]` or `:terminal` - open terminal as a tab (to go to terminal-normal mode: add `:tnoremap <Esc> <C-\><C-n>` to `vimrc` file)

`gt` - go to next tab

`gT` - go to previous tab

---

`Ctrl + ws` - split window

`Ctrl + wv` - split window vertically

`Ctrl + ww` - switch windows

`Ctrl + wq` - quit a window

`Ctrl + wx` - exchange current window with next one

`Ctrl + w=` - make all windows equal height & width

`Ctrl + wh` - move cursor to the left window (vertical split)

`Ctrl + wl` - move cursor to the right window (vertical split)

`Ctrl + wj` - move cursor to the window below (horizontal split)

`Ctrl + wk` - move cursor to the window above (horizontal split)

