Try{
    Import-Module PSWindowsUpdate -ErrorAction Stop
    Write-Host "PSWindowsUpdate module imported successfully." -ForegroundColor Green
    }
    Catch{
        Write-Host "PSWindowsUpdate module not found. Installing..." -ForegroundColor Yellow
        Install-Module PSWindowsUpdate -Force -AllowClobber
        Import-Module PSWindowsUpdate
        }

# Check for available updates
Write-Host "Checking for available updates..." -ForegroundColor Cyan
$updates = Get-WindowsUpdate

If ($updates) {
    Write-Host "The following updates are available:" -ForegroundColor Green
    $updates | ForEach-Object { Write-Host $_.Title }

    # Install all available updates
    Write-Host "Installing updates..." -ForegroundColor Cyan
    Install-WindowsUpdate -AcceptAll -AutoReboot -Verbose
}
Else {
    Write-Host "No updates available." -ForegroundColor Green
}

Write-Host "Windows Update process completed." -ForegroundColor Cyan