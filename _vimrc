set nocompatible
syntax on

execute pathogen#infect()

let mapleader=","

colorscheme solarized
let g:airline_theme='powerlineish'
set laststatus=2 " Always show airline

" Get rid of crappy ~ files
set nobackup
set nowritebackup

set noeb vb t_vb= " Disable all the noises

set number
set backspace=2
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4 expandtab

set pastetoggle=<F2>

" Ctrl+n to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
map <F3> :retab<CR>

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
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.lib,*.pdb,*.dll
let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll|lib|idb|obj|sdf)$'
        \ }

autocmd QuickFixCmdPost [^l]* nested copen
autocmd QuickFixCmdPost    l* nested lwindow
autocmd BufWritePre * :%s/\s\+$//e " Remove all trailing whitespace on every save

map <leader>vimrc :e $USERPROFILE\vimfiles\_vimrc<cr>
