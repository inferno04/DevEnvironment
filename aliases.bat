:: aliases.bat
:: Erik Ginter
:: Last updated: September 7, 2016
::
:: Provide something similar to a .bashrc on Windows
::
:: Installation Instructions:
::============================
:: 1. Install aliases.bat to its desired location
:: 2. Open the Registry Editor ( regedit.exe )
:: 3. Browse to the following registry key:
::  - HKEY_CURRENT_USER
::   - Software
::    - Microsoft
::     - Command Processor
:: 4. Add a new String value entry with the name 'AutoRun'
:: 5. Enter the full path to aliases.bat
::  e.g: "C:\aliases.bat"
::   NOTE:
::    ( I prefer to put system batch files directly on the C: drive - sue me )
:: 6. ???
:: 7. Profit
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

setlocal

:: Helpful UNIX aliases

  @doskey ls    = dir $*
  @doskey cp    = copy $*
  @doskey clear = cls
  @doskey mv    = move $*
  @doskey cat   = type $*
  @doskey touch = copy /y NUL $* > NUL

:: Paint

  set PAINT_PATH=%windir%\system32\
  @doskey paint = "%PAINT_PATH%mspaint.exe" $*

:: Emacs

  set EMACS_PATH=C:\Program Files (x86)\GNU Emacs\emacs-24.3\bin\
  @doskey emacs = "%EMACS_PATH%runemacs.exe" $*

:: Notepad++

  set NPP_PATH=C:\Program Files (x86)\Notepad++\
  @doskey notepad++ = "%NPP_PATH%notepad++.exe" $*
  @doskey npp       = "%NPP_PATH%notepad++.exe" $*

endlocal
