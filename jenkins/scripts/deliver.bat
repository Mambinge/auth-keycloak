@echo off
REM Navigate to the project directory
cd /D %~dp0..

REM Install Angular CLI locally if not installed
npm install @angular/cli

REM Start the Angular application and capture the PID
REM Using PowerShell to start the process and get its PID
powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/c npm run start' -PassThru | Select-Object -ExpandProperty Id" > .pidfile

REM Check if the PID was successfully written
if exist .pidfile (
    echo Process started with PID:
    type .pidfile
) else (
    echo Failed to create .pidfile.
    exit /B 1
)
