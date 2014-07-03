" Mappings for C++

" Run this file through g++ and run
nnoremap <buffer> <F5> :w<CR>:!g++ % && (./a.out; rm a.out)<CR>
inoremap <buffer> <F5> <ESC>:w<CR>:!g++ % && (./a.out; rm a.out)<CR>
