# Install and Config ZSH

## Install

* Ubuntu / Linux Mint: `sudo apt-get install zsh`

* Fedora: `sudo dnf install zsh`


## Install Oh-my-zsh

`sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Plugins

#### zsh-syntax-highlighting

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

#### zsh-autosuggestions

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

#### Active plugins

Active plugins in `~/.zshrc`:

`plugins=( [plugins...] zsh-syntax-highlighting zsh-autosuggestions)`

## Change to default

`chsh -s $(which zsh)`

> Log out and log in to see the change

## Change ZSH theme

### Install [Pure](https://github.com/sindresorhus/pure)

1. Install `nodejs`

2. Run `sudo npm install --global pure-prompt --allow-root --unsafe-perm=true`

3. Copy the following lines to `.zshrc` (after `source $ZSH/oh-my-zsh.sh`):

```bash
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure
```

4. Install colortheme [Tomorrow Night Eighties](gnome-terminal-tomorrow-night-eighties-256.sh)

5. Change `ZSH_THEME=""`

---

## Vim Statusline

### Install

* Ubuntu / Linux Mint: `sudo apt-get install powerline fonts-powerline`

* Fedora: `sudo dnf install powerline fonts-powerline`

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

### No highlight folder
Add `export LS_COLORS=$LS_COLORS:'ow=1;34:';` to `.zshrc` (for zsh) or `.bashrc` (for bash)

