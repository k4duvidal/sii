# ===============================
# SII CR7 - Instalador
# ===============================

$BasePath = "$env:LOCALAPPDATA\SII-CR7"
$SoundPath = "$BasePath\sii.wav"

# Cria pasta
New-Item -ItemType Directory -Path $BasePath -Force | Out-Null

# Copia o audio para local seguro
Copy-Item "$PSScriptRoot\sii.wav" $SoundPath -Force

# Script que toca o som
$PlayerScript = "$BasePath\play.ps1"

@"
Add-Type -AssemblyName presentationCore
\$player = New-Object system.windows.media.mediaplayer
\$player.open('$SoundPath')
\$player.Play()
Start-Sleep -Seconds 5
"@ | Out-File $PlayerScript -Encoding UTF8 -Force

# === CRIA TAREFA: USB CONECTADO ===
schtasks /create /f `
 /sc ONEVENT `
 /ec "Microsoft-Windows-DriverFrameworks-UserMode/Operational" `
 /mo "*[System[(EventID=2003)]]" `
 /tn "SII_USB_CONNECT" `
 /tr "powershell.exe -ExecutionPolicy Bypass -File `"$PlayerScript`""

# === CRIA TAREFA: USB DESCONECTADO ===
schtasks /create /f `
 /sc ONEVENT `
 /ec "Microsoft-Windows-DriverFrameworks-UserMode/Operational" `
 /mo "*[System[(EventID=2100)]]" `
 /tn "SII_USB_DISCONNECT" `
 /tr "powershell.exe -ExecutionPolicy Bypass -File `"$PlayerScript`""

Write-Host "SII instalado com sucesso!"
Write-Host "Agora ao conectar OU desconectar USB:"
Write-Host "SIIIIIIIIIIII ⚽🔥"

Read-Host "Pressione ENTER para sair"
