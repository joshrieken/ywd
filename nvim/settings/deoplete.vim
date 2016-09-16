let g:deoplete#enable_at_startup = 1
let g:deoplate#enable_camel_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 50
let g:deoplete#auto_completion_start_length = 4

inoremap <C-Space> <C-n>

" Define keyword
if !exists('g:deoplete#keyword_patterns')
  let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown,ghmarkdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
