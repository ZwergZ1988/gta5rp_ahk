#SingleInstance Off
#Include  "%A_ScriptDir%\..\include\rybalka_func.ahk"
#Include  "%A_ScriptDir%\..\include\gui.ahk"
OnMessage(0x0400, receiveRybalkaCommand)
CoordMode("Pixel", "Screen")

workingStatus := 0

xStart := 0
yStart := 0
xEnd := 0
yEnd := 0

while (workingStatus == 0) {
  ; ждем назначения области поиска
}

while (workingStatus > 0) {
  if (workingStatus == 2) {
    ; пауза поиска
    Continue
  }


  ; координаты получены - ищем
  step := 5
  callback := found_possible_icon
  search_region_for_possible_icon(xStart, yStart, xEnd, yEnd, step, callback)
}

found_possible_icon(x,y) {
  global workingStatus
  workingStatus := 2
  rect := draw_rectangle(x-2, y-2, 5, 5)
  ;MsgBox("x" . x . " y" . y, "hello", "T3")
  Sleep(3000)
  rect.Destroy()
}

receiveRybalkaCommand(wParam, lParam, msg, hwnd) {
  global workingStatus
  global xStart
  global yStart
  global xEnd
  global yEnd
  switch(wParam) {
    case 1: ; назначение xStart
      xStart := lParam
    case 2: ; назначение yStart
      yStart := lParam
    case 3: ; назначение xEnd
      xEnd := lParam
    case 4: ; назначение yEnd
      yEnd := lParam
    case 5: ; вкл выкл пауза
      workingStatus := lParam
  }
  return true
}