
function! filerunner#run_normal()
	write
	if exists("*FileRunner_normal_{&ft}")
		call FileRunner_normal_{&ft}()
	endif
endf

function! filerunner#run_visual()
	if exists("*FileRunner_visual_{&ft}")
		call FileRunner_visual_{&ft}()
	endif
endf
