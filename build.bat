::! Copyright (c) 2015  Denis Kuzmin <x-3F@outlook.com> github/3F
::! Copyright (c) 7z.Libs contributors https://github.com/3F/7z.Libs/graphs/contributors
::! Licensed under the MIT License (MIT).
::! See accompanying License file or visit https://github.com/3F/7z.Libs
@echo off
set "target7zVersion="

call .tools\hMSBuild -GetNuTool & (
    if [%~1]==[#] exit /B 0
)

if "%~1"=="--target-version" set "target7zVersion=%~2"
call packages\vsSolutionBuildEvent\cim.cmd ~x ~c Release || (
    echo Failed>&2
    exit /B 1
)
exit /B 0