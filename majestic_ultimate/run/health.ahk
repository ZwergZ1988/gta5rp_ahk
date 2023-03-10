#SingleInstance
#Include  "%A_ScriptDir%\..\include\gui.ahk"

;send_message_to_parallel_script("info_display.ahk", 1, 0)
CoordMode("Pixel", "Screen")

health := {
  h: 100,
  a: 100
}

rect := Gui()
while (true) {
  x := 1
  rects := []
  h := 0
  while ( x <= 131) {
    hexColor := PixelGetColor(x, 1074)
    colors := get_colors(hexColor)
    if (colors.g > 100) {
      h := h + 10
    }
    x := x + 13
  } 
  rect.Destroy()
  rect := draw_rectangle(10, 10, h*19, 20, "green", 255)    
}



get_colors(hexColor) {
  rHex := SubStr(hexColor,3,2)
  gHex := SubStr(hexColor,5,2)
  bHex := SubStr(hexColor,7,2)  
  return {r: Integer("0x" . rHex), g: Integer("0x" . gHex), b: Integer("0x" . bHex)}
}