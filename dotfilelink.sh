#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
  echo Mac
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
  ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo Not Windows Compatible
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo Linux
  ln -sf ~/dotfiles/.vimrc.tiny ~/.vimrc
  ln -sf ~/dotfiles/.tmux.linux.conf ~/.tmux.conf
else
  echo Unknown OS
fi
