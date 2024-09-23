@echo off
REM Navigate to the project directory if not already there
cd /D %~dp0..

REM Install Angular CLI locally if not installed
npm install @angular/cli

REM Run the Angular build
npx ng build --prod

REM Check if the build was successful
if %ERRORLEVEL% EQU 0 (
    echo Angular build completed successfully.
) else (
    echo Angular build failed.
    exit /B %ERRORLEVEL%
)
