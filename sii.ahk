#Persistent
SoundFile := A_ScriptDir "\sii.wav"

OnMessage(0x219, "WM_DEVICECHANGE")
return

WM_DEVICECHANGE(wParam, lParam)
{
    ; 0x8000 = conectado | 0x8004 = desconectado
    if (wParam = 0x8000 or wParam = 0x8004)
    {
        SoundPlay, %SoundFile%
    }
}
