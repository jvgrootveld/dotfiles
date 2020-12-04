#!/bin/sh

# Stops the execution of a script if a command or pipeline has an error
set -e


SESSION_NAME=jvg

# Attach if session already exist
if tmux has-session -t $SESSION_NAME 2> /dev/null; then
    tmux attach -t $SESSION_NAME
    exit
fi

# Create new session with name and a window named `Root`
WINDOW_NAME=Root
tmux new-session -d -s $SESSION_NAME -n $WINDOW_NAME

# 1. Main windows: vim for VimWiki
tmux send-keys -t $SESSION_NAME:$WINDOW_NAME "nvim" Enter

# 2 Infra window for docker
WINDOW_NAME=Infra
tmux new-window -t $SESSION_NAME -n $WINDOW_NAME
tmux send-keys -t $SESSION_NAME:$WINDOW_NAME "cd ~/work/bop/_repos/bvmop-infra" Enter
tmux split-window -t $SESSION_NAME:$WINDOW_NAME -v -c "$PWD/bvmop-infra"
tmux split-window -t $SESSION_NAME:$WINDOW_NAME.bottom -h -c "$PWD/bvmop-infra"
tmux resize-pane -t $SESSION_NAME:$WINDOW_NAME.top -y 25

# 3 Shell: General shell use
WINDOW_NAME=Shell
tmux new-window -t $SESSION_NAME -n $WINDOW_NAME

# Attach
tmux attach -t $SESSION_NAME:Infra.bottom-right
