Gui, Color, Red
Gui, Font, s12 Bold, Arial
Gui, Add, Text,, Enter your code:
Gui, Add, Edit, vUserCode,
Gui, Add, Button, Default gOpenScript, Open

CorrectCode := "2025"

Gui, Show, w300 h150 Center, TriggerBot Menu
Return

OpenScript:
Gui, Submit, NoHide
if (UserCode = CorrectCode)
{
    MsgBox, 64, Success, Code accepted! Triggerbot enabled.
    SetTimer, TriggerBot, 10
}
else
{
    MsgBox, 16, Error, Invalid code. Try again.
}
Return

TriggerBot:
if (GetKeyState("q", "P"))
{
    MouseGetPos, MouseX, MouseY
    PixelGetColor, ColorCheck, (MouseX + 2), (MouseY + 2), RGB

    ColorR := (ColorCheck >> 16) & 0xFF
    ColorG := (ColorCheck >> 8) & 0xFF
    ColorB := ColorCheck & 0xFF

    Brightness := (ColorR + ColorG + ColorB) / 3

    if (Brightness <= 20 || Brightness >= 130)
    {
        Send {LButton}
        Sleep, 50
    }
}
Return

GuiClose:
ExitApp
