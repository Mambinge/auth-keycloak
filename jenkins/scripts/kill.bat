@echo off
REM Read PID from .pidfile
set /p pid=<.pidfile

REM Check if PID is not empty
if "%pid%"=="" (
    echo PID file is empty or not found.
    exit /B 1
)

REM Kill the process with the retrieved PID
taskkill /PID %pid% /F

REM Check if taskkill was successful
if %ERRORLEVEL% EQU 0 (
    echo Process with PID %pid% has been terminated successfully.
) else (
    echo Failed to terminate process with PID %pid%.
    exit /B %ERRORLEVEL%
)
