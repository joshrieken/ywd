set nocompatible
set wildmode=list:longest,full
set number

filetype off
filetype plugin indent on

if filereadable(expand("~/.config/nvim/plugs.vim"))
  source ~/.config/nvim/plugs.vim
endif
