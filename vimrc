" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif




" ================ GENERAL SETTINGS
set nocompatible
set encoding=utf8
set number                      " Line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds on the bottom
set showmode                    " Show current mode on the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set ruler
set hidden
set winheight=30
silent! set winminheight=3
syntax on

let mapleader="\<Space>"




" ================ PLUGS INITIALIZATION
if filereadable(expand("~/.vim/plugs.vim"))
  source ~/.vim/plugs.vim
endif




" ================ TURN OFF SWAP FILES
set noswapfile
set nobackup
set nowb




" ================ PERSISTENT UNDO
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif




" ================ INDENTATION
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points




" ================ FOLDS
set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default




" ================ COMPLETION
set wildmode=list:longest
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif




" ================ SCROLLING
set scrolloff=8         " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1




" ================ SEARCH
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital



" ================ NEOVIM
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" Load settings
so ~/.yakko-wakko-dotfiles/vim/settings.vim
