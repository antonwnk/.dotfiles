#!/usr/bin/env bash

# All hail the Primeagen ~~ https://github.com/ThePrimeagen/.dotfiles/blob/e1ed3a992503c703adb5a298463fa0fa365729b1/bin/.local/bin/tmux-cht.sh

selected=`cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
