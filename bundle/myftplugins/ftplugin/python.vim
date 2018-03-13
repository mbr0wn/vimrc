"""" Indenting
set number
set cc=80

"""" Pyclewn (pdb front-end)
noremap <buffer> <S-F5> :w<CR>:Pyclewn pdb %:p<CR>:Cmapkeys<CR>
noremap <buffer> <S-F7> :C import sys; sys.exit(1)<CR>:Cunmapkeys<CR>:bd (clewn)_console<CR>
noremap <buffer> <F10> :C next<CR>
noremap <buffer> <F11> :C step<CR>
noremap <F12> :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>

