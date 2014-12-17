python << EOP
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOP

function! FileRunner_normal_python()
	!/usr/bin/env python %
endf

function! FileRunner_visual_python()
	py EvaluateCurrentRange()
endf
