build_gui_1() {
  myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
  myGui.BackColor := "black"

  add_shpora_to_gui(myGui, 10, 10, get_shpora_miranda())

  shpora_yk := get_shpora_yk()  
  coordX := 10
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
    add_text_to_gui(myGui, 450, coordY, [{text:shpora_yk_line.zvezd, color: color}])
    add_text_to_gui(myGui, 470, coordY, [{text:shpora_yk_line.nakaz, color: color}])
    coordY := coordY + offsetY
  }
  coordY := coordY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_ak())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_dk())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_subject())

  coordX := 560
  coordY := 70
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_processualka())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_vremena())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_neprikos())
  coordY := coordY + offsetY + 30
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_maski())


  coordX := 1430
  coordY := 70
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_zaderzh_lichnost())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_tencode())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_gos_taina())
  coordY := coordY + offsetY + 40
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_zalog())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_zalog_otkaz())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_identif())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_dostup_vezde())
  coordY := coordY + offsetY + 10
  offsetY := add_shpora_to_gui(myGui, coordX, coordY, get_shpora_dostup_lspd())

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

get_shpora_neprikos() {
  return {
    title: "Лицами, обладающими статусом неприкосновенности, являются:",
    lines: [
      "1. Губернатор;",
      "2. Вице-Губернатор;",
      "3. Советники Губернатора;",
      "4. Генеральный Прокурор и его заместители;",
      "5. Все министры и заместители министров;",
      "6. Мэр округа Блэйн и его заместители;",
      "7. Мэр округа Лос-Сантос и его заместители;",
      "8. Действующие Судьи штата San-Andreas;",
      "9. Сотрудники прокуратуры в мом. исп. должностных обязанностей;",
      "10. Директор Federal Investigation Bureau и его заместители;",
      "11. Шеф Los-Santos Police Department и его заместители;",
      "12. Шериф Los-Santos County Sheriff Department и его заместители;",
      "13. Директор Weazel News и его заместители;",
      "14. Главный врач Emergency Medical Services и его заместители;",
      "15. Полковник SANG и его заместители (подполковники).",
    ]
  }
}

get_shpora_gos_taina() {
  return {
    title: "Государственная тайна имеет два уровня допуска.",
    lines: [
      "Допуск первого уровня имеют:",
      "- Губернатор;",
      "- Вице-Губернатор;",
      "- Генеральный прокурор и его заместители;",
      "- Судьи штата;",
      "- Директор Federal Investigation Bureau и его заместители;",
      "- Директор United States Marshal Service и его заместители;",
      "- Директор United States Secret Service и его заместители;",
      "- Руководство Criminal Investigation Department;",
      "- Министры Безопасности, Обороны, Финансов и их заместители;",
      "Допуск второго уровня имеют:",
      "- Мэры и их заместители;",
      "- Сотрудники Criminal Investigation Department(CID);",
      "- Прокуратура штата;",
      "- Адвокатура штата в целях защиты интересов физического или юридического лица",
      "- Сотрудники Detective Bureau;",
      "- Агенты United States Secret Service;",
      "- Сотрудники медицинских учреждений;",
    ]
  }
}

get_shpora_maski() {
  return {
    title: "Отделы, имеющие право скрывать личные данные",
    lines: [
      "Пункт 1.3 закон о ношение масок:",
      "CID, HRT, USSS, FSD, SWAT, ALPHA/SEAL, Delta Force, Military Police, SEB, Detective Bureau LSPD/LSCSD, AF.",
    ]
  }
}		
				
				
				

get_shpora_ak() {
  return {
    title: "Статья	Административный кодекс  	Штраф",
    lines: [
      "6.1	Умышленные уничтожение или повреждение гос. имущества			до 6.000$",
      "6.2	Нарушение установленного порядка организации			до 10.000$",
      "6.3	Заведомо ложный вызов специализированных служб			до 5.000$",
      "6.4	Введение в заблуждение, либо попытка обмана сотрудников государственных служб   до 5.000$",
      "7.1	Оскорбление, выраженное в неприличной форме			до 5.000$",
      "8.1	Неквалифицированная медицинская помощь			до 10.000$",
      "8.3	Наезд на пешехода(компенсация 7.000$ пострадавшему)			до 2.000$",
      "9	  Мелкое хулиганство			до 10.000$",
      "10	Стрельба из оружия в не отведенных для этого местах (конфискация оружия)			до.10.000$",
      "11	Нахождение в общественном месте в состоянии опьянения (конфискация алкоголя и нарк.веществ)			до 5.000$",
    ]
  }
}

get_shpora_dk() {
  return {
    title: "Статья	Дорожный кодекс 			Штраф",
    lines: [
      "6	  Водитель обязан предъявить права			до 3.000$",
      "7	  Водитель обязан остановиться по первому требов. сотрудника			до 3.000$",
      "12	Водителю запрещается управлять т/с в алк. опьянении			до 10.000$",
      "17	Опасное вождение			до 10.000$",
      "29	Разворот в неположенном месте			до 3.000$",
      "31	Езда по встречной полосе			до 5.000$",
      "33	Езда по обочинам, тротуарам, пешеходным и велодорожкам			до 7.000$",
      "42	Остановка в неположеном месте",
      "Остановка запрещается: возле красного бордюра, на пешеходных переходах и тротуаре, на ж/д переездах, трамвайных путях, ",
      "мостах, в тоннелях, на крутых и опасных поворотах, на перекрестках, на служебных стоянках государственных учреждений,",
      "на остановках общественного транспорта			до 4.000$",
      "49	Пересечение двойной сплошной			до 5.000$",
    ]
  }
}

get_shpora_zalog() {
  return {
    title: "5.10 Стоимость выхода под залог регламентирует настоящий Кодекс и определяется согласно приоритету розыска.",
    lines: [
      "5.10.1 Приоритет розыска 1 - стоимость выхода под залог составляет - 15.000$",
      "5.10.2 Приоритет розыска 2 - стоимость выхода под залог составляет - 20.000$",
      "5.10.3 Приоритет розыска 3 - стоимость выхода под залог составляет - 25.000$",
      "5.10.4 Приоритет розыска 4 - стоимость выхода под залог составляет - 30.000$",
      "5.10.5 Приоритет розыска 5 - стоимость выхода под залог составляет - 35.000$",
    ]
  }
}

get_shpora_zalog_otkaz() {
  return {
    title: "Статья 5.12 Причины, по которым лицу можно отказать в праве выхода под залог:",
    lines: [
      "Статья 5.12.1 Задержанный осужден по более чем двум тяжким и особо тяжким статьям Уголовного кодекса San Andreas.",
      "Статья 5.12.5 Задержанный осужден более чем по трём статьям.",
      "Статья 5.12.6 Задержанный осужден по одной из статей: 6.3 У.К, 6.4 У.К, 12.1 У.К, 12.2 У.К, 12.3 У.К, 12.12 У.К, 12.14 У.К,",
      "13.6 У.К, 13.8 У.К, 14.1 У.К, 14.2 У.К, 16.2 У.К, 16.17 У.К, 17.1 У.К.",
    ]
  }
}




get_shpora_identif() {
  return {
    title: "Статья 14. Государственные служащие обязуются себя идентифицировать, либо удостоверить свою личность, если:",
    lines: [
      "Лицо, в отношении которого ведутся процессуальные действия, ",
      "либо лица, являющиеся субъектами задержания потребовали идентификации или удостоверения личности.",
      "",
      "Государственный служащий, находящийся на момент требования при исполнении своих служебных обязанностей, ",
      "предварительно удостоверив свою личность или, в случае если личные данные защищены государственной тайной, ",
      "идентифицировав себя, требует предоставить иного служащего его служебное удостоверение.",
    ]
  }
}




get_shpora_dostup_vezde() {
  return {
    title: "1.2 Доступ на все закрытые территории имеют такие лица как:",
    lines: [
      "Губернатор",
      "Вице-Губернатор",
      "Генеральный прокурор и его заместители",
      "Советник губернатора",
      "Министерство финансов при проведении финансовых проверок",
      "Лица сопровождающие вышеуказанных",
      "Прокуроры, при исполнении ими служебных обязанностей",
      "Помощники прокурора, сопровождающие прокурора",
    ]
  }
}


get_shpora_dostup_lspd() {
  return {
    title: "1.2.1 Доступ на закрытую территорию Los-Santos Police Department имеют:",
    lines: [
      "Лица, перечисленные в статье 1.2 настоящего закона.",
      "Все сотрудники Los-Santos Police Department.",
      "Адвокаты, в случае вызова в соответствующий департамент.",
      "Сотрудники Federal Investigation Bureau отдела IB для исполнения должностных обязанностей",
      "Прокуроры",
      "Сотрудники которые проводят задержание, являются субъектами задержания.",
      "Мэр и его заместители",
      "Сотрудники CID, при исполнении ими служебных обязанностей.",
      "Министр безопасности и его заместители.",
      "USSS при сопровождении Министра безопасности и/или его заместителей, Мэра и/или его заместителей",
      "Лица получившие доступ от старшего состава Los-Santos Police Department",
    ]
  }
}


get_shpora_subject() {
  return {
    title: "Субъекты, то есть лица, имеющие право присутствовать при задержании:",
    lines: [
      "Пункт 1. При задержании имеют право присутствовать лица, указанные в пункте 5 настоящей статьи.",
      "Пункт 2. При задержании, сотрудник, проводящий задержание на открытой местности вне помещения, имеет право потребовать всех лиц, не являющихся субъектами задержания, удалиться от места задержания на 10 метров.      ",
      "Пункт 3. При задержании, сотрудник, проводящий задержание в помещении, имеет право потребовать всех лиц, не являющихся субъектами задержания, удалиться от места задержания на 2 метра.      ",
      "Пункт 4. При задержании, сотрудник, проводящий задержание в закрытом помещении, имеет право потребовать всех лиц, не являющихся субъектами задержания, покинуть помещение.      ",
      "Примечание: Закрытым помещением являются допросные оборудованные в отделениях правоохранительных органов (LSPD, LSCSD, FIB).",
      "Пункт 5. Перечень лиц, являющихся субъектами задержания:",
      "1) Сотрудник правоохранительных органов, проводящий задержание, а также сотрудники, которые как-либо причастны к задержанию, однако не более 2-х человек;",
      "2) Задержанный;",
      "3) Один адвокат, если тот был запрошен задержанным, в порядке, предусмотренном настоящим Кодексом, а также одно начальство адвокатуры в лице Главы коллегии адвокатов или его заместителя, для оценки работы своего сотрудника;",
      "4) Один агент отдела CID, ведущий надзорную деятельность;",
      "5) Один прокурор, ведущий надзорную деятельность, и/или один прокурор, принявший вызов в порядке, предусмотренном статьей 16 Главы III настоящего Кодекса;",
      "6) Один сотрудник офиса Генерального прокурора;",
      "7) Помощник прокурора, являющегося субъектом задержания, предусмотренным п.п. 6 и п.п. 7 пункта 5 статьи 20 главы III настоящего Кодекса;",
      "8) Один представитель непосредственного начальства или руководства организации сотрудника, проводящего задержание;",
      "9) Один представитель начальства задержанного государственного служащего в случаях, предусмотренных статьей 16 Главы III настоящего Кодекса;",
      "10) До 2-х сотрудников Weazel News (оператор и комментатор) в случае, если те находятся и были приглашены субъектом задержания, предусмотренным п.1 статьи 20 Главы III настоящего Кодекса.",
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
