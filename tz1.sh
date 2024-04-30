#!/bin/bash
input_dir="$1"
output_dir="$2"
find "$input_dir" -type f | while read file; do
    base=$(basename "$file")
    if [ -f "$output_dir/$base" ]; then
        extension="${base##*.}"
        filename="${base%.*}"
        i=1
        while [ -e "$output_dir/$filename-$i.$extension" ]; do
            let i++
        done
        cp "$file" "$output_dir/$filename-$i.$extension"
    else
        cp "$file" "$output_dir/$base"
    fi
done
echo "Все файлы были скопированы"
