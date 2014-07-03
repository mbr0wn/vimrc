" Include standard tags
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/boost

set cindent
set tabstop=8
set shiftwidth=8
set softtabstop=8
set nowrap
set foldmethod=syntax
set number
set complete=.,w,b,u,t
set list
set listchars=tab:>-,nbsp:%

" Run this file through g++ and run
nnoremap <buffer> <F5> :w<CR>:!g++ % && ./a.out; rm a.out <CR>
inoremap <buffer> <F5> <ESC>:w<CR>:!g++ % && ./a.out; rm a.out <CR>
