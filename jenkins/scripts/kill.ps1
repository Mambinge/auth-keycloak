# Navigate to the project directory
Set-Location -Path "$PSScriptRoot\.."

# Check if .pidfile exists
if (!(Test-Path -Path ".pidfile")) {
    Write-Host ".pidfile not found. Cannot terminate process."
    exit 1
}

# Read PID from .pidfile
$pid = Get-Content -Path ".pidfile" -ErrorAction SilentlyContinue

# Check if PID is not empty
if ([string]::IsNullOrWhiteSpace($pid)) {
    Write-Host "PID file is empty."
    exit 1
}

# Attempt to kill the process
try {
    Stop-Process -Id $pid -Force
    Write-Host "Process with PID $pid has been terminated successfully."
    Remove-Item -Path ".pidfile"
} catch {
    Write-Host "Failed to terminate process with PID $pid."
    exit 1
}
