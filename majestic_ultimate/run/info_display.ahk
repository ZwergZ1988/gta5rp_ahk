#SingleInstance
#Include  "%A_ScriptDir%\..\include\gui.ahk"
#Include  "%A_ScriptDir%\..\include\config.ahk"
OnMessage(0x0400, receiveNewInfo)

set_config_prafix("..\")
displayPosX := config_read("INFO DISPLAY", "position_x")
displayPosY := config_read("INFO DISPLAY", "position_y")

infoData := {
    title: "INFO",
    trigger: {status: "OFF", color: "cRed"}
}

build_info_display()

receiveNewInfo(wParam, lParam, msg, hwnd) {
    global infoData

    switch (wParam) {
        case 1:
            switch (lParam) {
                case 0:
                    infoData.trigger.status := "OFF"
                    infoData.trigger.color := "cRed"
                case 1:
                    infoData.trigger.status := "ON"
                    infoData.trigger.color := "cGreen"
            }
    }
    return true
}

convert_info_data_to_text_rows(infoData) {
    textRows := []

    textRows.push({x:7, y:7, rows:[{text: infoData.title, style: "U"}]})
    
    textRows.push({x:7, y:21, rows:[{text: "TRIGGER"}]})
    textRows.push({x:70, y:21, rows:[{text: infoData.trigger.status, color:infoData.trigger.color}]})

    return textRows
}

build_info_display() {
    global infoData
    myGui := Gui()
    while (true) {
        myGui.Destroy()

        myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
        myGui.BackColor := "black"


        infoRows := convert_info_data_to_text_rows(infoData)
        for infoRow in infoRows {
            add_text_to_gui(myGui, infoRow.x, infoRow.y, infoRow.rows)
        }

        WinSetTransparent(180, myGui)
        myGui.Show("x" . displayPosX . " y" . displayPosY . " NoActivate")

        Sleep 1000
    }
}
