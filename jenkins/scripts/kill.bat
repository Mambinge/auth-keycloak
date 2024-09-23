@echo off
REM Navigate to the project directory
cd /D %~dp0..

REM Check if .pidfile exists
if not exist .pidfile (
    echo .pidfile not found. Cannot terminate process.
    exit /B 1
)

REM Read PID from .pidfile
set /p pid=<.pidfile

REM Check if PID is not empty
if "%pid%"=="" (
    echo PID file is empty.
    exit /B 1
)

REM Kill the process with the retrieved PID
taskkill /PID %pid% /F

REM Check if taskkill was successful
if %ERRORLEVEL% EQU 0 (
    echo Process with PID %pid% has been terminated successfully.
    del .pidfile
) else (
    echo Failed to terminate process with PID %pid%.
    exit /B %ERRORLEVEL%
)
