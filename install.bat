@echo off

echo Installing Stephen's vim setup...

SET cur_dir=%~dp0

REM Create _vimrc and _gvimrc in %USERPROFILE% path
REM Make sure those files source the actual files here
echo source %cur_dir%_vimrc > %USERPROFILE%\_vimrc
echo source %cur_dir%_gvimrc > %USERPROFILE%\_gvimrc

echo ...DONE!
