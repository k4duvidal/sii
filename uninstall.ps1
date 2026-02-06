$BasePath = "$env:LOCALAPPDATA\SII-CR7"

Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\sii.ahk" -Force -ErrorAction SilentlyContinue
Remove-Item $BasePath -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "SII removido. Tudo voltou ao normal."
Read-Host
