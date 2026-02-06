$BasePath = "$env:LOCALAPPDATA\SII-CR7"
New-Item -ItemType Directory -Path $BasePath -Force | Out-Null

Copy-Item "$PSScriptRoot\sii.wav" $BasePath -Force
Copy-Item "$PSScriptRoot\sii.ahk" $BasePath -Force

# Baixa AutoHotkey automaticamente
$AhkUrl = "https://www.autohotkey.com/download/ahk-install.exe"
$AhkInstaller = "$BasePath\ahk-install.exe"
Invoke-WebRequest $AhkUrl -OutFile $AhkInstaller

Start-Process $AhkInstaller -Wait

# Inicia com o Windows
$Startup = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
Copy-Item "$BasePath\sii.ahk" $Startup -Force

Write-Host "SII instalado com sucesso!"
Write-Host "Conecte ou desconecte um USB para testar."

Read-Host
