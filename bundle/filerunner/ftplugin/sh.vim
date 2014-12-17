" Regular execution: Simply run the shell script
function! FileRunner_normal_sh()
    !/bin/bash %
endf

" Visual mode: Create a new temp file only containing
" the selected lines. Then run them through bash
python << EOP
import vim
def EvaluateCurrentRange():
    import tempfile
    import os
    (fd, name) = tempfile.mkstemp(suffix='.sh', text=True)
    os.write(fd, '\n'.join(vim.current.range))
    os.close(fd)
    vim.command("!/bin/bash {}".format(name))
    os.unlink(name)
EOP
function! FileRunner_visual_sh()
    py EvaluateCurrentRange()
endf

