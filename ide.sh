#!/bin/zsh
tmux new-session \; split-window -h -c "#{pane_current_path}"\; split-window -v -c "#{pane_current_path}"\; split-window -v -c "#{pane_current_path}"
