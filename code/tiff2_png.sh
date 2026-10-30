#!/bin/bash

if command -v magick >/dev/null 2>&1; then
  convert_cmd=(magick)
elif command -v convert >/dev/null 2>&1; then
  convert_cmd=(convert)
else
  printf 'ImageMagick (magick or convert) not found\n' >&2
  exit 3
fi

for filename in *.tif
do
  [[ -e "$filename" ]] || { printf 'No .tif files here\n' >&2; exit 1; }
  echo "Converting $filename"
  convert "$filename" "$(basename "$filename" .tif).png"
done