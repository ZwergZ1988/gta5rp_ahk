#SingleInstance
#Include  "%A_ScriptDir%\..\include\run.ahk"

triggerMode := "OFF"
triggerModeReceived := "OFF"
oldTriggerMode := "OFF" 

OnMessage(0x0400, receiveNewTriggerMode)

while(true) {
    triggerMode := triggerModeReceived
    switch (triggerMode) {
        case "BFT": ; brute force taping
            MouseClick("Left", , , , , "D", )
            Sleep(100)
            MouseClick("Left", , , , , "U", )
        case "HLD": ; hold
            if (oldTriggerMode != triggerMode) {
                MouseClick("Left", , , , , "D", )
            }
        case "OFF":
            if (oldTriggerMode == "HLD") {
                MouseClick("Left", , , , , "U", )
            }
    }
    oldTriggerMode := triggerMode
}

receiveNewTriggerMode(wParam, lParam, msg, hwnd) {
    global triggerModeReceived

    switch (wParam) {
        case 0:
            triggerModeReceived := "OFF"
        case 1:
            triggerModeReceived := "BFT"
        case 2:
            triggerModeReceived := "HLD"
    }
}
