# New PC/Laptop Setup

# Step 1: User Accounts
- Create two user accounts:
    - `admin`
    - `stduser`: This will be linked to Microsoft account

# Step 2: Web Browsers:
- Install Chrome beside the Edge
- Sync browser data

# Step 3: Install VSCode
- Install VSCode
- Sign in with a GitHub account to sync settings and extensions

# Step 4: Windows Terminal + Powertoy
- Tomorrow Night Eighties theme:
    ```
    {
      "name": "Tomorrow Night Eighties",
      "black": "#000000",
      "red": "#f2777a",
      "green": "#99cc99",
      "yellow": "#ffcc66",
      "blue": "#6699cc",
      "purple": "#cc99cc",
      "cyan": "#66cccc",
      "white": "#ffffff",
      "brightBlack": "#000000",
      "brightRed": "#f2777a",
      "brightGreen": "#99cc99",
      "brightYellow": "#ffcc66",
      "brightBlue": "#6699cc",
      "brightPurple": "#cc99cc",
      "brightCyan": "#66cccc",
      "brightWhite": "#ffffff",
      "background": "#2d2d2d",
      "foreground": "#cccccc",
      "selectionBackground": "#515151",
      "cursorColor": "#cccccc"
    }
    ```

# Step 5: C/C++
- Follow the guide at ⁦https://code.visualstudio.com/docs/cpp/config-mingw⁩ to install the necessary tools for C/C++ development using MinGW.

# Step 6: Windows Subsystem for Linux (WSL)
- Refer to the official guide at ⁦https://learn.microsoft.com/en-us/windows/wsl/install⁩ to set up WSL.

# Step 7: Z Shell (zsh) and Vim
- Follow the steps in [here](linux_tips/install_zsh.md)
- Sample [.zshrc](linux_tips/.zshrc)
- Sample [.vimrc](linux_tips/.vimrc)
- Starship config ([starship.toml](linux_tips/starship.toml)) should be in `~/.config/`
- Remove conda environment from prompt: `conda config --set changeps1 False`

# Step 8: C/C++ and Python in WSL
- C/C++:
    - `sudo apt-get update && sudo apt-get install build-essential`
- Python:
    - Follow the guide at https://docs.anaconda.com/miniconda/install/
    - Install environment:
        - [min_ds_py313-env.yml](linux_tips/min_ds_py313-env.yml)
        - `conda env create -f min_ds_py313-env.yml`
     
# Other packages
- `qpdf`
    - Install: `sudo add-apt-repository ppa:qpdf/qpdf` -> `sudo apt-get install qpdf`
    - Usage: `qpdf --encrypt [readpass] [ownerpass] 256 -- [infile].pdf [outfile].pdf`
- `batcat`: `sudo apt-get install bat`
- `tree`: `sudo apt-get install tree`
- `fzf`
    - Install: `sudo apt-get install fzf`
    - Put the following commands into `.zshrc`:
        - `source /usr/share/doc/fzf/examples/key-bindings.zsh` (read from `apt show fzf`)
        - `source /usr/share/doc/fzf/examples/completion.zsh` (read from `apt show fzf`)
        - `export FZF_DEFAULT_OPTS='--height 70% --layout reverse --border'` (to set default display)
        - Some aliases:
            - `alias fdp="find . -type d | fzf --preview='tree -C {}'"` (fzf directory preview)
            - `alias ffp="find . -type f | fzf --preview='batcat --theme=Dracula --style=numbers,grid --color=always {}'"` (fzf file preview)
    - Some commands to preview:
        - `find . -name '*.md' | fzf --preview='batcat --theme=Dracula --style=numbers,grid --color=always {}'`
        - `find . -type f | fzf --preview='batcat --theme=Dracula --style=numbers,grid --color=always {}'`
        - `find . -type d | fzf --preview='tree -C {}'`
    - Some useful commands:
        - `cd $(find . -type d | fzf --preview='tree -C {}')` (cd after previewing folders)
        - `vim $(find . -type f | fzf --preview='batcat --theme=Dracula --style=numbers,grid --color=always {}')` (open vim after previewing files)
        - `cd **`
        - `vim **`
     
    
