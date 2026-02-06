# Caminho dinamico do audio
$SoundPath = Join-Path $PSScriptRoot "sii.wav"

if (!(Test-Path $SoundPath)) {
    Write-Host "Arquivo sii.wav nao encontrado."
    Read-Host
    exit
}

# Pasta de inicializacao do usuario
$Startup = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

# Script que toca o som
$PlayScript = Join-Path $Startup "sii-cr7.ps1"

@"
Add-Type -AssemblyName presentationCore
\$player = New-Object System.Windows.Media.MediaPlayer
\$player.Open('$SoundPath')
\$player.Play()
Start-Sleep -Seconds 6
"@ | Out-File $PlayScript -Encoding UTF8 -Force

Write-Host "SII configurado para tocar apos o login."
Read-Host
