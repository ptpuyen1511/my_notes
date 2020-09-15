# Mardown to PDF

## TL;DR

Some tutorial for convert Markdown to PDF.

## Keyword Takeaways

### Dependencies

1. Ubuntu

- Install Pandoc: `sudo apt-get install pandoc`

- Install PDF machine: `sudo apt-get install texlive-latex-base texlive-fonts-recommended texlive-extra-utils texlive-latex-extra`

2. Fedora

- Update later

### Command

`pandoc -s -o [outfile].pdf [markdown-file].md`

Where:
- `-s`: `standard`

- `-o`: `output`

- `[outfile].pdf`: file output with PDF format

- `[markdown-file].pdf`: file input with Markdown format

