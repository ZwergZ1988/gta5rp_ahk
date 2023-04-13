build_gui_2() {
  myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
  myGui.BackColor := "black"

  coordY := 5
  offsetY := add_text_to_gui(myGui, 10, coordY, [
    {text: "РМ - белый цвет."},
    {text: "МЕКС - зеленый верх, черный низ."},
    {text: "АРМ - черный цвет."},
    {text: "ЛКН - серый цвет."},
    {text: "ЯПОН - красный верх, белый низ."},
    {text: ""},
    {text: "YOUNG - голуб. верх, черн. низ."},
    {text: "YAMAGUCCI - оранжевая ?"},
  ])

  coordY := coordY + offsetY + 10
  offsetY := add_text_to_gui(myGui, 10, coordY, [
    {text: "BLODS - красный"},
    {text: "BALLAS - розовый"},
    {text: "MARA - голубой"},
    {text: "VAGOS - желтый"},
    {text: "FAMIL - зелёный"},
  ])

  coordY := coordY + offsetY + 10
  offsetY := add_text_to_gui(myGui, 10, coordY, [
    {text: "Фарм BP", style: "U"},
    {text: "- 3 часа в онлайне 2/4 BP"},
    {text: "- Перенести 1 ящик с подлодки 2/4 BP"},
    {text: "- Нули в казино 2/4 BP"},
    {text: "- Успешная тренировка в тире 1/2 BP"},
    {text: "- Купить лотерейный билет 1/2 BP"},
    {text: "- 10 действий на ферме 1/2 BP"},
    {text: "- Проехать 1 уличную гонку 1/2 BP"},
    {text: " (через телефон, ставка минимум 1000$)"},
    {text: "- Закрыть 5 кодов в сил.структурах 2/4 BP"},
  ])

  coordY := 5
  offsetY := add_text_to_gui(myGui, 1750, coordY, [
    {text: "Alt + R Reload/Stop"},
    {text: ""},
    {text: "Alt + 1 toggle_gui(1)"},
    {text: "Alt + 2 toggle_gui(2)"},
    {text: "Alt + 3 поиск по УАК/ДК"},
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