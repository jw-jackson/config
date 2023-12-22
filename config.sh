#!/bin/bash
echo "start config"
if [ "$1" -eq 1 ]; then
    ./neovimNoNerdFont/config.sh
else
    ./neovim/config.sh
fi
./tmux/config.sh
echo "end config"






