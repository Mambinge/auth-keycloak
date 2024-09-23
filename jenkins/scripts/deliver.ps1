# Navigate to the project directory
Set-Location -Path "$PSScriptRoot\.."

# Install Angular CLI locally if not installed
npm install @angular/cli

# Start the Angular application and capture the PID
$process = Start-Process -FilePath "cmd.exe" -ArgumentList "/c npm run start" -PassThru

# Write PID to .pidfile
$process.Id | Out-File -FilePath ".pidfile" -Encoding ascii

# Output PID
Write-Host "Process started with PID: $($process.Id)"
