set nocompatible
syntax on

execute pathogen#infect()

let mapleader=","

colorscheme solarized
let g:airline_theme='powerlineish'
set laststatus=2 " Always show airline
set directory=.,$TEMP

" Get rid of crappy ~ files
set nobackup
set nowritebackup

" Disable all the noises
set noeb vb t_vb=

set number
set backspace=2
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4 expandtab
set cindent autoindent
set relativenumber

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F3> :retab<CR>

nnoremap <A-n> :call NumberToggle()<CR>
function! NumberToggle()
    if(&relativenumber == 1)
        set nornu
    else
        set rnu
    endif
endfunc

nnoremap <F2> :call PasteToggle()<CR>
function! PasteToggle()
    if(&paste == 1)
        set nopaste
    else
        set paste
    endif
endfunc

" Thanks to https://forums.handmadehero.org/index.php/forum?view=topic&catid=4&id=704#3982
" error message formats
" Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
" Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
" Microsoft HLSL compiler: fxc.exe
set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m

nnoremap <F7> :call SimpleCBuild()<CR>
function! SimpleCBuild()
    let &makeprg="build"
    silent make
    copen
    echo "Build Complete"
endfunc

nnoremap <F6> :cn<CR>
nnoremap <F5> :cp<CR>

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.lib,*.pdb,*.dll
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll|lib|idb|obj|sdf)$'
        \ }

" Remove all trailing whitespace on every save
autocmd BufWritePre * :%s/\s\+$//e

" Quick edit my vimrc
map <leader>vimrc :e $USERPROFILE\vimfiles\_vimrc<cr>

" Move lines up and down easy
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Custom Ag path
let g:ag_prg=$USERPROFILE."\\vimfiles\\bin\\ag --vimgrep"
