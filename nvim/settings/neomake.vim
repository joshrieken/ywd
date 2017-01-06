let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }

if filereadable('eslint')
  autocmd BufWritePost *.js Neomake eslint
endif

if filereadable('jsonlint')
  autocmd BufWritePost *.json Neomake jsonlint
endif

if filereadable('tsc')
  autocmd BufWritePost *.ts Neomake tsc
endif

if filereadable('rubocop')
  autocmd BufWritePost *.rb Neomake rubocop
endif

if filereadable('elixir')
  autocmd BufWritePost *.ex,*.exs Neomake elixir
endif

if filereadable('tidy')
  autocmd BufWritePost *.html Neomake tidy
endif

if filereadable('hamllint')
  autocmd BufWritePost *.haml Neomake hamllint
endif

if filereadable('scsslint')
  autocmd BufWritePost *.scss Neomake scsslint
endif

if filereadable('mdl')
  autocmd BufWritePost *.md Neomake mdl
endif

if filereadable('shellcheck')
  autocmd BufWritePost *.sh Neomake shellcheck
endif

if filereadable('vint')
  autocmd BufWritePost *.vim Neomake vint
endif
