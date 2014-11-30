#!/bin/bash

if [ $# -lt 1 ]; then
  echo Usage: ssh-tmux HOST >&2
  exit 1
fi

HOST=$1
exec ssh -t -A $HOST sh -c ':
TMUX_BIN=tmux
[ -x ./bin/tmux -o -L ./bin/tmux ] && TMUX_BIN=./bin/tmux

SOCK=~/.ssh/ssh-agent-$USER
if [ ! -z "$SSH_AUTH_SOCK" ] && [ $SSH_AUTH_SOCK != $SOCK ]; then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

if $TMUX_BIN list-sessions >/dev/null 2>&1; then
    exec $TMUX_BIN -CC attach
else
    exec $TMUX_BIN -CC
fi
'
