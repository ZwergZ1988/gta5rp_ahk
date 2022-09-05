#Include  "%A_ScriptDir%\..\include\run.ahk"

triggerType := "OFF"

OnMessage(0x0400, receiveNewTriggerType)

while(true) {
    swith (triggerType) {
        case "BFT": ; brute force taping
            ; do taping
    }
}

receiveNewTriggerType(wParam, lParam, msg, hwnd) {
    global triggerType

    switch(wParam) {
        case 0:
            triggerType := "OFF"
        case 1:
            triggerType := "BFT"
    }
}



