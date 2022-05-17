#!/usr/bin/bash

if grep "string" ~/c/tmp.txt > /dev/null; then
    echo "grep found string"
fi
