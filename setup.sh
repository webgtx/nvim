#!/bin/bash

# webgtx @ 2022
# https://github.com/webgtx
# https://webgtx.me

if [[ $1 = "--theme" ]] || [[ $1 = "-t" ]]; then
  printf "1) Onedark\n2) Oh-Lucy\n"
  read -p "[ Choose colorscheme from list ]: " colorscheme

  case "$colorscheme" in
    1)  
      echo "require('onedark').load()" > ./nvim/lua/colorscheme.lua
    ;;
    2)
      echo "vim.cmd[[colorscheme oh-lucy]]" > ./nvim/lua/colorscheme.lua
    ;;
    *)
      echo "Undefined colorscheme, try something else"
    ;;
  esac

elif [[ $1 = "--packer" ]] || [[ $1 = "-p" ]]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

elif [[ $1 == "--install" ]] || [[ $1 == "-i" ]]; then 
  echo "Setting up onedark colorscheme by default..."
  echo "require(onedark).load()" > ./nvim/lua/colorscheme.lua

  if [[ -f "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]]; then
    . ./setup.sh -p & 
  else
    echo "packer has already been installed"
  fi

  cp -r nvim $HOME/.config

elif [[ $1 == "" ]]; then
  cat ./.data/help.dat 
fi

