#Include  "%A_ScriptDir%\..\include\gui.ahk"

CoordMode("Pixel", "Screen")

search_region_for_possible_icon(xStart, yStart, xEnd, yEnd, step, callback) {
  ;while (true) {
    hexColor := "0x000000"
    colors := {r:0,g:0,b:0}
    firstRun := true

    searching := true
    x := xStart
    y := yStart    
    while (searching) {
      if (x > xEnd) {
        x:=xStart
      }
      if (y > yEnd) {
        y:=yStart
      }
      oldColors := colors
      oldHexColor := hexColor
      hexColor := PixelGetColor(x, y)
      
      ;rect := draw_rectangle(x, y, 1, 1)            
      ;Sleep(100)
      ;rect.Destroy()
      
      colors := get_colors(hexColor)  
      if (firstRun) {
        firstRun := false
      } else {
        diff := get_colors_diff(oldColors, colors)
        if (diff > 150) {
          callback(x,y)
          searching := false
          Continue
        }
      }
      
      x := x + step
      if (x > xEnd) {
        y := y + step
      }
    }
  ;}
}

get_colors_diff(oldColors, newColors) {
  return Round((Abs(oldColors.r - newColors.r) + Abs(oldColors.g - newColors.g) + Abs(oldColors.b - newColors.b))/3)
}

build_info_display(resultText) {
    static myGui  := Gui()
    myGui.Destroy()
    myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
    myGui.BackColor := "black"


    add_text_to_gui(myGui, 5, 5, [{text: resultText}])

    WinSetTransparent(180, myGui)
    myGui.Show("x1000 y1000 NoActivate")
}

build_target_display(x, y) {
    myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
    myGui.BackColor := "white"


    add_text_to_gui(myGui, 10, 8, [{text: "O", color: "cBlack"}])

    WinSetTransparent(180, myGui)
    myGui.Show("x" . x . " y" . y . " NoActivate")
    Sleep(2000)
    myGui.Destroy()
}

get_colors(hexColor) {
  rHex := SubStr(hexColor,3,2)
  gHex := SubStr(hexColor,5,2)
  bHex := SubStr(hexColor,7,2)  
  return {r: Integer("0x" . rHex), g: Integer("0x" . gHex), b: Integer("0x" . bHex)}
}