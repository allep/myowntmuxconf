#!/bin/bash

SESSION_NAME="$1"
WORKSPACE="$2"

tmux has-session -t $SESSION_NAME

if [[ $? != 0 ]]; then
    tmux new -s $SESSION_NAME -n nvim -d
    tmux send-keys -t $SESSION_NAME "cd $WORKSPACE" C-m
    tmux send-keys -t $SESSION_NAME "nvim" C-m
    tmux new-window -n terminal -t $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:1 "cd $WORKSPACE" C-m
    tmux new-window -n knowledge -t $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:2 "cd /media/workspace/workspace/knowledge_wiki" C-m
    tmux send-keys -t $SESSION_NAME:2 "nvim" C-m
    tmux select-window -t $SESSION_NAME:0
fi

tmux attach -t $SESSION_NAME

