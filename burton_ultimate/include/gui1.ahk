build_gui_1() {
  myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
  myGui.BackColor := "black"

  shpora_yk := get_shpora_yk()

  coordY := 130
  for (shpora_yk_line in shpora_yk) {
    offsetY := add_text_to_gui(myGui, 10, coordY, [{text:shpora_yk_line.nomer, style: "U"}])
    add_text_to_gui(myGui, 55, coordY, [{text:shpora_yk_line.text}])
    add_text_to_gui(myGui, 300, coordY, [{text:shpora_yk_line.nakaz, color: shpora_yk_line.color}])
    coordY := coordY + offsetY
  }

  add_text_to_gui(myGui, 1160, 200, [
    {text:"Стадии применения силы", style: "U"},
    {text:"- Присутствие"},
    {text:"- Приказ"},
    {text:"- Применение физической силы"},
    {text:"- Применение специальных средств"},
    {text:"- Применение огнестрельного оружия"},
  ])
  add_text_to_gui(myGui, 900, 200,[
    {text:"Перечень следственных действий", style: "U"},
    {text:"-Допрос"},
    {text:"-Все разновидности осмотра"},
    {text:"-Обыск"},
    {text:"-Очная ставка"},
    {text:"-Опознание"},
    {text:"-Экспертиза"},
    {text:"-Контроль и запись переговоров и переписки, в том числе, электронной"},
    {text:"-Следственный эксперимент"},
    {text:"-Рейд"},
  ])

  add_text_to_gui(myGui, 1390, 980, [
    {text:"Вы имеете право хранить молчание. Всё, что вы скажете, может быть исп. против Вас."},
    {text:"Вы имеете право на один телефонный звонок. Также вы имеете право на адвоката."},
    {text:"Если вам необходим адвокат, он будет для Вас запрошен. Вам ясны ваши права?"},
  ])

  add_text_to_gui(myGui, 900, 5, [
    {text:"Основания освобождения задержанного.", style: "U"},
    {text:"- Не подтвердилось подозрение в совершении правонарушения;"},
    {text:"- За нарушение не предусмотрено меры наказания в виде лишения свободы;"},
    {text:"- Задержание было произведено без имеющихся на то законных оснований,"},
    {text:" предусмотренных ст. 3.2, 3.2.1 настоящего Кодекса "},
    {text:" и (или) с нарушением положений иного законодательства;"},
    {text:"- Прошло больше 1 часа с момента задержания "},
    {text:" (с учетом замораживания сроков задержания в случаях, "},
    {text:" предусмотренных настоящим Кодексом) "},
    {text:" и не было принято решение об освобождении, либо применении меры наказания."},
    {text:"- Было заключено в устной форме мировое соглашение между сотрудником "},
    {text:" проводившим процессуальные действия и начальством задержанного. "},
    {text:" [В случае задержания сотрудника государственной структуры]."},
  ])

  coordY := 5
  offsetY := add_text_to_gui(myGui, 1400, coordY, [
    {text:"Задержание", style: "U"},
    {text:"- мера кратковременного лишения свободы"},
    {text:"- не считается мерой наказания"},
    {text:"- Срок не может превышать 1 часа"},
    {text:""},
    {text:"Основания на задержание", style: "U"},
    {text:"► лицо застиг. в момент сов. прест."},
    {text:"► на подозр. будут следы прест."},
    {text:"► на имуществе. будут следы прест."},
    {text:"► фото или видео фиксация"},
    {text:"► ордер или указ"},
    {text:" подпис. Губ., Виц.Губ., ГП, ЗГП"},
    {text:" или реш. суда"},
    {text:"► 3 свидетеля"},
    {text:"► лицо в маске до уст. личн."},
    {text:""},
    {text:"Основания на обыск автомобиля", style: "U"},
    {text:"► преследовании подозреваемого"},
    {text:"► на территории рыболовства или охоты"},
    {text:" в присутствии владельца"},
    {text:"► тр.сред. в ориентировке"},
    {text:"► номера не соотв. с т/п / отсутствуют"},
    {text:"► первичном обыск: незак. оружие/боепр"},
    {text:" неизвестные вещества, предп. нарк."},
    {text:"► проникновении на ЗОТ"},
    {text:"► замечен в грабеже или мошенничестве"},
    {text:"► принудительно остановлен за ДК;"},
    {text:"► покушался на жизнь представителя власти"},
    {text:"► с целью пресечения браконьерства."},
    {text:""},
    {text:"Порядок задержания", style: "U"},
    {text:"► Наручники"},
    {text:"► Представиться"},
    {text:"► разъяснить основания задержания"},
    {text:"► прочитать правило Миранды"},
    {text:"► Доставить в помещение уполн.органа"},
    {text:"► провести обыск"},
    {text:""},
    {text:"Расследование", style: "U"},
    {text:"► Адвокат (3мин ответ, 7мин приезд)"},
    {text:" (запрос с начала и до конца расследования)"},
    {text:" право на 10 мин конф.беседы"},
    {text:"► 1 тел. звонок 5мин"},
    {text:"► гос.сотр. -> руков.+прок."},
    {text:" (10мин ответ, 15 приезда)"},
    {text:" если руков. не прибыло -> уведомить"},
    {text:"► Принять решение"},
    {text:" (если гос.сотр -> решение принимает прок.)"},
    {text:"► Посадить или опустить"},
    {text:""},
    {text:"Арест", style: "U"},
    {text:"- разновидность уг. и адм. наказания"},
    {text:"- помещение человека в КПЗ, либо в Фед.Тюр"},
    {text:""},
    {text:"Порядок ареста", style: "U"},
    {text:"► Доставить в место лиш. свободы;"},
    {text:"► Провести обыск; изъять"},
    {text:"► Поместить его в тюремную камеру (КПЗ)"},
    {text:"► Поместить его в следств. изол. (ФТ)"},
    {text:""},
    {text:"ЗОТ LSSD", style: "U"},
    {text:"► Губ., Виц.Губ., ГП, ЗГП"},
    {text:"► МВБ + замы"},
    {text:"► Мэр округа Блейн"},
    {text:"► друг. Мин.+замы,сов.Губ и В.Губ"},
    {text:"► CID/NSB ФРБ (для рассл. и зад. лиц)"},
    {text:"► сотрудники оффиса ГП (при контр. за LSSD)"},
  ])

  coordY := coordY + offsetY
  offsetY := add_text_to_gui(myGui, 1400, coordY, [
    {text:"Неприкос", style: "U"},
    {text:"► Губ., Виц.Губ. (+советники), Спик.Конгр., Конгресмены"},
    {text:"► Министры(+их замы), Гл.Колл.Адв., Мэры, Виц.Мэры"},
    {text:"► Судьи, Дир.Секр.Служ."},
    {text:"► ГП, ЗГП, Помощники ГП (во время исп.служ.об)"},])

  coordY := 5
  offsetY := add_text_to_gui(myGui, 1700, coordY, [
    {text:"Коды", style: "U"},
    {text:"0 сотрудник ранен/убит"},
    {text:"1 стрельба"},
    {text:"2 помощь с мигалками"},
    {text:"3 эвакуация сотр./задерж."},
    {text:"4 всё хорошо"},])

  coordY := coordY + offsetY + 10
  offsetY := add_text_to_gui(myGui, 1700, coordY, [
    {text:"Тен-Коды", style: "U"},
    {text:"10-0 - Отмена"},
    {text:"10-3 - Радиотишина"},
    {text:"10-4 - Принял"},
    {text:"10-5 - Повторите"},
    {text:"10-6 - Отказ"},
    {text:"10-7 - Ожидайте"},
    {text:"10-20 - Текущее местоположение"},
    {text:"10-77 - Расчётное время прибытия"},])

  coordY := 5
  offsetY := add_text_to_gui(myGui, 10, coordY, [
    {text:"Животные:", style: "U"},
    {text:"Распространенные: кролик, кабан"},
    {text:"Редкие: олень, койот"},
    {text:"Повышенной редкости: пума"},
  ])

  coordY := coordY + offsetY + 10
  offsetY := add_text_to_gui(myGui, 10, coordY, [
    {text:"Виды рыб (без лиц / с лиц):", style: "U"},
    {text:"Распространенные: стерлядь, лосось, осетр "},
    {text:"Редкие: чёрный амур, скат, тунец"},
    {text:"Повышенной редкости: мальма, фугу"},
  ])

  coordY := 5
  offsetY := add_text_to_gui(myGui, 300, coordY, [
    {text:"без необходимых лицензий, до 25.000$", color: "cRed"},
    {text:"30 кг 3.000$ за каждый килограмм", color: "cRed"},
    {text:"20 кг 5.000$ за каждый килограмм", color: "cRed"},
    {text:"10 кг 10.000$ за каждый килограмм", color: "cRed"},
  ])

  coordY := coordY + offsetY + 10
  offsetY := add_text_to_gui(myGui, 300, coordY, [
    {text:"без необходимых лицензий, от 15.000$ до 30.000$", color: "cRed"},
    {text:"25 / 50 кг 3.000$ / 1.000$ за каждый килограмм", color: "cRed"},
    {text:"15 / 30 кг 5.000$ / 2.500$ за каждый килограмм", color: "cRed"},
    {text:"5 / 15 кг 10.000$ / 5.000$ за каждый килограмм", color: "cRed"},
  ])

  WinSetTransparent(180, myGui)
  return myGui
}