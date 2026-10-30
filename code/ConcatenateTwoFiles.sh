#!/bin/bash
if [[ $# -ne 3 ]]; then printf 'Usage: %s in1 in2 out\n' "$0" >&2; exit 2; fi
for f in "$1" "$2"; do
  [[ -r "$f" ]] || { printf 'Cannot read: %s\n' "$f" >&2; exit 1; }
done
if [[ "$3" -ef "$1" || "$3" -ef "$2" ]]; then
  printf 'Output must differ from both inputs\n' >&2; exit 1
fi
cat "$1" > "$3"
cat "$2" >> "$3"
echo "Merged File is"
cat "$3"
