@echo off

call .tools\hMSBuild -GetNuTool /nologo /v:m /m:7 & (
    if [%~1]==[#] exit /B 0
)
call packages\vsSolutionBuildEvent\cim.cmd ~x ~c Release || (
    echo Failed>&2
    exit /B 1
)
exit /B 0