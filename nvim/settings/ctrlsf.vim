let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

nmap     <C-F>f <Plug>CtrlSFPrompt
nmap     <C-F>r <Plug>CtrlSFPrompt-R 
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
