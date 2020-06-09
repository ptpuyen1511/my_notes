# Basic Vim

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

`%` - move to matching character (default supported pairs: '()', '{}', '[]')

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
