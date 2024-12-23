" Set theme ---
set background=dark
colorscheme modified-molokai

" Set tabline ---
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Set line number ---
set number relativenumber
set nu rnu

" Set list to display the eol char ---
" set list
" set lcs=eol:$

" Change cursor shape in Windows Terminal ---
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if &term =~ '^xterm'
   " enter vim
   autocmd VimEnter * silent !echo -ne "\e[2 q"
   " normal mode
   let &t_EI .= "\<Esc>[2 q"
   " insert mode
   let &t_SI .= "\<Esc>[5 q"
   " leave vim
   autocmd VimLeave * silent !echo -ne "\e[3 q"
endif
