let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }

autocmd BufWritePost *.js Neomake eslint
autocmd BufWritePost *.json Neomake jsonlint
autocmd BufWritePost *.ts Neomake tsc
autocmd BufWritePost *.rb Neomake rubocop
autocmd BufWritePost *.ex,*.exs Neomake elixir
autocmd BufWritePost *.html Neomake tidy
autocmd BufWritePost *.haml Neomake hamllint
autocmd BufWritePost *.scss Neomake scsslint
" autocmd BufWritePost *.md Neomake mdl
autocmd BufWritePost *.sh Neomake shellcheck
" autocmd BufWritePost *.vim Neomake vint
