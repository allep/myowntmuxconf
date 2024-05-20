#!/bin/bash

tmux has-session -t development
if [[ $? != 0 ]]; then
    tmux new -s development -n vim -d
    tmux send-keys -t development 'cd ~/workspace/' C-m
    tmux send-keys -t development 'vim' C-m
    tmux new-window -n terminal -t development
    tmux send-keys -t development:1 'cd ~/workspace/' C-m
    tmux select-window -t development:0
fi

tmux attach -t development

