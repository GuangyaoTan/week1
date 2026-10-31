#!/bin/bash

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

output="$results_dir/$(basename -- "$1").txt"
if tr ',' ' ' < "$1" > "$output"; then
    echo "Done! $output"
else
    echo "Error: conversion failed" >&2
    exit 1
fi
