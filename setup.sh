#!/bin/bash

# webgtx @ 2022
# https://github.com/webgtx
# https://webgtx.me

set_colorscheme() {
  if [[ ! -d ~/config/nvim/lua ]]; then
    echo "vim.cmd[[colorscheme $1]]" > ~/.config/nvim/lua/colorscheme.lua
  fi
}

echo "[ Setup script started ]"
echo "[ Installing neovim directory ... ]"
cp -r ./nvim $HOME/.config

for arg in $@; do
  case "$arg" in
    "--help"|"-h")
      cat .data/help.dat
    ;;
    "--theme"|"-t")
      printf "1) Onedark\n2) Oh-Lucy\n3) Adwaita\n4) Tokyodark\n5) Github\n0) Default (transparent)\n"
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
        0)
          cat /dev/null > $HOME/.config/nvim/lua/colorscheme.lua  
        ;;
        *)
          echo "Undefined colorscheme, try something else"
        ;;
      esac
    ;;
    "--clear"|"-c")
      rm -rf $HOME/.config/nvim 
    ;;
    *)
      cat .data/help.dat
    ;;
  esac
done

