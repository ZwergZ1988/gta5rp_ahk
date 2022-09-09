#SingleInstance
#Include  "%A_ScriptDir%\..\include\run.ahk"

triggerOnOff := "OFF"
triggerStatusSent := 0 ; OFF
triggerModeSent := 0

neededColor := "0xC14F4F"
currentColor := "?"

OnMessage(0x0400, receiveTriggerOnOff)

while(true) {
    switch (triggerOnOff) {
        case "OFF": 
            sendTriggerMode(0) ; OFF
        case "ON": 
            currentColor := PixelGetColor(960, 540)
            if (currentColor == neededColor) {
                ;sendTriggerMode(1) ; BFT
                sendTriggerMode(2) ; HLD
            } else { 
                sendTriggerMode(0) ; OFF
            }
    }
}

sendTriggerMode(newMode) {
    global triggerModeSent
    if (triggerModeSent != newMode) {
        send_message_to_parallel_script("trigger.ahk", newMode, 0)
        triggerModeSent := newMode
    }
}

receiveTriggerOnOff(wParam, lParam, msg, hwnd) {
    global triggerOnOff

    switch (wParam) {
        case 0:
            triggerOnOff := "OFF"
            send_message_to_parallel_script("info_display.ahk", 1, 0)
        case 1:
            triggerOnOff := "ON"
            send_message_to_parallel_script("info_display.ahk", 1, 1)
    }
}
