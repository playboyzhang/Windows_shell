@echo off
setlocal enabledelayedexpansion

:loop
    echo.
    echo ----------------------------------------------------------
    echo press anykey to check current process...
    echo %~f1
    pause>nul
    type "%~f1"
goto loop

