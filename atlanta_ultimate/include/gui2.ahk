build_gui_2() {
  myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
  myGui.BackColor := "black"

  coordY := 5
  offsetY := add_text_to_gui(myGui, 1750, coordY, [
    {text: "Alt + R Reload/Stop"},
    {text: ""},
    {text: "Alt + 1 toggle_gui(1)"},
    {text: "Alt + 2 toggle_gui(2)"},
    {text: "Alt + 3 поиск по УАК/ДК"},
    {text: "Alt + 4 GUI helper"},
    {text: "Alt + 8 start_alarm()"},
    {text: "Alt + 9 start_timer()"},
    {text: "Alt + 0 disable_timer()"},
    {text: ""},
    {text: "Alt + F5 миранда"},
    {text: "Alt + F7 арест ФТ"},
    {text: "Alt + F8 арест КПЗ"},
    {text: ""},
    {text: "Shift + F2 ((откат))"},
    {text: "Shift + F3 ((голос сломался))"},
    {text: "Shift + F4 ((discord))"},
    {text: "Shift + F5 жетон"},
    {text: "Shift + F6 какой жетон?"},
    {text: "Shift + F7 обыск"},
    {text: "Shift + F8 обыск багажник"},
    {text: "Shift + F9 проверка угона"},
    {text: "Shift + F10 ((заливаю за ПГ))"},
    {text: "Shift + F11 мегафон"},
    {text: "Shift + F12 Pause"},
  ])

  WinSetTransparent(180, myGui)
  return myGui
}