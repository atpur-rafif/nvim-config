vim.cmd([[

" Just to make sure folder won't b cluttered by backup and undo file
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

" Make sure to use 4 tab space
set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
set hidden
set so=15
set fillchars=eob:\ 
set termguicolors

" Change window with <A-?> rather than <C-w-?>
if has('nvim')
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

"Make sure to be able exit terminal
tnoremap <Esc> <C-\><C-n>

"Open terminal with user defined command
:command! -nargs=* Bterm call OpenTerminalBelow(<f-args>)

function! OpenTerminalBelow(...)
	let SHELL = split($SHELL, '/')
	let term = SHELL[len(SHELL) - 1]
	if a:0 == 0
		execute "below 10sp term://".term
	elseif a:0 == 1
		execute "below ".a:1."sp term://".term
	elseif a:0 == 2
		execute "below ".a:1."sp term://".a:2
	endif
endfunction

]])
