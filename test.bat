@echo off
set sourcePath=C:\Users\silly\Desktop\local\*.txt
for  %%i in (%sourcePath%) do (
@certutil -hashfile %%i md5 >>.\cl.txt
)
for /f  %%a in ('findstr "[a-z][0-9]*32"  .\cl.txt') do (
    echo %%a >>.\lo.txt
)
set /P local=<.\lo.txt
echo %local%
REM echo get the remote md5
REM set /P remote=<.\Log\remote.txt
REM echo %remote%




