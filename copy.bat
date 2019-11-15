@echo off
setlocal enabledelayedexpansion


call "DateTime.bat"
set log=".\Log\!DateTime!.txt"
mkdir ".\Log\"
echo.>!log!

echo start time: %date% %time%>>!log!
echo.
echo.
echo checking in progress, please don't close...
echo you can check process by viewing file: !log!.

start "LogViewer" LogViewer.bat !log!

for /f "delims=, tokens=1-3" %%i in (host.txt) do (
echo Now begin to download from %%k
REM @pscp  -r -pw  %%i %%j@%%k:/tmp/*.txt C:\Users\silly\Desktop\
echo get the local md5
set sourcePath=C:\Users\silly\Desktop\local\*.txt
for  %%i in (%sourcePath%) do (
@certutil -hashfile %%i md5 >>.\log\local.txt
)
for /f  %%a in ('findstr "[a-z][0-9]*32" .\log\local.txt') do (
    echo %%a >>.\local.txt
)
echo on
echo %local%
echo get the remote md5
@plink -pw %%i %%j@%%k "md5sum /tmp/*.txt | cut -d ' ' -f 1 " >.\log\remote.txt
set /P remote=<.\Log\remote.txt
echo %remote%
REM if "%local%"=="%remote%" (
REM echo Now begin to delete from %%k
REM @plink -pw %%i %%j@%%k "rm /tmp/test.txt"
REM finish the process from %%k
REM ) else (echo "文件有损坏请检查并重新下载")
)>>!log!

echo.
echo.
echo Complete^^! Log file: !log!.
pause