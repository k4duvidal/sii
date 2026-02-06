# =====================================
# SII CR7 - Som no logon do Windows
# =====================================

# Caminho dinamico do audio (mesma pasta do script)
$SoundPath = Join-Path $PSScriptRoot "sii.wav"

# Verifica se o audio existe
if (!(Test-Path $SoundPath)) {
    Write-Host "Arquivo sii.wav nao encontrado na pasta do script."
    Write-Host "Certifique-se de que o sii.wav esteja na mesma pasta do install.ps1"
    Read-Host "Pressione ENTER para sair"
    exit
}

# Evento de logon do Windows
$RegPath = "HKCU:\AppEvents\Schemes\Apps\.Default\WindowsLogon\.Current"

# Cria a chave se nao existir
New-Item -Path $RegPath -Force | Out-Null

# Define o som
Set-ItemProperty -Path $RegPath -Name "(Default)" -Value $SoundPath

# Garante que o som de inicializacao esteja habilitado
Set-ItemProperty `
    -Path "HKCU:\AppEvents\Schemes" `
    -Name "ExcludeFromCPL" `
    -Value 0 `
    -Force

Write-Host "SII configurado com sucesso!"
Write-Host "O som tocara ao ligar o Windows."

Read-Host "Pressione ENTER para sair"
