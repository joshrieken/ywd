if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif



call neobundle#begin(expand('~/.vim/bundle/'))

if neobundle#load_cache()
  NeoBundleFetch 'Shougo/neobundle.vim'

  " Preloaded
  call neobundle#load_toml(
        \ '~/.vim/neobundles/preload.toml')

  " Lazy-loaded
  call neobundle#load_toml(
        \ '~/.vim/neobundles/git.toml', {'lazy' : 1})
  call neobundle#load_toml(
        \ '~/.vim/neobundles/languages.toml', {'lazy' : 1})
  call neobundle#load_toml(
        \ '~/.vim/neobundles/project.toml', {'lazy' : 1})
  call neobundle#load_toml(
        \ '~/.vim/neobundles/ruby.toml', {'lazy' : 1})
  call neobundle#load_toml(
        \ '~/.vim/neobundles/search.toml', {'lazy' : 1})
  call neobundle#load_toml(
        \ '~/.vim/neobundles/textobjects.toml', {'lazy' : 1})
  call neobundle#load_toml(
        \ '~/.vim/neobundles/vim-improvements.toml', {'lazy' : 1})

  " User-specified preloaded plugins
  if filereadable(expand("~/.vim/.neobundles.local"))
    call neobundle#load_toml(
          \ '~/.vim/.neobundles.local')
  endif

  " User-specified lazy-loaded plugins
  if filereadable(expand("~/.vim/.neobundles.local.lazy"))
    call neobundle#load_toml(
          \ '~/.vim/.neobundles.local.lazy', {'lazy' : 1})
  endif

  NeoBundleSaveCache
endif

call neobundle#end()




" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if has('vim_starting')
  NeoBundleCheck
endif
