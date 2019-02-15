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
rem 需手动安装pscp与plink软件包，%%i代表密码字段，%%j代表用户名字段，%%k代表ip字段
for /f "delims=, tokens=1-3" %%i in (host.txt) do (
echo Now begin to download from %%k
@pscp  -r -pw  %%i %%j@%%k:/tmp/test.txt C:\Users\silly\Desktop\
echo Now begin to delete from %%k
@plink -pw %%i %%j@%%k "rm /tmp/test.txt"
echo finish the process from %%k
)>>!log!

echo.
echo.
echo Complete^^! Log file: !log!.
pause