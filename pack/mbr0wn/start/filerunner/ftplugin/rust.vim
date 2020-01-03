" FileRunner for Rust: Compile and execute
"
function! FileRunner_normal_rust()
    !cargo run
    "!rustc % -o vimrustexe && (./vimrustexe; rm vimrustexe)
endf

" Visual mode: Same as normal mode for now.
function! FileRunner_visual_rust()
    !cargo run
    "!rustc % -o vimrustexe && (./vimrustexe; rm vimrustexe)
endf

