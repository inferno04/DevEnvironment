:: make.bat
:: Erik Ginter
:: Last updated: September 7, 2016
::
:: Emulate the build system I have on my Unix machines.
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

setlocal

  set delete_file=del /S /Q
  set delete_dir=rmdir /S /Q

:: Defaults set up for VS 2013+
:: ( Assumes that you have already run vcvarsall.bat with desired arguments )
  set compiler=cl.exe
  set debugger=devenv.exe

:: VS 2015 Useful Flag Table
:: /Zi       Enable debugging information
:: /ZI       Enable Edit-and-Continue debug info
:: /Zo       Generate richer debugging information for optimized code
:: /FC       Use full pathnames in diagnostics
:: /GL       Enable link-time code generation
:: /Gw       Separate Global variables for linker
:: /GS       Enable security checks
:: /analyze  Enable native analysis
:: /MP[n]    Enable multi-process compilation
  set compiler_flags=/Zi /FC /GL /Gw /GS /analyze /MP
  set compiler_libs=
  set executable=program.exe
  set source=main.c

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Argument / Parameter evaluation
  if "%~1"==""      ( goto build_proc )
  if "%~1"=="build" ( goto build_proc )
  if "%~1"=="clean" ( goto clean_proc )
  if "%~1"=="run"   ( goto  run_proc  )
  if "%~1"=="debug" ( goto debug_proc )

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( Build )
:build_proc

  if not exist build mkdir build

  pushd build

    @echo on

      %compiler% %compiler_flags% ..\%source% /Fe%executable% %compiler_libs%

    @echo off

  popd build

  goto eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( Clean )
:clean_proc

:: Get rid of compiler artifacts and the rest of the build directory
  if exist build (

    @echo on

      %delete_dir% build

    @echo off

  )

:: Get rid of Emacs temp files ( If they exist at all )
  @echo on

    %delete_file% *~
    %delete_file% #*#

  @echo off

  goto eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( Run )

:run_proc

:: Check to make sure our executable is built ( basic dependency )
  if not exist build call make

:: Run our compiled program
  @echo on

    build\%executable%

  @echo off

  goto eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( Debug )

:debug_proc

:: Check to make sure our executable is built ( basic dependency )
  if not exist build call make

:: Launch debugger with our executable
:: ( Default set up for VS 2013+ DevEnv.exe - a GUI app )
:: [ Remove "start" if using a CUI debugger ]

  @echo on

    start %debugger% build\%executable%

  @echo off

  goto eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Make ( End )
:eof

endlocal

