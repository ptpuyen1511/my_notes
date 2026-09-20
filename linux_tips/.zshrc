# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract z zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls="clear"
alias rm="rm -i"
alias lssbn="ls -ao -lh -c"
alias lssbt="ls -ao -lh -ct"
alias lssbs="ls -ao -lh -S"
alias bcat="bat --theme=Dracula --style=numbers,grid --color=always"
alias dirsize="du -sh *(D) | sort -rh"

# No highlight directors
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Activate starship
eval "$(starship init zsh)"

alias gitlf="git log --all --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset'"
alias ta="tmux new-session -As"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS='--height 70% --layout reverse --border'
export FZF_CTRL_T_COMMAND="find . \( -name .git -o -name .venv \) -prune -o -type f -print"
export FZF_CTRL_T_OPTS="--preview '
    if [ -d {} ]; then
        tree -C {} 2>/dev/null || ls -F --color=always {}
    else
        batcat --theme=Dracula --style=numbers,grid --color=always {} 2>/dev/null || cat {}
    fi'"
_fzf_compgen_path() {
    find "$1" \( -name .git -o -name .venv \) -prune -o -type f -print
}
_fzf_compgen_dir() {
    find "$1" \( -name .git -o -name .venv \) -prune -o -type d -print
}
export FZF_COMPLETION_OPTS="--preview '
    if [ -d {} ]; then
        tree -C {} 2>/dev/null || ls -F --color=always {}
    else
        batcat --theme=Dracula --style=numbers,grid --color=always {} 2>/dev/null || cat {}
    fi'"

fdp() {
    find . -type d | fzf --preview='tree -C {}'
}

ffp() {
    find . -type f | fzf --preview='batcat --theme=Dracula --style=numbers,grid --color=always {}' --preview-window=wrap
}

# Helper function that picks a file/folder, clears the prompt, and populates the line
_fzf_populate() {
    local cmd="$1"
    local picker="$2"
    local target
    target=$($picker)

    if [[ -n "$target" ]]; then
        # Moves cursor up 3 lines and erases down to overwrite the two-line prompt + 1 line empty
        printf '\e[3A\e[0J'
        print -z "$cmd ${(q)target}"
    fi
}

nvf() { _fzf_populate "nvim"   ffp; }
vf()  { _fzf_populate "vim"    ffp; }
export BAT_THEME="Dracula"
bcf() { _fzf_populate "batcat" ffp; }
cdf() { _fzf_populate "cd"     fdp; }


# For tmux setting-----------------------------------------------------------------------
# Function to set blinking underline cursor
set_blinking_underline() {
  printf '\e[3 q'
}

# Define tmux as a function that wraps the real tmux command
tmux() {
  # Run the real tmux command with all arguments
  command tmux "$@"

  # Set cursor after tmux exits/completes
  set_blinking_underline
}

# Set cursor when already inside tmux
if [[ -n "$TMUX" ]]; then
  set_blinking_underline
fi

# Set cursor when shell starts
set_blinking_underline
#----------------------------------------------------------------------------------------
