@echo off

set reltype=%1
set cim=packages\vsSolutionBuildEvent\cim.cmd
set _gnt=tools\gnt

if "%reltype%"=="" (
    set reltype=Release
)

call %_gnt% /p:wpath="%cd%" /p:ngconfig="packages.config" /nologo /v:m /m:4 || goto err
call %cim% "7z.Libs.sln" /v:m /m:4 /p:Configuration="%reltype%" /p:Platform="Any CPU" || goto err

exit /B 0

:err

echo. Build failed. 1>&2
exit /B 1