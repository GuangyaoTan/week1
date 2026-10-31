#!/bin/bash
# Author: Guangyao Tan, gt1024@ic.ac.uk
# Script: tabtocsv.sh
# Desc: substitute the tabs in the files with commas
#       saves the output into a .csv file
# Arguments: 1-> tab delimited file
# Date: Oct 2026
if [ "$#" -ne 1 ]; then
    echo "Error: please provide exactly one input file" >&2
    exit 1
fi

if [ ! -f "$1" ] || [ ! -r "$1" ]; then
    echo "Error: invalid or unreadable input file" >&2
    exit 1
fi

# Resolve results relative to this script, independently of the working directory.
script_dir=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd) || exit 1
results_dir="$script_dir/../results"
if ! mkdir -p "$results_dir"; then
    echo "Error: could not create output directory" >&2
    exit 1
fi

output="$results_dir/$(basename -- "$1").csv"
if tr '\t' ',' < "$1" > "$output"; then
    echo "Done! $output"
else
    echo "Error: conversion failed" >&2
    exit 1
fi
