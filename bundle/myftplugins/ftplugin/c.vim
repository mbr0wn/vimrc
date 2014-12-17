set cindent
"set noexpandtab
"set tabstop=8
"set shiftwidth=8
"set softtabstop=8
set nowrap
set foldmethod=syntax
set number

" Run this file through g++ and run
nnoremap <buffer> <F6> :w<CR>:!gcc % && (./a.out; rm a.out)<CR>
inoremap <buffer> <F5> <ESC>:w<CR>:!gcc % && (./a.out; rm a.out)<CR>
