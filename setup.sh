#!/usr/bin/env bash

cd $(dirname $0)

for dotfile in .?*; do
    if [ $dotfile != ".." -a $dotfile != ".git" ]; then
        if [ ! -f $HOME/$dotfile ]; then
            ln -sv "$PWD/$dotfile" $HOME
        else
            echo "$HOME/$dotfile already exists (skipped)" 2>&1
        fi
    fi
done
