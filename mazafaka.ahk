neededColor := "0xC14F4F"
currentColor := "?"

berserkMode := "OFF"
mazafaka := "UP"
debug := "?"
shoot := "OFF"

testGUI := Gui()
;strelyay()
loops()


;*~$x::
!1:: ; Alt + 1
{
    global berserkMode
    
    if (berserkMode == "ON") {
        berserkMode := "OFF"
    } else {
        berserkMode := "ON"
    }
}

!R::
{
    Reload
}

loops() {
    while (true) {
        ;SetTimer display, 1 
        ;podrubay()
        ;shot()
        strelyay() 
    }    
}

display() {
    global debug
    global currentColor
    global berserkMode
    global testGUI
    global shoot

    testGUI.Destroy()

    testGUI := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
    testGUI.BackColor := "black"

    CoordMode("Mouse", "Screen")
    MouseGetPos(&mouseXposScreen, &mouseYposScreen)

    CoordMode("Mouse", "Window")
    MouseGetPos(&mouseXposWindow, &mouseYposWindow)

    c := PixelGetColor(mouseXposWindow, mouseYposWindow)

    add_text_to_gui(testGUI, 15, 10, [{text:"x" . mouseXposScreen . " y" . mouseYposScreen . " x" . mouseXposWindow . " y" . mouseYposWindow . " " . c}])
    add_text_to_gui(testGUI, 15, 25, [{text:berserkMode}])
    add_text_to_gui(testGUI, 15, 40, [{text:currentColor}])
    add_text_to_gui(testGUI, 15, 55, [{text:debug}])
    add_text_to_gui(testGUI, 15, 70, [{text:shoot}])

    WinSetTransparent(180, testGUI)
    testGUI.Show("x" . 1700 . " y" . 980 . " NoActivate")
    sleep(1000)
}

podrubay() {
    global currentColor
    global berserkMode
    global mazafaka
    global shoot
    global debug

    debug := "podrubay"

    if (berserkMode == "ON") { 
        currentColor := PixelGetColor(960, 540)
        if (currentColor == neededColor) { ; если тип в перекрестии -> врубай мазафаку
            if (mazafaka == "UP") { ; если мазафака вверху -> зажми мазафаку
                shoot := "ON"
                mazafaka := "DOWN"
            }
        } else { ; если типа в перекрестии нет -> вырубай мазафаку
            if (mazafaka == "DOWN") { ; если мазафака внизу -> отпусти мазафаку
                SetTimer(stop_shooting, 1000)
                mazafaka := "UP"
            }
        }
    }
}

strelyay() {
    global currentColor
    global berserkMode
    global debug

    debug := "strelyay"
    ;while(true) {
        if (berserkMode == "ON") { 
            currentColor := PixelGetColor(960, 540)
            if (currentColor == neededColor) { 
                MouseClick("Left", , , , , "D", )
                Sleep(100)
                MouseClick("Left", , , , , "U", )
            }
        }
    ;}
    
}

stop_shooting() {
    global shoot
    shoot := "OFF"
}

shot() {
    global shoot

    if (shoot == "ON") {
        MouseClick("Left", , , , , "D", )
        Sleep(1)
        MouseClick("Left", , , , , "U", )
    }
}

add_text_to_gui(myGui, coordX, coordY, textLines) {
    offsetY := 0
    for index, textLine in textLines {
        lineCoordinates := coordY+offsetY
        
        if (textLine.HasOwnProp("color")) {
            textColor := textLine.color
        } else {
            textColor := "cWhite"
        }

        if (textLine.HasOwnProp("height")) {
            lineHeight := textLine.height * 1.5
            myGui.SetFont("s" . textLine.height)
        } else {
            lineHeight := 9 * 1.5
            myGui.SetFont("s9")
        }
    
        
        if (textLine.HasOwnProp("style")) {
            if (textLine.style == "U") {
                myGui.SetFont("underline")
            }
        } else {
            myGui.SetFont("norm")
        }

        myGui.SetFont("w600")
        
        textText := textLine.text
        myGui.Add("Text", "x" . coordX . " y" . lineCoordinates . " " . textColor, textText)
        offsetY := offsetY + lineHeight
    }
    Return offsetY
}


;Color = 0xc14f4f
;*~$RButton::
;While GetKeyState("RButton")
;{
; PixelSearch,,, 960, 540, 960, 540, % Color,, Fast RGB
; If !ErrorLevel
; {
; Click down
; }
;else 
;{ 
;Click up
;}
;
;}
;ToolTip
;Return