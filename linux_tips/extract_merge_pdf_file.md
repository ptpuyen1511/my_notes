# Extract some pages

```bash
qpdf [original-file].pdf --pages . [start]-[end] -- [outfile].pdf
```

# Merge pdf files

```bash
qpdf --empty --pages [file1].pdf [file2].pdf -- [merged-outfile].pdf
```

We can merge multiple files.
