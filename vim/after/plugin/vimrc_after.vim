" This loads after the yadr plugins so that plugin mappings can
" be overwritten.

if filereadable(expand("~/.yakko-wakko-dotfiles/vim/after/.vimrc.after"))
  source ~/.yakko-wakko-dotfiles/vim/after/.vimrc.after
endif

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
