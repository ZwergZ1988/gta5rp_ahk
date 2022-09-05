#Include  "%A_ScriptDir%\..\include\gui.ahk"
#SingleInstance
OnMessage(0x0400, receiveNewInfo)

infoRows := [
    "INFO",
    ""
]

build_info_display()

receiveNewInfo(wParam, lParam, msg, hwnd) {
    global timerStatus
    if (lParam == 1) {
        infoRows[2] := "START"
    }
    if (lParam == 2) {
        infoRows[2] := "DISABLE"
    }
    return true
}

build_info_display() {
    global infoRows
    myGui := Gui()
    while (true) {
        myGui.Destroy()

        myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
        myGui.BackColor := "black"


        yPosition := 5
        for infoRow in infoRows {
            add_text_to_gui(myGui, 7, yPosition, [{text:infoRow, height:10}])
            yPosition := yPosition + 15
        }

        WinSetTransparent(180, myGui)
        myGui.Show("x-1911 y464 NoActivate")

        Sleep 1000
    }
}
