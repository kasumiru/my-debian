set mouse-=a
syntax on
colo darkblue
set t_Co=256
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *  if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"map <M-1> 1gt
"map <M-2> 2gt
"map <M-3> 3gt
