# Python Debugger

## TL;DR

Some keyword when using %debug in Jupyter Notebook

## Kew Takeaways

### Start

`%debug` when using it to debug one line.
`%%debug` when using it debug one cell

### Keyword

#### Movement

1. `<ENTER>`: repeat the last command
2. n(ext): execute the current statement (step over)
3. s(tep): execute and step into function
4. r(eturn): continue execution until the current function returns
5. c(ontinue): continue execution until a breakpoint is encountered
6. u(p): move one level up in the stack trace
7. d(own): move one level down in the stack trace
8. until: continue execution until the end of a loop or until the set line
9. j(ump) numeline: set the next line that will be executed (local frame only)

#### Examine

1. p(rint): expr print the value of expr
2. pp: expr pretty-print the value of expr
3. w(here): print current position (including stack trace)
4. l(ist): list 11 lines of code around the current line
5. l(ist) first, last: list from first to last line number
6. a(rgs): print the args of the current function
7. ll: same list but more lines

#### Breakpoints

1. b(reak): show all breakpoints with its number
2. b(reak) 5: set a breakpoint at line 5
3. b(reak) 5, i==3: stop at breakpoint line 5 if Python condition holds
4. b(reak) a.py:5: set a breakpoint in file a.py at line 5
5. b(reak) abc: set a breakpoint at the first line of a func abc
6. tbreak 5: set a temporary breakpoint at 5, i.e. is removed when first hit
7. disable number: disable breakpoint number
8. enable number: enable breakpoint number
9. clear number: delete breakpoint number
