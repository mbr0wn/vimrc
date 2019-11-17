if has('python3')
python3 << EOP
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOP
elseif has('python')
python << EOP
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOP

endif

function! FileRunner_normal_python()
	!/usr/bin/env python %
endf

function! FileRunner_visual_python()
	if has('python3')
    	py3 EvaluateCurrentRange()
	elseif has('python')
    	py EvaluateCurrentRange()
	endif
endf
