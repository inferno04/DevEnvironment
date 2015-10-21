:: aliases.bat
:: Erik Ginter
::
:: Provide something similar to a .bashrc on Windows
::
:: Installation Instructions:
::============================
:: 1. Install aliases.bat to its desired location
:: 2. Open the Registry Editor ( regedit.exe )
:: 3. Browse to the following registry key:
::    - HKEY_CURRENT_USER
::        - Software
::            - Microsoft
::                - Command Processor
:: 4. Add a new String value entry with the name 'AutoRun'
:: 5. Enter the full path to aliases.bat
::    e.g: "C:\aliases.bat"
::    NOTE:
::        ( I prefer to put system batch files directly on the C: drive - sue me )
:: 6. Profit

@echo off

setlocal

:: Helpful aliases

@doskey ls = dir $*
@doskey cp = copy $*
@doskey clear = cls
@doskey mv = move $*
@doskey cat = type $*

:: Emacs

set EMACS_PATH=C:\Program Files (x86)\GNU Emacs\emacs-24.3\bin\

echo %EMACS_PATH%

@doskey emacs = %EMACS_PATH%runemacs.exe $*

endlocal
