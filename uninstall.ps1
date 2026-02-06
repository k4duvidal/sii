# ===============================
# SII CR7 - Desinstalador
# ===============================

$BasePath = "$env:LOCALAPPDATA\SII-CR7"

# Remove tarefas
schtasks /delete /tn "SII_USB_CONNECT" /f 2>$null
schtasks /delete /tn "SII_USB_DISCONNECT" /f 2>$null

# Remove arquivos
Remove-Item $BasePath -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Tudo removido."
Write-Host "Windows voltou ao comportamento normal."

Read-Host "Pressione ENTER para sair"
