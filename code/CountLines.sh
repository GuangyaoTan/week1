#!/bin/bash
if [[ $# -ne 1 ]]; then printf 'Usage: %s file\n' "$0" >&2; exit 2; fi
if [[ ! -r "$1" ]]; then printf 'Cannot read: %s\n' "$1" >&2; exit 1; fi
NumLines=$(wc -l < "$1")
echo "The file $1 has $NumLines lines"