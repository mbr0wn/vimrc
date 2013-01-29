"""" Indenting
set tabstop=4      " 4-space tab
set shiftwidth=4   " This allows you to use the < and > keys from VIM's visual  mode to block indent/unindent
set expandtab      " Insert spaces instead of <TAB> character when the <TAB> key is pressed. 
set softtabstop=4  " makes VIM see multiple space characters as tabstops, 

set number

set list listchars=tab:>-

"""" Running Python scripts
" Execute file being edited
nnoremap <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>
inoremap <buffer> <F5> <ESC>:w<CR>:!/usr/bin/env python % <CR>

" Execute a selection of code (very cool!)
" Use VISUAL to select a range and then hit F9 to execute it.
python << EOP
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOP
vnoremap <buffer> <F5> :py EvaluateCurrentRange()<CR>

"""" Pyclewn (pdb front-end)
noremap <buffer> <S-F5> :w<CR>:Pyclewn pdb %:p<CR>
noremap <buffer> <S-F7> :C import sys; sys.exit(1)<CR>
noremap <buffer> <F10> :C next<CR>
noremap <buffer> <F11> :C step<CR>

