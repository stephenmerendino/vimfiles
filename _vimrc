set nocompatible
syntax on
execute pathogen#infect()
let g:airline_theme='powerlineish'

" Get rid of crappy ~ files
set nobackup
set nowritebackup

set number
set backspace=2
set backspace=indent,eol,start
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Ctrl+n to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Alt-n to toggle relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <A-n> :call NumberToggle()<CR>

" Ignore crap for Ctrl-P
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.lib,*.pdb
let g:ctrlp_custom_ignore = { 
	\ 'dir':  '\v[\/]\.(git|hg|svn)$', 
	\ 'file': '\v\.(exe|so|dll|lib|idb|obj|sdf)$' 
	\ }
