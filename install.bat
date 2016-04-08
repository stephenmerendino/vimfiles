@echo off

echo Installing Stephen's vim setup...

SET cur_dir=%~dp0

REM Create _vimrc and _gvimrc in %USERPROFILE% path
REM Make sure those files source the actual files here
echo source %cur_dir%_vimrc > %USERPROFILE%\_vimrc
echo source %cur_dir%_gvimrc > %USERPROFILE%\_gvimrc

REM Setup vimfiles folder in %USERPROFILE%
if not exist %USERPROFILE%\vimfiles mkdir %USERPROFILE%\vimfiles
if not exist %USERPROFILE%\vimfiles\autoload mkdir %USERPROFILE%\vimfiles\autoload
if not exist %USERPROFILE%\vimfiles\bundle mkdir %USERPROFILE%\vimfiles\bundle

set vim_path=%USERPROFILE%\vimfiles

REM Put pathogen in autoload then cleanup
git clone https://github.com/tpope/vim-pathogen
copy vim-pathogen\autoload\pathogen.vim %vim_path%\autoload\
rmdir /Q /S vim-pathogen

REM Put plugins in bundle
pushd %vim_path%\bundle\
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/kien/ctrlp.vim
popd

echo ...DONE!
