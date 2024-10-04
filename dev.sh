#!/bin/sh

DIR=$1

if [ ! -d "$DIR" ]; then
	echo "Enter a valid direcory."
	exit 1
fi

tmux new-session -d -s dev -c $DIR

tmux new-window -t dev:1 -n 'dev'    -c $DIR
tmux new-window -t dev:2 -n 'run'    -c $DIR 
tmux new-window -t dev:3 -n 'ssh'    -c $DIR 
tmux new-window -t dev:4 -n 'sftp'   -c $DIR 
tmux new-window -t dev:5 -n 'docker' -c $DIR

tmux -2 attach-session -d -t dev
