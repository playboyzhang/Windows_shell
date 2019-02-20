@echo off
set sourcePath=C:\Users\silly\Desktop\local\*.txt
for  %%i in (%sourcePath%) do (
@certutil -hashfile %%i md5 >>.\cl.txt
)
for /f "tokens=1* delims=:" %%a in ('findstr /n .* .\cl.txt') do (
    if "%%a"=="2" echo %%b
)


