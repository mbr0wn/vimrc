"""""" Custom controls """"""""""""""
" You know, keys and stuff

" map colon to space bar (never need it in command mode anyway)
nmap <Space> :

" ctrl-tab through tabs
map <C-Tab> :tabnext<Enter>
map <C-S-Tab> :tabprev<Enter>

" tab through bufs
map <Tab> :bnext<Enter>
map <S-Tab> :bprev<Enter>

" tab shortkeys
"map <leader>tn :tabnew %<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 

map <C-F12> :TMiniBufExplorer<cr>

" Ctrl-Backspace kill current word
imap <C-BS> 
nmap <C-BS> bdw

nmap <F2> :NERDTreeToggle<CR>
imap <F2> <ESC>:NERDTreeToggle<CR>

nmap <F3> :TagbarToggle<CR>
imap <F3> <ESC>:TagbarToggle<CR>

" Omnicompletion on Ctrl-Space
inoremap <C-Space> <C-X><C-O>

