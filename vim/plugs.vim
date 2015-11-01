call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'chrisbra/Colorizer'
Plug 'skwp/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'bogado/file-line'
Plug 'xsunsmile/showmarks'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-dispatch'
Plug 'shinchu/lightline-gruvbox.vim'

Plug 'gregsexton/gitv'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'

Plug 'jby/tmux.vim'
Plug 'briancollins/vim-jst'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-haml'
Plug 'rodjek/vim-puppet'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'claco/jasmine.vim'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'itspriddle/vim-jquery'
Plug 'jtratner/vim-flavored-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'nelstrom/vim-markdown-preview'
Plug 'skwp/vim-html-escape'
Plug 'honza/vim-snippets'
Plug 'slim-template/vim-slim'
Plug 'elixir-lang/vim-elixir'
Plug 'mattonrails/vim-mix'
Plug 'mattn/emmet-vim'
Plug 'avdgaag/vim-phoenix'

Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rvm'
Plug 'vim-ruby/vim-ruby'
Plug 'Keithbsmiley/rspec.vim'
Plug 'skwp/vim-iterm-rspec'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'tpope/vim-bundler'

Plug 'wincent/ferret'
Plug 'vim-scripts/IndexedSearch'
Plug 'nelstrom/vim-visual-star-search'
Plug 'skwp/greplace.vim'
Plug 'easymotion/vim-easymotion'


Plug 'austintaylor/vim-indentobject' " A text object for manipulating blocks based on their indentation
Plug 'bootleq/vim-textobj-rubysymbol' " Text object for manipulation of ruby symbol variables
Plug 'coderifous/textobj-word-column.vim' " Adds text-objects for word-based columns in Vim.
Plug 'kana/vim-textobj-datetime' " Vim plugin: Text objects for date and time
Plug 'kana/vim-textobj-entire' " Vim plugin: Text objects for entire buffer
Plug 'kana/vim-textobj-function' " Vim plugin: Text objects for functions
Plug 'kana/vim-textobj-user' " Vim plugin: Create your own text objects
Plug 'lucapette/vim-textobj-underscore' " Underscore text-object for Vim
Plug 'nathanaelkane/vim-indent-guides' " A Vim plugin for visually displaying indent levels in code
Plug 'nelstrom/vim-textobj-rubyblock' " A custom text object for selecting ruby blocks.
Plug 'thinca/vim-textobj-function-javascript'
Plug 'vim-scripts/argtextobj.vim'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
else
  Plug 'Shougo/neocomplete'
endif
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/matchit.zip'
Plug 'Keithbsmiley/investigate.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/webapi-vim'
Plug 'sjl/gundo.vim'
Plug 'skwp/YankRing.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/lastpos.vim'
Plug 'vim-scripts/sudo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'goldfeld/ctrlr.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-scripts/dbext.vim'

call plug#end()

filetype plugin indent on
