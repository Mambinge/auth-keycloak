# Navigate to the project directory
Set-Location -Path "$PSScriptRoot\.."

# Check if .pidfile exists
if (Test-Path ".pidfile") {
    Write-Host ".pidfile exists. Reading PID..."

    # Read PID from .pidfile
    $processId = Get-Content -Path ".pidfile" -ErrorAction SilentlyContinue

    # Check if PID is not empty or null
    if (-not [string]::IsNullOrWhiteSpace($processId)) {
        Write-Host "The process ID stored in .pidfile is $processId."

        # Attempt to kill the process
        try {
            Stop-Process -Id $processId -Force
            Write-Host "Process with PID $processId has been terminated successfully."
            Remove-Item -Path ".pidfile"
        } catch {
            Write-Host "Failed to terminate process with PID $processId."
            exit 1
        }
    } else {
        Write-Host ".pidfile is empty. No process to terminate."
    }
} else {
    Write-Host ".pidfile does not exist. No process to terminate."
}
