::Do not ignore blank lines in the text
@echo off
for /f "tokens=1* delims=:" %%a in ('findstr /n .* a.txt') do (
   if "%%a"=="5" echo %%b
)
pause
::Ignore blank lines in text
@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%a in (a.txt) do (
  set /a falg+=1
  if !falg! equ 5 echo %%a
)
pause
