#!/bin/bash

if [ -z "$1" ]; then
    echo "file to decrypt is not supplied"
fi

if [ -z "$2" ]; then
    openssl enc -d -aes-256-cbc -a -iter 5 -in "$1"
else
    if openssl enc -d -aes-256-cbc -a -iter 5 -in "$1" -out "$2"; then
        echo "decrypted file in: $2"
    fi
fi
