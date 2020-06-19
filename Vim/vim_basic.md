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

`"+y` - yank into the system clipboard register

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

