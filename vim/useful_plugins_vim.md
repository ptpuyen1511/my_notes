# Some useful plugins for Vim

## coc.nvim

### Link to repo

Click [here](https://github.com/neoclide/coc.nvim)

### How to install

- Install Nodejs: using `conda`
- Install Yarn: using `curl --compressed -o- -L https://yarnpkg.com/install.sh | bash`
- Install Vim Plug:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- Install coc.nvim: copy this code to `.vimrc`:

```sh
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

```

Then, call: `:PlugInstall` to install `coc.nvim`

- Install coc extension:

```sh
:CocInstall coc-python coc-clangd coc-highlight coc-markdownlint
```

- Install clangd for Fedora:
```sh
sudo dnf install clang-tools-extra
```

- Auto select first suggestion: add the following code to `.vimrc`:

```bash
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
```




