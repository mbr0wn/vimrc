python3 << EOP
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOP

function! FileRunner_normal_python()
    !/usr/bin/env python3 %
endf

function! FileRunner_visual_python()
    py3 EvaluateCurrentRange()
endf
