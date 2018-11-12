" Dotfiles are configured to respect .gitignore

" Search all files (respecting .gitignore)
nnoremap <silent> <leader>t :Files<cr>

" Search buffers
nnoremap <silent> <leader>bb :Buffers<cr>

" Search all tags
nnoremap <silent> <leader>at :Tags<cr>

" Search tags in the current buffer
nnoremap <silent> <leader>ot :BTags<cr>

" Search most recently used files
nnoremap <silent> <leader>his :History<cr>

" Search command history
nnoremap <silent> <leader>hc :History:<cr>

" Search search history
nnoremap <silent> <leader>/ :History/<cr>

" Search maps
nnoremap <silent> <leader>m :Maps<cr>

" Search git commits (requires fugitive.vim)
nnoremap <silent> <leader>co :Commits<cr>
