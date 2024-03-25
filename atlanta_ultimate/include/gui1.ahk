build_gui_1() {
  myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
  myGui.BackColor := "black"

  add_shpora_to_gui(myGui, 10, 10, get_shpora_miranda())

  shpora_yk := get_shpora_yk()  
  coordY := 70
  for (shpora_yk_line in shpora_yk) {
    switch shpora_yk_line.fed_reg {
      case "F":
        color := "cRed"
      case "R":
        color := "cYellow"
      case "F/R":
        color := "cf5a91b"
      default:
        color := "cWhite"
    }

    offsetY := add_text_to_gui(myGui, 10, coordY, [{text:shpora_yk_line.nomer, color: color, style: "U"}])
    add_text_to_gui(myGui, 55, coordY, [{text:shpora_yk_line.text}])
    add_text_to_gui(myGui, 450, coordY, [{text:shpora_yk_line.nakaz, color: color}])
    coordY := coordY + offsetY
  }

  coordX := 560
  coordY := 70
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_processualka())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_vremena())


  coordX := 1030
  coordY := 70
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_zaderzh_lichnost())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_tencode())

  WinSetTransparent(180, myGui)
  return myGui
}

get_shpora_processualka() {
  return {
    title: "Процессуалка",
    lines: [
      "1.  Надеть наручники.",
      "2.  Реанимировать (ПМП).",
      "3.  Представиться показать удостоверение .",
      "4.  Озвучить задержанному статью, по которой он задержан",
      "     (по требованию задержанного разъяснить).",
      "5.  Зачитать миранду (До приезда в КПЗ).",
      "6.  Посадить в машину и пристегнуть, обеспечить полную безопастность.",
      "7.  Установка личности (документы, опечатки, кровь)",
      "8.  Сорвать маску .",
      "9.  Первичный досмотр БЕЗ ИЗЪЯТИЯ.",
      "10. Сверить с фотороботом и выдать розыск.",
      "11. Реализовать права на адвоката и телефонный звонок (по требованию).",
      "12. Если адвокат нашел нарушения, вызвать прока. ",
      "13. Если адвокат ничего не нашел, продолжить.",
      "14. Изъять все, изъять лицензию (не все пункты УК).",
      "15. Озвучить статьи и посадить.",
      "16. Составить DataBase.",
    ]
  }
}

get_shpora_miranda() {
  return {
    title: "Правило Миранды",
    lines: [
      "Вы имеете право хранить молчание. Все, что вы скажите, может и будет использовано против вас.",
      "Вы имеете право на пользование услугами адвоката.",
      "Также вы имеете право на пользование личным мобильным телефоном длительностью до 3-х минут.",      
    ]
  }
}

get_shpora_vremena() {
  return {
    title: "Времена",
    lines: [
      "Ответ адвоката/прокурора в /dep - 5 минут",
      "Приезд адвоката/прокурора - 10 минут",
      "Длительность конфиденциальной беседы - 10 минут",
      "Телефонный звонок - 5 минут",
      "Время на задержание - 60 минут",
      "Максимальное время допроса - 120 минут",
    ]
  }
}

get_shpora_zaderzh_lichnost() {
  return {
    title: "Процесс Задержания до выяснения личности",
    lines: [
      "1. Представиться показать значок или удостоверение",
      "2. Надеть наручники",
      "3. Озвучить причину задержания пример",
      "4. Снять маску или скрывающий внешность человека",
      "5. Тыльной стороной ладони обыскать карманы человека, найти id-карту, а после сверить данные с базой данных.",
      "6. В случае если гражданин не имеет активного ордера или федерального розыска, снять наручники и отпустить,",
      "    проведя беседу и попросить более не одевать предмет скрывающий лицо, а также черты внешности.",
      "7. Если есть звезды продолжить задерживать.",
    ]
  }
}

get_shpora_tencode() {
  return {
    title: "Тен-коды/Коды",
    lines: [
      "Code 0 - Офицер ранен/убит	",
      "Code 1 - По офицеру открыт огонь	",
      "Code 2 - Вызов без сирен	",
      "Code 3 - Вызов с проблесковыми маячками	",
      "Code 4 - Ситуация урегулирована, все хорошо	",
      "Code 5 - Задерживаюсь на месте	",
      "Code 6 - Массовые беспорядки	",
      "Code 7 - Большое скопление вооруженных лиц	",
      "10-0 - Отмена	",
      "10-4 - Понял/Принял	",
      "10-5 - Повторите	",
      "10-20 - Текущее местоположение	        ",
      "10-33 - Требуется эвакуация	",
      "10-70 - Требуется подкрепление	",
      "10-71 - Требуется мед.помощь	",
    ]
  }
}

get_shpora_template() {
  return {
    title: "",
    lines: [
      "",
    ]
  }
}
