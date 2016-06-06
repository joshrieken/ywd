" Easily type underscores
" A-k
imap <silent> ˚ _
" A-d
imap <silent> ∂ _

" Change inside various enclosures
" A-'
nnoremap æ f'ci'
" A-"
nnoremap Æ f"ci"
" A-(
nnoremap · f(ci(
" A-)
nnoremap ‚ f)ci)
" A-[
nnoremap <D-[> f[ci[
" A-]
nnoremap <D-]> f]ci]

" Move up and down by function (Alt-j & Alt-k)
nnoremap <silent> ∆ }
nnoremap <silent> ˚ {
autocmd FileType ruby map <buffer> ∆ ]m
autocmd FileType ruby map <buffer> ˚ [m
autocmd FileType rspec map <buffer> ∆ }
autocmd FileType rspec map <buffer> ˚ {
autocmd FileType javascript map <buffer> ∆ }
autocmd FileType javascript map <buffer> ˚ {
autocmd FileType coffeescript map <buffer> ∆ }
autocmd FileType coffeescript map <buffer> ˚ {
autocmd FileType elixir map <buffer> ∆ }
autocmd FileType elixir map <buffer> ˚ {

" Alt-/ to toggle comments
map ÷ :TComment<CR>
imap ÷ <Esc>:TComment<CR>i

" Use Alt-numbers to pick the tab you want (like iTerm)
map <silent> ¡ :tabn 1<cr>
map <silent> ™ :tabn 2<cr>
map <silent> £ :tabn 3<cr>
map <silent> ¢ :tabn 4<cr>
map <silent> ∞ :tabn 5<cr>
map <silent> § :tabn 6<cr>
map <silent> ¶ :tabn 7<cr>
map <silent> • :tabn 8<cr>
map <silent> ª :tabn 9<cr>

" Resize windows with Alt-WASD
nnoremap „ <C-w>+
nnoremap Í <C-w>-
nnoremap Å <C-w><
nnoremap Î  <C-w>>

" Source current file Alt-% (good for vim development)
map ﬁ :so %<CR>

