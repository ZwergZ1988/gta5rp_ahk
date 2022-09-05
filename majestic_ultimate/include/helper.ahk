#Include  "%A_ScriptDir%\include\gui.ahk"

testGUI := Gui()

show_helper_gui() {
    global testGUI
    testGUI.Destroy()

    testGUI := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
    testGUI.BackColor := "black"

    CoordMode("Mouse", "Screen")
    MouseGetPos(&mouseXposScreen, &mouseYposScreen)

    CoordMode("Mouse", "Window")
    MouseGetPos(&mouseXposWindow, &mouseYposWindow)

    c := PixelGetColor(mouseXposWindow, mouseYposWindow)

    add_text_to_gui(testGUI, 15, 10, [{text:"x" . mouseXposScreen . " y" . mouseYposScreen . " x" . mouseXposWindow . " y" . mouseYposWindow . " " . c}])

    WinSetTransparent(180, testGUI)
    testGUI.Show("x" . mouseXposScreen . " y" . mouseYposScreen . " NoActivate")
}