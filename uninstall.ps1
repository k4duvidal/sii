# Remove som personalizado de logon

$RegPath = "HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogon\.Current"

Remove-ItemProperty -Path $RegPath -Name "(Default)" -ErrorAction SilentlyContinue

Write-Host "Som de logon restaurado para o padrao do Windows."
Read-Host "Pressione ENTER para sair"
