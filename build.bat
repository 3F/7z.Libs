::! Copyright (c) 2015  Denis Kuzmin <x-3F@outlook.com> github/3F
::! Copyright (c) 7z.Libs contributors https://github.com/3F/7z.Libs/graphs/contributors
::! Licensed under the MIT License (MIT).
::! See accompanying License file or visit https://github.com/3F/7z.Libs

:: based on https://github.com/3F/netfx4sdk
@echo off

set args=%*
set /a EXIT_CODE=0
set /a ERROR_INVALID_KEY_OR_VALUE=1200
setlocal enableDelayedExpansion

set "target7zVersion="
set /p artefactsSrc=<.artefacts

if not defined args goto action

:: /? will cause problems for the call commands below, so we just escape this via supported alternative:
set esc=!args:/?=-h!

call :initargs arg esc amax
goto commands

:usage
echo.
echo  --target-version X.Y[.v]
echo        %~n0 --target-version 25.1.3
echo.
echo  --artefacts-src ( gh ^| *sf )
echo        %~n0 --artefacts-src gh --target-version 26.02
echo.
echo  %~n0 #
echo.
echo  --help -h -? /?
goto endpoint

:commands
set /a idx=0

:loopargs
set key=!arg[%idx%]!

    if [!key!]==[--help] ( goto usage ) else if [!key!]==[-h] ( goto usage ) else if [!key!]==[-?] ( goto usage )
    :: -

    if [!key!]==[#] (
        goto continue
    ) else if [!key!]==[--target-version] ( set /a "idx+=1" & call :eval arg[!idx!] v

        set target7zVersion=!v!
        goto continue
    ) else if [!key!]==[--artefacts-src] ( set /a "idx+=1" & call :eval arg[!idx!] v

        set artefactsSrc=!v!
        goto continue
    ) else (
        call :warn "Invalid key or value for '!key!'"
        set /a EXIT_CODE=%ERROR_INVALID_KEY_OR_VALUE%
        goto usage
    )

:continue
set /a "idx+=1" & if %idx% LSS !amax! goto loopargs

:action

    call .tools\hMSBuild -GetNuTool & (
        if [%~1]==[#] exit /B 0
    )

    call packages\vsSolutionBuildEvent\cim.cmd ~x ~c Release || (
        echo Failed>&2
        exit /B 1
    )

    set /a EXIT_CODE=!ERRORLEVEL!

:endpoint
exit /B !EXIT_CODE!


:: Functions
:: TODO: merge with a.bat
:: ::

:warn {in:msg}
    set _wrnmsg=%~1
    set _wrnmsg=!_wrnmsg:`="!
    echo   [*] WARN: !_wrnmsg! >&2
exit /B 0

:initargs {in:vname} {in:arguments} {out:index}
    :: Usage: 1- the name for variable; 2- input arguments; 3- max index

    set _ieqargs=!%2!

    :: unfortunately, we also need to protect the equal sign '='
    :_eqp
    for /F "tokens=1* delims==" %%a in ("!_ieqargs!") do (
        if "%%~b"=="" (
            call :nqa %1 !_ieqargs! %3 & exit /B 0
        ) else set _ieqargs=%%a E %%b
    )
    goto _eqp
    :nqa

    set "vname=%~1"
    set /a idx=-1

    :_initargs
        :: -
        set /a idx+=1
        set %vname%[!idx!]=%~2
        set %vname%{!idx!}=%2

        :: NOTE1: 'shift & ...' may be evaluated incorrectly without {newline} symbols;
        ::         Either shift + {newline} + ... + if %~3 ...; or if %~4 ... shift & ...

        :: NOTE2: %~4 because the next %~3 is reserved for {out:index}
        if "%~4" NEQ "" shift & goto _initargs

    set %3=!idx!
exit /B 0

:eval {in:unevaluated} {out:evaluated}
    :: Usage: 1- input; 2- evaluated output

    :: delayed evaluation
    set _vl=!%1!
    if not defined _vl set %2=&exit/B0

    :: data from %..% below should not contain double quotes, thus we need to protect this:

    set "_vl=%_vl: T =^%"
    set "_vl=%_vl: L =^!%"
    set _vl=!_vl: E ==!

    set %2=!_vl!
exit /B 0