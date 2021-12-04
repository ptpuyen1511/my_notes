# Create Password for PDF Files

- Install `qpdf`:
    - Ubuntu: `sudo apt-get install qpdf`
    - Fedora: `sudo dnf install qpdf`
- Using the command: `qpdf --encrypt [readpass] [ownerpass] 256 -- [infile].pdf [outfile].pdf`

