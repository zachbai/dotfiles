#!/bin/bash

make_link () {
  local src=$1
  local target=$2
  if [ -L $target ]
    then
      echo "Symlink at ${target} already exists."
  elif [ -d $target ] 
    then
      echo "Not creating symlink for ${src}. Directory ${target} already exists."
      return 1
  else
    echo "Creating symlink from ${src} to ${target}"
    ln -fs $src $target
  fi
  return 0
}

NVIM_CONFIG_PATH="${HOME}/.config/nvim"

if [ ! -d $NVIM_CONFIG_PATH -a ! -L $NVIM_CONFIG_PATH ]
  then
    mkdir $HOME/.config/nvim
fi

CURRENT_DIRECTORY=$(pwd)

make_link $CURRENT_DIRECTORY/shell $HOME/shell
make_link $CURRENT_DIRECTORY/zshrc $HOME/.zshrc
make_link $CURRENT_DIRECTORY/tmux.conf $HOME/.tmux.conf
make_link $CURRENT_DIRECTORY/tmux $HOME/.tmux
make_link $CURRENT_DIRECTORY/vimrc $HOME/.vimrc
make_link $CURRENT_DIRECTORY/vim $HOME/.vim
make_link $CURRENT_DIRECTORY/init.vim $HOME/.config/nvim/init.vim
