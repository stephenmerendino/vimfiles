@echo off

echo Installing Stephen's vim setup...

SET cur_dir=%~dp0
mklink %USERPROFILE%\_vimrc %cur_dir%_vimrc
mklink %USERPROFILE%\_gvimrc %cur_dir%_gvimrc
git submodule update --init --recursive

echo ...DONE!
