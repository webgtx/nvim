#!/bin/bash

# webgtx @ 2022
# https://github.com/webgtx
# https://webgtx.me

set_colorscheme() {
  echo "vim.cmd[[colorscheme $1]]" > ./nvim/lua/colorscheme.lua
}

if [[ $1 = "--theme" ]] || [[ $1 = "-t" ]]; then
  printf "1) Onedark\n2) Oh-Lucy\n3) Adwaita\n4) Tokyodark\n5) Github\n"
  read -p "[ Choose colorscheme from list ]: " colorscheme

  case "$colorscheme" in
    1)  
      set_colorscheme onedark 
    ;;
    2)
      set_colorscheme oh-lucy
    ;;
    3)
      set_colorscheme adwaita
    ;;
    4)
      set_colorscheme tokyodark
    ;;
    5)
      set_colorscheme github_*
    ;;
    *)
      echo "Undefined colorscheme, try something else"
    ;;
  esac

elif [[ $1 = "--packer" ]] || [[ $1 = "-p" ]]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

elif [[ $1 == "--install" ]] || [[ $1 == "-i" ]]; then 
  echo "Setting up colorscheme..."
  if [[ -f "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]]; then
    . ./setup.sh -p & 
  else
    echo "packer has already been installed"
  fi

  cp -r nvim $HOME/.config

elif [[ $1 == "" ]]; then
  cat ./.data/help.dat 
fi

