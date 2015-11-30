" FileRunner for C++: Compile and execute
"
function! FileRunner_normal_cpp()
    !g++ % && (./a.out; rm a.out)
endf

" Visual mode:
" * Create a new .cpp file from the selected code and
"   all the includes from the current file
" * paste into main()
function! FileRunner_visual_pp()
    " TODO: Build a C++ file from the partial code
    !g++ -std=gnu++11 % && (./a.out; rm a.out)
endf
