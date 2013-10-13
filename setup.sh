#!/usr/bin/env bash

cd $(dirname $0)

for dotfile in .?*; do
    echo $dotfile | grep -E '^(\.\.|\.git|\.gitignore|\.gitmodules)$' > /dev/null
    if [ $? -eq 1 ]; then
        if [ ! -f $HOME/$dotfile ]; then
            ln -sv "$PWD/$dotfile" $HOME
        else
            echo "$HOME/$dotfile already exists (skipped)"
        fi
    fi
done
