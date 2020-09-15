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

### Using grip

#### Dependencies

`pip install grip`

#### Command

`grip [markdown-file].md`

After browser renders markdown file, just use `print` to save pdf file.

