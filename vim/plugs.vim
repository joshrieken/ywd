call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify' " The fancy start screen for Vim.
Plug 'chrisbra/Colorizer' " color hex codes and color names
Plug 'flazz/vim-colorschemes' " one colorscheme pack to rule them all!
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline for Vim
Plug 'bogado/file-line' " Plugin for vim to enabling opening a file in a given line
Plug 'xsunsmile/showmarks'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim' " Plugins for ctrlp.vim
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'moll/vim-bbye' " Delete buffers and close files in Vim without closing your windows or messing up your layout. Like Bclose.vim, but rewritten and well maintained.
Plug 'tpope/vim-dispatch' " dispatch.vim: asynchronous build and test dispatcher
Plug 'benekastah/neomake' " A plugin for asynchronous :make using Neovim's job-control functionality
Plug 'shinchu/lightline-gruvbox.vim' " A lightline.vim theme for gruvbox.

Plug 'gregsexton/gitv' " gitk for Vim.
Plug 'mattn/gist-vim' " vimscript for gist
Plug 'tpope/vim-fugitive' " fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-git' " Vim Git runtime files
Plug 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.

Plug 'mattn/emmet-vim' " emmet for vim: http://emmet.io/
Plug 'scrooloose/syntastic' " Syntax checking hacks for vim
Plug 'SirVer/ultisnips' " The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!

Plug 'sheerun/vim-polyglot' " A solid language pack for Vim.
Plug 'jby/tmux.vim' " Tmux vim syntax
Plug 'pangloss/vim-javascript' " Vastly improved Javascript indentation and syntax support in Vim.
Plug 'othree/javascript-libraries-syntax.vim' " Syntax for JavaScript libraries
Plug 'itspriddle/vim-jquery'
Plug 'jtratner/vim-flavored-markdown'
Plug 'nelstrom/vim-markdown-preview' " preview markdown documents in the browser from vim
Plug 'skwp/vim-html-escape' " pluginization of http://vim.wikia.com/wiki/HTML_entities
Plug 'honza/vim-snippets' " vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'mattonrails/vim-mix' " Vim plugin for using Elixir's build tool, mix
Plug 'avdgaag/vim-phoenix' " Vim plugin for working with the Phoenix framework

Plug 'jistr/vim-nerdtree-tabs' " NERDTree and tabs together in Vim, painlessly
Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim.
Plug 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session' " Extended session management for Vim (:mksession on steroids)

Plug 'ecomba/vim-ruby-refactoring' " Refactoring tool for Ruby in vim!
Plug 'tpope/vim-rails' " rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rake' " rake.vim: it's like rails.vim without the rails
Plug 'tpope/vim-rvm' " rvm.vim: Switch Ruby versions from inside Vim
Plug 'vim-ruby/vim-ruby' " Vim/Ruby Configuration Files
Plug 'Keithbsmiley/rspec.vim' " Better rspec syntax highlighting for Vim
Plug 'skwp/vim-iterm-rspec' " Run your specs in iTerm by sending commands to it from vim.
Plug 'ck3g/vim-change-hash-syntax' " Change hash syntax
Plug 'tpope/vim-bundler' " bundler.vim: Lightweight support for Ruby's Bundler

" Plug '~/development/open_source/ferret'
Plug 'wincent/ferret' " Enhanced multi-file search for Vim
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'vim-scripts/IndexedSearch' " shows  'Nth match out of M'  at every search (index of match+total # matches)
Plug 'nelstrom/vim-visual-star-search' " Start a * or # search from a visual block
Plug 'skwp/greplace.vim' " Global search and replace for VI
Plug 'easymotion/vim-easymotion' " Vim motions on speed!
Plug 'matze/vim-move' " Plugin to move lines and selections up and down
Plug 'ntpeters/vim-better-whitespace' " Better whitespace highlighting for Vim

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
Plug 'thinca/vim-textobj-function-javascript' " Text objects for functions in javascript.
Plug 'vim-scripts/argtextobj.vim' " Text-object like motion for arguments

Plug 'AndrewRadev/splitjoin.vim' " A vim plugin that simplifies the transition between multiline and single-line code
Plug 'Raimondi/delimitMate' " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
if has('nvim')
  Plug 'Valloric/YouCompleteMe' " A code-completion engine for Vim
else
  Plug 'Shougo/neocomplete' " Next generation completion framework after neocomplcache
endif
Plug 'briandoll/change-inside-surroundings.vim' " vim plugin to change the contents of the innermost 'surrounding'
Plug 'godlygeek/tabular' " Vim script for text filtering and alignment
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'vim-scripts/camelcasemotion' " Motion through CamelCaseWords and underscore_notation.
Plug 'vim-scripts/matchit.zip' " extended % matching for HTML, LaTeX, and many other languages
Plug 'Keithbsmiley/investigate.vim' " A Vim plugin for looking up documentation
Plug 'chrisbra/NrrwRgn' " A Narrow Region Plugin for vim (like Emacs Narrow Region)
Plug 'MarcWeber/vim-addon-mw-utils' " vim: interpret a file by function and cache file automatically
Plug 'mattn/webapi-vim' " vim interface to Web API
Plug 'sjl/gundo.vim'
Plug 'skwp/YankRing.vim' " Maintains a history of previous yanks, changes and deletes
Plug 'tomtom/tlib_vim' " Some utility functions for VIM
Plug 'tpope/vim-abolish' " abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-endwise' " endwise.vim: wisely add \"end\" in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-ragtag' " ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-repeat' " repeat.vim: enable repeating supported plugin maps with \".\"
Plug 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-unimpaired' " unimpaired.vim: pairs of handy bracket mappings
Plug 'tpope/vim-projectionist' " projectionist.vim: project configuration
Plug 'tpope/vim-eunuch' " eunuch.vim: helpers for UNIX
Plug 'vim-scripts/AnsiEsc.vim' " ansi escape sequences concealed, but highlighted as specified (conceal)
Plug 'vim-scripts/AutoTag' " Updates entries in a tags file automatically when saving
Plug 'vim-scripts/lastpos.vim' " Last position jump improved for Easy Vim
Plug 'vim-scripts/sudo.vim' " Allows one to edit a file with prevledges from an unprivledged session.
Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
Plug 'goldfeld/ctrlr.vim' " Ex command history reverse-i-search for Vim
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Toggles between relative and absolute line numbers automatically
Plug 'vim-scripts/dbext.vim' " Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL, DBI,..)

Plug 'rizzatti/dash.vim' " Search Dash.app from Vim
Plug 'itspriddle/vim-marked' " Open the current Markdown buffer in Marked.app

call plug#end()

filetype plugin indent on
