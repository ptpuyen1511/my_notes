# Install and Config ZSH

## Install

`sudo apt-get install zsh`

`sudo dnf install zsh`


## Install Oh-my-zsh

`sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`


## Change to default

`chsh -s $(which zsh)`

> Log out and log in to see the change


## Vim Statusline

### Install

`sudo apt-get install powerline fonts-powerline`

`sudo dnf install powerline fonts-powerline`

`pip install powerline-status`

### Change in .vimrc file

```bash
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256
```
