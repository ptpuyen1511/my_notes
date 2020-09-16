# Mardown to PDF

## TL;DR

Some tutorial for convert Markdown to PDF.

## Keyword Takeaways

### Using Pandoc

#### Dependencies

1. Ubuntu

- Install Pandoc: `sudo apt-get install pandoc`

- Install PDF machine: `sudo apt-get install texlive-latex-base texlive-fonts-recommended texlive-extra-utils texlive-latex-extra`

2. Fedora

- Update later

#### Command

`pandoc -s -o [outfile].pdf [markdown-file].md`

Where:
- `-s`: `standard`

- `-o`: `output`

- `[outfile].pdf`: file output with PDF format

- `[markdown-file].pdf`: file input with Markdown format

### Using grip and browser (the best to me)

#### Dependencies

- Install Python

- Install GRIP (Github README Instant Preview): `pip install grip`

#### Command

`grip [markdown-file].md --export [temp-file].html`

`vim [temp-file].html`

Delete this code block:

```vim
<h3>
    <span class="octicon octicon-book"></span>
    [markdown-file].md
</h3>
```

<img src="https://latex.codecogs.com/gif.latex?\to" /> Open with browser and use Print feature to save pdf. 

**Note that: in `more settings`, make sure that `Background graphics` is checked**
