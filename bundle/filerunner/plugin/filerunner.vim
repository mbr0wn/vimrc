" vim:list:listchars=tab\:>-:et:sw=4:
" Plugin: filerunner
"
" Version: 0.1-alpha-hack
"
" Description:
" Runs currently open files.
"
" Maintainer: Martin Braun
"

if v:version < 700
	finish
endif

nnoremap <buffer> <F5> :w<CR>:call filerunner#run_normal()<CR>
inoremap <buffer> <F5> <ESC>:w<CR>:call filerunner#run_normal()<CR>
vnoremap <buffer> <F5> :call filerunner#run_visual()<CR>

