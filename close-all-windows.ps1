# Get the current PowerShell process ID to avoid closing it
$currentProcessId = $PID

# Get all processes with a main window title (indicative of a user interface)
$processes = Get-Process | Where-Object { $_.MainWindowTitle -ne "" -and $_.Id -ne $currentProcessId }

foreach ($process in $processes) {
    # Try to close the main window
    $null = $process.CloseMainWindow()

    # Wait a little bit to see if the window closes
    Start-Sleep -Seconds 2

    # Check if the process has exited
    if (!$process.HasExited) {
        # Forcefully terminate the process if it is still running
        $process | Stop-Process -Force
    }
}
