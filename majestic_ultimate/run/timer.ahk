#Include  "%A_ScriptDir%\..\include\gui.ahk"
#SingleInstance
OnMessage(0x0400, receiveNewTimerStatus)

timerStatus := "DISABLED"

build_timer()

receiveNewTimerStatus(wParam, lParam, msg, hwnd) {
    global timerStatus
    if (lParam == 1) {
        timerStatus := "START"
    }
    if (lParam == 2) {
        timerStatus := "DISABLE"
    }
    return true
}

build_timer() {
    global timerStatus
    myGui := Gui()
    While (true) {
        if (timerStatus == "START") {
            startTimeStamp := 0
            timeBuffer := FormatTime(, "HH")
            startTimeStamp := startTimeStamp + timeBuffer * 3600
            timeBuffer := FormatTime(, "mm")
            startTimeStamp := startTimeStamp + timeBuffer * 60
            timeBuffer := FormatTime(, "ss")
            startTimeStamp := startTimeStamp + timeBuffer
            timerStatus := "STARTED"
        }
        if (timerStatus == "STARTED") {
            timeStamp := 0
            timeBuffer := FormatTime(, "HH")
            timeStamp := timeStamp + timeBuffer * 3600
            timeBuffer := FormatTime(, "mm")
            timeStamp := timeStamp + timeBuffer * 60
            timeBuffer := FormatTime(, "ss")
            timeStamp := timeStamp + timeBuffer

            secondsGone := timeStamp - startTimeStamp
            hoursGone := Floor(secondsGone / 3600)
            secondsGone := secondsGone - hoursGone * 3600
            minutesGone := Floor(secondsGone / 60)
            secondsGone := secondsGone - minutesGone * 60

            hoursGone := SubStr("0" . hoursGone, -2)
            minutesGone := SubStr("0" . minutesGone, -2)
            secondsGone := SubStr("0" . secondsGone, -2)

            timeGone := hoursGone . ":" . minutesGone . ":" . secondsGone

            myGui.Destroy()

            myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
            myGui.BackColor := "black"

            add_text_to_gui(myGui, 15, 10, [{text:timeGone, height:20}])

            WinSetTransparent(180, myGui)
            myGui.Show("x1780 y930 NoActivate")
        }
        if (timerStatus == "DISABLE") {
            myGui.Hide()
            timerStatus := "DISABLED"
        }
        Sleep 1000
    }
}
