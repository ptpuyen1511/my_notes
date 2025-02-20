#!/bin/bash
# Pad file names with leading zeros
for i in {1..9}; do # 9 or more
    old_name="ss$i.md"
    new_name=$(printf "ss%02d.md" "$i")
    mv "$old_name" "$new_name"
done
