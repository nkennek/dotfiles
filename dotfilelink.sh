#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
  echo Mac
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
  ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
  ln -sf ~/dotfiles/.zshrc ~/.zshrc
  ln -sf ~/dotfiles/.zshrc.Darwin ~/.zshrc.Darwin
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo Not Windows Compatible
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo Linux
  ln -sf ~/dotfiles/.vimrc.tiny ~/.vimrc
  ln -sf ~/dotfiles/.tmux.linux.conf ~/.tmux.conf
  ln -sf ~/dotfiles/.zshrc ~/.zshrc
else
  echo Unknown OS
fi
