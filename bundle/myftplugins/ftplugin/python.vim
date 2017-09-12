"""" Indenting
set tabstop=4      " 4-space tab
set shiftwidth=4   " This allows you to use the < and > keys from VIM's visual  mode to block indent/unindent
set expandtab      " Insert spaces instead of <TAB> character when the <TAB> key is pressed. 
set softtabstop=4  " makes VIM see multiple space characters as tabstops, 

set number

set list listchars=tab:>-
set cc=80

"""" Pyclewn (pdb front-end)
noremap <buffer> <S-F5> :w<CR>:Pyclewn pdb %:p<CR>:Cmapkeys<CR>
noremap <buffer> <S-F7> :C import sys; sys.exit(1)<CR>:Cunmapkeys<CR>:bd (clewn)_console<CR>
noremap <buffer> <F10> :C next<CR>
noremap <buffer> <F11> :C step<CR>
noremap <F12> :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>

