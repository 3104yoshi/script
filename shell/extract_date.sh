#!/bin/bash

echo "Extracting dates from filenames : format YYYY-MM-DD"

pattern_with_hyphen="([0-9]{4}-[0-9]{2}-[0-9]{2})"

for file in data/*
do
    if [[ $file =~ $pattern_with_hyphen ]]; then
        date=${BASH_REMATCH[1]}
        echo "$file: $date"
    fi
done


echo "Extracting dates from filenames : format YYYYMMDD"

pattern="([0-9]{4}[0-9]{2}[0-9]{2})"

for file in data/*
do
    if [[ $file =~ $pattern ]]; then
        date=${BASH_REMATCH[1]}
        echo "$file: $date"
    fi
done
