call plug#begin('~/.config/nvim/plugged')

" -----------------------------------------------------------------------------
" General functionality improvements {{{
" -----------------------------------------------------------------------------
" Continuously update session files
Plug 'tpope/vim-obsession'
" Allow smooth switching of sessions while Neovim is open
Plug 'dhruvasagar/vim-prosession'
" Open a file in a given line
Plug 'bogado/file-line'
" Tool for easily managing marks and displaying them in the gutter
Plug 'kshenoy/vim-signature'
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" Delete buffers and close files without messing up the layout
Plug 'moll/vim-bbye'
" Asynchronous :make using Neovim's job-control functionality
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Narrow Region (like Emacs Narrow Region)
Plug 'chrisbra/NrrwRgn'
" Miscellaneous auto-load scripts
Plug 'xolox/vim-misc'
" Maintain a history of previous yanks, changes and deletes
Plug 'skwp/YankRing.vim'
" Utility functions
Plug 'tomtom/tlib_vim'
" Enable repeating supported plugin maps with \".\"
Plug 'tpope/vim-repeat'
" Interpret a file by function and cache file automatically
Plug 'MarcWeber/vim-addon-mw-utils'
" Last position jump improved
Plug 'vim-scripts/lastpos.vim'
" Ex command history reverse-i-search for Vim
Plug 'goldfeld/ctrlr.vim'
" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Project configuration
Plug 'tpope/vim-projectionist'
" ANSI escape sequences concealed, but highlighted as specified (conceal)
Plug 'vim-scripts/AnsiEsc.vim'
" Edit a file with privileges from an unpriviledged session
Plug 'vim-scripts/sudo.vim'
" View references
Plug 'thinca/vim-ref'
" Heuristically set indent options
Plug 'tpope/vim-sleuth'
" }}}


" -----------------------------------------------------------------------------
" Interface improvements {{{
" -----------------------------------------------------------------------------
" Fancy start screen
Plug 'mhinz/vim-startify'
" A light and configurable statusline/tabline
Plug 'itchyny/lightline.vim'
" Tree explorer
Plug 'scrooloose/nerdtree'
" NERDTree and tabs together
Plug 'jistr/vim-nerdtree-tabs'
" Better whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'
" Toggle between relative and absolute line numbers automatically
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Graph undo tree
Plug 'sjl/gundo.vim'
" Easy window resizing to a nice size
Plug 'roman/golden-ratio'
" Colorschemes
Plug 'flazz/vim-colorschemes'
" Colorize all text in the form #rrggbb or #rgb
Plug 'lilydjwg/colorizer', { 'for': [
    \ 'css', 'sass', 'scss', 'less',
    \ 'html', 'xhtml', 'eruby', 'eelixir',
    \ 'javascript', 'javascript.jsx'
  \]
\}
" lightline.vim theme for gruvbox
Plug 'shinchu/lightline-gruvbox.vim'
" }}}


" -----------------------------------------------------------------------------
" Navigation & search {{{
" -----------------------------------------------------------------------------
" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'
" Plugins for ctrlp.vim
Plug 'sgur/ctrlp-extensions.vim'
" Motions on speed!
Plug 'easymotion/vim-easymotion'
" Global search and replace
Plug 'skwp/greplace.vim'
" Enhanced multi-file search
" Plug 'wincent/ferret'
" An ack.vim alternative that mimics Ctrl-Shift-F on Sublime Text
Plug 'dyng/ctrlsf.vim'
" Shows 'Nth match out of M' at every search (index of match+total # matches)
Plug 'vim-scripts/IndexedSearch'
" Start a * or # search from a visual block
Plug 'nelstrom/vim-visual-star-search'
" Lightning-fast left-right movement
Plug 'unblevable/quick-scope'
" Don't auto-jump to next result on initial *
" Plug 'ironhouzi/vim-stim'
" }}}


" -----------------------------------------------------------------------------
" External tool integration {{{
" -----------------------------------------------------------------------------
" Helpers for UNIX
Plug 'tpope/vim-eunuch'
" Create gists
Plug 'mattn/gist-vim'
" Run tests
Plug 'janko-m/vim-test'
" Preview markdown documents in the browser
Plug 'nelstrom/vim-markdown-preview'
" Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL, DBI,..)
Plug 'vim-scripts/dbext.vim'
" Web APIs (using curl or wget)
Plug 'mattn/webapi-vim'
" Automatically discover and properly update ctags files on save
Plug 'craigemery/vim-autotag'
" }}}


" -----------------------------------------------------------------------------
" VCS {{{
" -----------------------------------------------------------------------------
" Git runtime files
Plug 'tpope/vim-git'
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Show a git diff in the gutter (sign column) and stages/reverts hunks
Plug 'airblade/vim-gitgutter'
" Visual git
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" }}}


" -----------------------------------------------------------------------------
" Text insertion & manipulation {{{
" -----------------------------------------------------------------------------
" Completion framework
Plug 'Shougo/deoplete.nvim'
" Alignment
Plug 'junegunn/vim-easy-align'
" Auto-close pairable characters
Plug 'jiangmiao/auto-pairs'
" Change the contents of the innermost 'surrounding'
Plug 'briandoll/change-inside-surroundings.vim'
" Search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
" Quoting/parenthesizing
Plug 'tpope/vim-surround'
" Move lines and selections up and down
Plug 'matze/vim-move'
" }}}


" -----------------------------------------------------------------------------
" General-purpose text objects {{{
" -----------------------------------------------------------------------------
" Entire buffer
Plug 'kana/vim-textobj-entire'
" Manipulate blocks based on their indentation
Plug 'austintaylor/vim-indentobject'
" Word-based columns
Plug 'coderifous/textobj-word-column.vim'
" Date and time
Plug 'kana/vim-textobj-datetime'
" Underscore
Plug 'lucapette/vim-textobj-underscore'
" Functions
Plug 'kana/vim-textobj-function'
" Arguments
Plug 'vim-scripts/argtextobj.vim'
" Create your own
Plug 'kana/vim-textobj-user'
" }}}


" -----------------------------------------------------------------------------
" Snippets {{{
" -----------------------------------------------------------------------------
" Snippet engine
Plug 'SirVer/ultisnips'
" Base snippets
Plug 'honza/vim-snippets'
" }}}


" -----------------------------------------------------------------------------
" Programming - Language-agnostic {{{
" -----------------------------------------------------------------------------
" Master language pack
Plug 'sheerun/vim-polyglot'
" Commenting/uncommenting
Plug 'tomtom/tcomment_vim'
" Motion through CamelCaseWords and underscore_notation
Plug 'bkad/CamelCaseMotion'
" Extended % matching for HTML, LaTeX, and many other languages
Plug 'vim-scripts/matchit.zip'
" Look up documentation
Plug 'Keithbsmiley/investigate.vim'
" Display indent levels
Plug 'nathanaelkane/vim-indent-guides'
" Transition between multiline and single-line code
Plug 'AndrewRadev/splitjoin.vim'
" Add \"end\" in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'
" }}}


" -----------------------------------------------------------------------------
" Programming - Elixir & Phoenix {{{
" -----------------------------------------------------------------------------
" Mix
Plug 'mattonrails/vim-mix'
" Phoenix framework
Plug 'avdgaag/vim-phoenix'
" Completion/doc/eval w/ deoplete integration
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" }}}


" -----------------------------------------------------------------------------
" Programming - Ruby & Rails {{{
" -----------------------------------------------------------------------------
" Bundler
Plug 'tpope/vim-bundler'
" Rake
Plug 'tpope/vim-rake'
" Rails
Plug 'tpope/vim-rails'
" Refactoring
Plug 'ecomba/vim-ruby-refactoring'
" Rspec syntax highlighting
Plug 'keith/rspec.vim'
" Change hash syntax
Plug 'ck3g/vim-change-hash-syntax'
" Text object for manipulation of symbol variables
Plug 'bootleq/vim-textobj-rubysymbol'
" Text object for selecting blocks
Plug 'nelstrom/vim-textobj-rubyblock'
" }}}


" -----------------------------------------------------------------------------
" Programming - JS {{{
" -----------------------------------------------------------------------------
" Syntax for various libraries
Plug 'othree/javascript-libraries-syntax.vim'
" Text objects for functions
Plug 'thinca/vim-textobj-function-javascript'
" }}}


" -----------------------------------------------------------------------------
" Programming - HTML & CSS {{{
" -----------------------------------------------------------------------------
" Easily insert custom HTML & CSS
Plug 'rstacruz/sparkup'
" Escape or unescape HTML entities
Plug 'skwp/vim-html-escape'
" HTML/XML mappings
Plug 'tpope/vim-ragtag'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Show matching tags
Plug 'gregsexton/matchtag'
" }}}


" -----------------------------------------------------------------------------
" Programming - Other languages {{{
" -----------------------------------------------------------------------------
" Tmux
Plug 'jby/tmux.vim'
" Github-flavored Markdown
Plug 'jtratner/vim-flavored-markdown'
" }}}


" -----------------------------------------------------------------------------
" OS X only {{{
" -----------------------------------------------------------------------------
" Search Dash.app
Plug 'rizzatti/dash.vim'
" Open the current Markdown buffer in Marked.app
Plug 'itspriddle/vim-marked'
" }}}


call plug#end()

filetype plugin indent on
