" UCF syntax file
" Language:	XILINX UCF

if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" A bunch of useful Verilog keywords
syn keyword ucfStatement  NET

syn keyword ucfTodo contained TODO

syn match   ucfOperator ";"

syn region  ucfComment start="/\*" end="\*/" contains=ucfTodo
syn match   ucfComment "#.*" contains=ucfTodo

syn match   ucfGlobal "`[a-zA-Z0-9_]\+\>"
syn match   ucfGlobal "$[a-zA-Z0-9_]\+\>"

syn match   ucfConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   ucfNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   ucfNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   ucfNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   ucfNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   ucfNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  ucfString start=+"+ skip=+\\"+ end=+"+ contains=ucfEscape
syn match   ucfEscape +\\[nt"\\]+ contained
syn match   ucfEscape "\\\o\o\=\o\=" contained


"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ucf_syn_inits")
   if version < 508
      let did_ucf_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink ucfCharacter	 	Character
   HiLink ucfString		String
   HiLink ucfTodo		Todo
   HiLink ucfComment		Comment
   HiLink ucfConstant		Statement
   HiLink ucfNumber		Number
   HiLink ucfOperator		Special
   HiLink ucfStatement		Statement
   HiLink ucfGlobal		Define
   HiLink ucfEscape		Special

   delcommand HiLink
endif

let b:current_syntax = "ucf"

" vim: ts=8
