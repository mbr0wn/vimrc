" Include standard tags
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/boost

set cindent
set nowrap
set foldmethod=syntax
set number
set complete=.,w,b,u,t
set list
set cc=80

" Keymappings are in after/../cpp.vim, because otherwise, settings from c.vim
" override this.
