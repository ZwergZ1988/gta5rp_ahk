currentGUI := Gui()
testGUI := Gui()
currentGUIAktion := "BEGIN"
gui1 := build_gui_1()
gui2 := build_gui_2()

show_helper_gui() {
  global testGUI
  testGUI.Destroy()

  testGUI := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
  testGUI.BackColor := "black"

  CoordMode("Mouse", "Screen")
  MouseGetPos(&mouseXposScreen, &mouseYposScreen)

  ;       y876
  ; x31           x296
  ;       y1046

  CoordMode("Mouse", "Window")
  MouseGetPos(&mouseXposWindow, &mouseYposWindow)

  c := PixelGetColor(mouseXposWindow, mouseYposWindow)

  add_text_to_gui(testGUI, 10, 5, [{text:"Screen: x" . mouseXposScreen . " y" . mouseYposScreen}])
  add_text_to_gui(testGUI, 10, 20, [{text:"Window: x" . mouseXposWindow . " y" . mouseYposWindow}])
  add_text_to_gui(testGUI, 10, 35, [{text:"Color: " . c}])

  WinSetTransparent(180, testGUI)
  testGUI.Show("x" . mouseXposScreen . " y" . mouseYposScreen . " NoActivate")
}

add_text_to_gui_coord(myGui, coord, textLines) {
  global screenResolution
  add_text_to_gui(myGui, coord[screenResolution].x, coord[screenResolution].y, textLines)
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

toggle_gui(tGui) {
  global currentGUI
  global currentGUIAktion

  if (currentGUIAktion == "DESTROY") {
    currentGUI.Destroy()
  }

  if (currentGUIAktion == "HIDE") {
    currentGUI.Hide()
    currentGUIAktion := "HIDDEN"
  }

  if (currentGUI == tGui) {
    currentGUI := Gui()
    return
  }

  tGui.Show("x0 y0 NoActivate")
  currentGUI := tGui
  currentGUIAktion := "HIDE"
}