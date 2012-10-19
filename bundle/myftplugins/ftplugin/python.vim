set tabstop=4      " 4-space tab
set shiftwidth=4   " This allows you to use the < and > keys from VIM's visual  mode to block indent/unindent
set expandtab      " Insert spaces instead of <TAB> character when the <TAB> key is pressed. 
set softtabstop=4  " makes VIM see multiple space characters as tabstops, 

" Set this to 1 to run :Pylint after every save
let g:pylint_onwrite = 0
let g:pylint_cwindow = 0
compiler pylint

" Execute file being edited
map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>
map <buffer> <S-F5> :w<CR>:Pyclewn pdb %:p<CR>

" Execute a selection of code (very cool!)
" Use VISUAL to select a range and then hit F9 to execute it.
python << EOP
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOP
map <F9> :py EvaluateCurrentRange()<CR>

map <S-F7> :C import sys; sys.exit(1)<CR>
map <F10> :C next<CR>
map <F11> :C step<CR>

