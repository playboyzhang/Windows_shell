@echo off
set sourcePath=C:\Users\silly\Desktop\local\*.txt
for  %%i in (%sourcePath%) do (
@certutil -hashfile %%i md5 >>.\cl.txt
)
for /f "tokens=1* delims=:" %%a in ('findstr "[a-z][0-9]*32"  .\cl.txt') do (
    echo %%a
)


