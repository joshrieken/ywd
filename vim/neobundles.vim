if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/neobundles/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

runtime ruby.neobundle
runtime languages.neobundle
runtime git.neobundle
runtime appearance.neobundle
runtime textobjects.neobundle
runtime search.neobundle
runtime project.neobundle
runtime vim-improvements.neobundle

if filereadable(expand("~/.vim/.neobundles.local"))
  source ~/.vim/.neobundles.local
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
