"
" Plugin: grproject
"
" Version: 0.1
"
" Description:
" Helps working with GNU Radio projects.
"
" Maintainer: Martin Braun
"
" Credits: I took some inspiration from dirsettings.vim by Tye Zdrojewski
"

if version < 700
    finish
endif

" Define a group so we can delete them when this file is sourced, and we don't
" end up with multiple autocmd entries if this file is sourced more than once.
augroup grproject
autocmd! grproject
autocmd grproject BufNewFile,BufReadPost *.cc,*.h,*.py,CMakeLists.txt call GRCheckForProject()
"autocmd grproject BufEnter *.cc,*.h,*.py,CMakeLists.txt call GRCheckForProject()


" Check if this file is part of a GNU Radio project
func! GRCheckForProject()
	if exists('b:GRProjectName') && 0
		" Then this was already called
		return
	else
		if !GRFindProjectFile()
			" Then this is no project
			return
		end
	endif
	let &l:makeprg = 'cd '.b:GRProjectPath.'/build; make'
	let &l:path = &g:path.b:GRProjectPath.'/include,'
	"call GRSetupSyntastic()
endfunc

" Set some stuff for syntastic
func! GRSetupSyntastic()
python << EOP
import vim
import re
cmfilename = vim.eval('b:GRProjectPath') + '/build/CMakeCache.txt'
pattern = 'PC_GNURADIO_CORE_STATIC_CFLAGS:INTERNAL=(.*)'
p = re.compile(pattern)
cmfile = open(cmfilename, 'r')
cppflags = '-I%s/include ' % vim.eval('b:GRProjectPath')
for line in cmfile:
	if p.match(line):
		cflags = p.match(line).groups()[0].split(';')
		for flag in cflags:
			cppflags += flag + ' '
		break
vim.command("let b:syntastic_cpp_cflags = '%s'" % cppflags)
EOP
endfunc


" Find the 'gnuradio.project' file. If it exists, return the project name.
" If not, return False
func! GRFindProjectFile()
	" We look in the files dir and the one above
	let prjfile = findfile('gnuradio.project', expand('%:p:h'))
	if !prjfile
		let prjfile = findfile('gnuradio.project', expand('%:p:h').'/..')
	endif
	if !filereadable(prjfile)
		return 0
	endif
	let b:GRProjectPath = fnamemodify(prjfile, ':p:h')
	let regexp = '^.*projectname\s*=\s*\([A-Za-z0-9_-]\)'
	for line in readfile(prjfile)
		if line =~ '^#'
			continue
		endif
		if line =~ 'projectname'
			let b:GRProjectName = substitute(line, regexp, '\1', '')
			return 1
		endif
	endfor
	return 0
endfunc

