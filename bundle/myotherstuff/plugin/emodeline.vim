""
" File: emodeline.vim
" Author: Radu Dineiu <littledragon@altern.org>
" Last Change:  2002 Nov 02
" Version: 0.1
"
" MB: Catches c++ which is not a recognised filetype

function! EModeLine()
	let i = 0
	let regexp = '^.*-\*-\s\(.\{-}\)\s-\*-.*$'
	while i < 3
		let line = getline(i)
		if match(line, regexp) > -1
			let ml = substitute(line, regexp, '\1', '')
			if ml == 'c++'
				let &ft = 'cpp'
			elseif ml == 'coding: utf-8'
				let &fileencoding = 'utf-8'
			else
				let &ft = ml
			endif
		endif
		let i = i + 1
	endwhile
endfunction

autocmd BufRead * call EModeLine()
