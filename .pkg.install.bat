::! Copyright (c) 2015  Denis Kuzmin <x-3F@outlook.com> github/3F
::! Copyright (c) 7z.Libs contributors https://github.com/3F/7z.Libs/graphs/contributors
::! Licensed under the MIT License (MIT).
::! See accompanying License file or visit https://github.com/3F/7z.Libs
@echo off

:: Arguments: https://github.com/3F/GetNuTool?tab=readme-ov-file#touch--install--run
:: 1 tmode "path to the working directory" "path to the package"
if "%~1" LSS "1" echo Version "%~1" is not supported.>&2 & exit /B1

set "tmode=%~2"
set "wdir=%~3"
set "pdir=%~4"

set "filter="
setlocal enableDelayedExpansion

if not defined use (

    if "%tmode%"=="touch" (
        call :xcopyX x64
        call :xcopyX x86
    )

) else (

    call :parseUseCommand xcmd filter
    if [!xcmd!]==[help] ( goto help ) else if [!xcmd!]==[?] ( goto help )

    set "tilde="
    if "!xcmd:~0,1!"=="~" (
        set "xcmd=!xcmd:~1!"
        set "tilde=~"
    )

    call :detectShiftedFilter xcmd filter || goto :error

    if "!xcmd!"=="x64" (
        call :xcopyX x64 !tilde!

    ) else if "!xcmd!"=="x86" (
        call :xcopyX x86 !tilde!

    ) else if "!xcmd!"=="x32" (
        call :xcopyX x86 !tilde!
        if not defined tilde ren x86 x32

    ) else if "!xcmd!"=="" (

        call :xcopyX x64 !tilde!
        if defined tilde call :renameDllsAs x64

        call :xcopyX x86 !tilde!
        if defined tilde call :renameDllsAs x86

    ) else if "!xcmd!"=="-" (
        exit /B 0

    ) else (
        echo "!xcmd!" is not supported in 7z.Libs>&2 & exit /B1
    )
)

if "%tmode%"=="touch" call :noteLicense
exit /B 0

:detectShiftedFilter
    :: -p:use=7z or -p:use=~7z in addition to -p:use=:7z or -p:use=~:7z respectively
    :: &(1) cmd
    :: &(2) filter
    if not "!%1!"=="7z" if not "!%1!"=="7za" if not "!%1!"=="7zxa" exit /B 0
    if not "!%~2!"=="" exit /B 1
    set "%2=!%1!"
    set "%1="
exit /B 0

:xcopyX
    :: (1) arch
    :: [2] optional flag to expand subfolder if defined anything e.g. tilde (~) etc
    if "%~2"=="" set "_subfolder=%~1"
    call :xcopyDirOrFile "%pdir%\bin\%~1" "!filter!" !_subfolder!
exit /B 0

:xcopyDirOrFile
    :: (1) input directory
    :: (2) filter to file or nothing
    :: [3] optional output directory

    set "_file=%~2"
    if defined _file set "_file=%~2.dll"

    set "_odir=%~3"
    if defined _odir set "_odir=%~3\"

    if defined _file (
        call :xcopy "%~1\!_file!" "!_odir!!_file!"
    ) else (
        call :xcopy "%~1" "!_odir!"
    )
exit /B 0

:xcopy
    :: xcopy: including the readonly (/R) attr
    :: (1) input file
    :: [2] optional new name
    echo F | xcopy "%~1" "%wdir%%~2" /Y/R/V/I/Q 2>nul>nul || goto :error
exit /B 0

:renameDllsAs
    :: (1) postfix
    ren 7z.dll 7z.%~1.dll 2>nul>nul
    ren 7za.dll 7za.%~1.dll 2>nul>nul
    ren 7zxa.dll 7zxa.%~1.dll 2>nul>nul
exit /B 0

:noteLicense
    if "%info%"=="no" exit /B 0
    if "%licenseNote%"=="false" exit /B 0

    echo Note: License files are not provided in "%tmode%" mode. Review it manually or use other modes.
    set "licenseNote=false"
exit /B 0

:error
exit /B 1

:parseUseCommand
    :: &(1) - output main command
    :: &[2] - optional. output filter

    :: keep the first space because, for example, `:7z`
    for /f "tokens=1-2 delims=:" %%a in (" %use%") do (
        call :trim _t %%a & set "%1=!_t!"
        call :trim _t %%b & set "%2=!_t!"
    )
exit /B 0

:trim
    set "%1=%~2"
exit /B 0

:help
    echo.
    echo `touch` mode (~7z.Libs) and -p:use=
    echo Syntax: [~] (arch ^| alias ^| command) [:filter]
    echo Details: https://github.com/3F/7z.Libs
    echo.
    echo For example,
    echo.& echo   gnt ~7z.Libs
    echo.& echo   gnt ~7z.Libs -p:use=~
    echo.& echo   gnt ~7z.Libs -p:use=x64
    echo.& echo   gnt ~7z.Libs -p:use=~x64
    echo.& echo   gnt ~7z.Libs -p:use=~x64:7z
    echo.& echo   gnt ~7z.Libs -p:use=~7z
    echo.& echo   gnt ~7z.Libs -p:use=x32
    echo.& echo   gnt ~7z.Libs -p:use=7z
    echo.& echo   gnt ~7z.Libs -p:use=~x86:7zxa
exit /B 0