:: make.bat
:: Erik Ginter
::
:: Emulate the build system I have on my Unix machines.

@echo off

:: Argument / Parameter evaluation
if "%~1"==""      ( goto build )
if "%~1"=="clean" ( goto clean )
if "%~1"=="run"   ( goto  run  )

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( Build )
:build

set compiler=cl.exe
set executable=program.exe
set source=main.cpp

%compiler% %source% /Fe%executable%

goto end

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( Clean )
:clean

:: Get rid of Emacs temp files
del *~
del #*#

:: Get rid of compiler artifacts
del *.obj

:: Get rid of the executable
del %executable%

goto end

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( Run )

:run

:: Run our compiled program
%executable%

goto end

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( End )
:end
