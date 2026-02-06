Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\sii-cr7.ps1" `
 -Force -ErrorAction SilentlyContinue

Write-Host "SII removido."
Read-Host
