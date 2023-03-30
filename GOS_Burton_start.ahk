; AutoHotKey качать тут: https://www.autohotkey.com/
; После установки этот файл можно запускать двойным кликом
;
; После изменений в этом файле, сохраните файл (в блокноте: Файл -> Сохранить)
; После чего двойным кликом на файле запустите (или перезапустите) его
; Также можно перезапускать скрипт в панели задач (мелкие иконки внизу справа)
;                        на иконке AHK через правый клик -> Reload this script
;
; Синтаксис:
;
;+F1::                                                            <--- в первой строчке каждого блока указывается сочетание клавиш для запуска этого блока
;{                                                                <--- начало блока который выполняется по нажантию указанных клавиш
;   paste_message_in_chat_and_submit("/me", "поковырялся в носу") <--- цель каждой функции можно посмотреть в конце этого файла
;   paste_message_in_chat_and_submit("/do", "Козява на пальце.")
;}                                                                <--- конец блока который выполняется по нажантию указанных клавиш
;
;
; Символы для указания комбинации клавиш:
;
; +       <-- Shift
; ^       <-- Ctrl
; !       <-- Alt
; F1      <-- Клавиша F1
; Numpad7 <-- Клавиша 7 на нумпаде
; и т.д....
;
; Соединяя эти символы создаётся комбинация. Указание комбинации заканчивается двойным двоеточием.
; Например ^+F3:: запустит блок после нажатия Ctrl + Shift + F3
;
; Полная документация по списку возможных клавиш на сайте AHK: https://lexikos.github.io/v2/docs/KeyList.htm
;
; Вопросы и предложения: ZwergZ#3560

SendMode("Input")

currentGUI := Gui()
testGUI := Gui()
currentGUIAktion := "BEGIN"
gui1 := build_gui_1()
gui2 := build_gui_2()

timerStatus := "DISABLED"
timerGui := build_timer()

!1::
    {
        global gui1
        toggle_gui(gui1)
    }

!2::
    {
        global gui2
        toggle_gui(gui2)
    }

!3::
    {
        global currentGUI
        global currentGUIAktion

        if (currentGUIAktion == "DESTROY") {
            currentGUI.Destroy()
            currentGUIAktion := "DESTROYED"
        }

        if (currentGUIAktion == "HIDE") {
            currentGUI.Hide()
            currentGUIAktion := "HIDDEN"
        }

        if (currentGUIAktion != "DESTROYED") {
            currentGUI := build_law_search_gui()
            currentGUIAktion := "DESTROY"
        } else {
            currentGUIAktion := "BEGIN"
        }

    }

!4::
    {
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

        add_text_to_gui(testGUI, 15, 10, [{text:"x" . mouseXposScreen . " y" . mouseYposScreen . " x" . mouseXposWindow . " y" . mouseYposWindow . " " . c}])

        WinSetTransparent(180, testGUI)
        testGUI.Show("x" . mouseXposScreen . " y" . mouseYposScreen . " NoActivate")
    }

!9::
    {
        start_timer()
    }

!0::
    {
        disable_timer()
    }

;!F3::
;nazhmi_code0_na_planshete()
;Return

;F1::
; при бинде на F1 будет вылетать в меню рейджа
;Return

+F2::
    {
        paste_message_in_chat_and_submit("/b", "откат")
    }

+F3::
    {
        paste_message_in_chat_and_submit("/b", "голос сломался, перезагружаю")
    }

+F4::
    {
        paste_message_in_chat_and_submit("/b", ">>>> ZwergZ#3560 <<<<")
    }

+F5::
    {
        paste_message_in_chat_and_submit("/do", "На форме жетон: [ LSSD | SPD | 2863 | D.S. ] .")
    }

+F6::
    {
        paste_message_in_chat_and_submit("/me", "внимательно осматривает человека напротив")
        paste_message_in_chat("/do", "Есть ли какие либо опозновательные знаки у @?")
        SendInput("{Left}")
    }

+F7::
    {
        paste_message_in_chat_and_submit("/me", "достал пару резиновых перчаток и надел перчатки на руки")
        paste_message_in_chat_and_submit("/me", "начал прохлопывать верхние и нижние слои одежды гражданина напротив")
    }

+F8::
    {
        paste_message_in_chat_and_submit("/me", "достал пару резиновых перчаток и надел их на руки")
        paste_message_in_chat_and_submit("/me", "легким движением открыл багажник, а затем ознакомился с его содержимым и изучил все труднодоступные места")
    }

+F9::
    {
        paste_message_in_chat_and_submit("/me", "присмотрелся к замку водительской двери автомобиля")
        paste_message_in_chat_and_submit("/do", "На машине есть следы взлома.")
        paste_message_in_chat_and_submit("/me", "достал планшет и подключил его через провод к сигнализации машины")
        paste_message_in_chat_and_submit("/me", "считал данные с системы сигнализации машины на предмет угона")
        paste_message_in_chat_and_submit("/do", "Этa машина находится в угоне.")
    }

+F10::
    {
        paste_message_in_chat_and_submit("/b", ">>>> останавливайся или я заливаю за PG <<<<")
    }

+F11::
    {
        paste_message_in_chat_and_submit("/m", "Водитель, остановите ТС и прижмитесь к обочине, при неповиновении мы будем вынуждены открыть огонь")
    }

!F5::
    {
        paste_message_in_chat_and_submit("", "Вы имеете право хранить молчание. Всё, что вы скажете, может быть исп. против Вас.")
        paste_message_in_chat_and_submit("", "Вы имеете право на один телефонный звонок. Также вы имеете право на адвоката.")
        paste_message_in_chat_and_submit("", "Если вам необходим адвокат, он будет для Вас запрошен.")
    }

!F7::
    {
        paste_message_in_chat_and_submit("/do", "У охранника на стойке лежит бланк ареста и ручка.")
        paste_message_in_chat_and_submit("/me", "взял бланк ареста, ручку, и заполнил его, после чего положил обратно")
    }

!F8::
    {
        paste_message_in_chat_and_submit("/do", "На поясе висит ключ-карта.")
        paste_message_in_chat_and_submit("/me", "взял ключ-карту и открыл ей дверь КПЗ")
        paste_message_in_chat_and_submit("/me", "завёл в КПЗ задержанного и снял с него наручники")
        paste_message_in_chat_and_submit("/me", "закрыл дверь КПЗ и повесил ключ-карту на пояс")
    }
;
;    Анализ наркотиков:
;
;    /do На столе лежит сумка с мед. приборами.
;    /me достал резиновые перчатки из тактического пояса и надел их на руки
;    /me достал медицинские ножницы и пробирку с раствором
;    /me достал из зип-лока пакетик с порошком
;    /me насыпал порошок в пробирку с раствором
;    /do Тест будет готов через 10 секунд.
;    /do Подсумок висит на ремне штанов.
;    /me достал из подсумка и включил планшет
;    /do Раствор изменился в цвете.
;    /do Результат готов.
;    /me ознакомился с результатом
;    /do Анализ показал содержание наркотических веществ.
;    /me выключил планшет и положил обратно в подсумок
;    /me сложил мед. предметы в сумку
;    ======================================================================================================
;    Отпечатки рук:
;
;    /do На столе лежит набор стекол для снятия отпечатков, дактилоскопический порошок и скотч.
;    /me взял набор со стола, приставил каждое стеклышко по очереди к каждому пальцу задержанного
;    /me взял дактилоскопический порошок и присыпал им стекла, сдул излишки
;    /do Отпечатки появились на стеклах.
;    /me взял скотч, снял им отпечатки со стекла и наклеил на специальных бланк
;    /do На столе лежит сканер.
;    /me с помощью компьютера просканировал бланк с отпечатками
;    /me проверил отпечатки пальцев на совпадение в базе данных
;    /do Совпадения найдены, личность установлена.
;
!R::
    {
        Reload
    }

!X::
    {
        ExitApp
    }

+F12::
    {
        Pause
    }

    ; ----------------------------------------------------------------------------------------
    ;
    ;          Далее следуют функции, написанные для более удобного создания биндов
    ;                         Дальше меняем что-то, только если шарим
    ;
    ; ----------------------------------------------------------------------------------------

    ; Переключить раскладку клавиатуры на русскую
    swith_to_RU() {
        SendMessage(0x50,, 0x4190419,, "A")
        sleep 500
    }

    ; Переключить раскладку клавиатуры на англискую
    swith_to_EN() {
        SendMessage(0x50,, 0x4090409,, "A")
        sleep 500
    }

    ; Переключить раскладку клавиатуры на немецкую
    swith_to_DE() {
        SendMessage(0x50,, 0x4070407,, "A")
        sleep 500
    }

    ; Набрать сообщение в чат с заключительным нажатием Enter
    type_message_in_chat_and_submit(chat, message) {
        SendInput("{t}")
        sleep 100
        SendInput(chat . " " . message . "{enter}")
        sleep 1000
        Return
    }

    ; Набрать сообщение в чат без заключительного нажатия Enter (для возможности дописать чтото самому, например ID гражданина)
    type_message_in_chat(chat, message) {
        SendInput("{t}")
        sleep 500
        SendInput(chat . " " . message)
        sleep 500
        Return
    }

    ; Вставить текст (Ctrl + V) с сохранением в буфере обмена того что было там до того
    paste(pastetext) {
        temp := ClipboardAll()
        A_Clipboard := pastetext
        SendInput("^v")
        sleep 500
        A_Clipboard := temp
        Return
    }

    ; Вставить текст в час и отправить
    paste_message_in_chat_and_submit(chat, message) {
        SendInput("{t}")
        sleep 100
        if (chat == "") {
            SendInput("{BACKSPACE}")
            sleep 100
            SendInput("{BACKSPACE}")
            sleep 100
            SendInput("{BACKSPACE}")
            sleep 100
            SendInput("{BACKSPACE}")
            sleep 100
        } else {
            SendInput(chat . "{Space}")
        }
        paste(message)
        SendInput("{enter}")
        sleep 1000
        Return
    }

    ; Вставить текст (Ctrl + V) в час и не отправлять (для возможности дописать чтото самому, например ID гражданина)
    paste_message_in_chat(chat, message) {
        SendInput("{t}")
        sleep 100
        SendInput(chat . "{Space}")
        paste(message)
        sleep 1000
        Return
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

    build_gui_1() {
        myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
        myGui.BackColor := "black"

        add_text_to_gui(myGui, 1390, 980, [
            {text:"Вы имеете право хранить молчание. Всё, что вы скажете, может быть исп. против Вас."},
            {text:"Вы имеете право на один телефонный звонок. Также вы имеете право на адвоката."},
            {text:"Если вам необходим адвокат, он будет для Вас запрошен. Вам ясны ваши права?"},
        ])

        add_text_to_gui(myGui, 1160, 5, [
            {text:"Стадий применения силы", style: "U"},
            {text:"- Присутствие"},
            {text:"- Приказ"},
            {text:"- Применение физической силы"},
            {text:"- Применение специальных средств"},
            {text:"- Применение огнестрельного оружия"},
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
            {text:"► в п.3 ст.23 ПК (сопротивление/неподчинение;"},
            {text:" попытка бегства; маска или был вооружен;"},
            {text:" насилие или угрозу насилия долж. лицу)"},
            {text:"► ст.4 (неостановка по требованию)"},
            {text:"► ст.67, 68, 69, 70 ДК (без действующих номеров)"},
            {text:"► если нет лицензии на рыбалку"},
            {text:"► если нет лицензии на охоту"},
            {text:"► СИД, ФИБ, НГ имеют свои полномочия"},
            {text:"► Исключением при обыске является т/с,"},
            {text:" осуществляющее поставку мед./мат."},
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

        coordY := coordY + offsetY + 10
        offsetY := add_text_to_gui(myGui, 1400, coordY, [
            {text:"Неприкос", style: "U"},
            {text:"► Губ., Виц.Губ. (+советники), Спик.Конгр., Конгресмены"},
            {text:"► Министры(+их замы), Гл.Колл.Адв., Мэры, Виц.Мэры"},
            {text:"► Судьи, Дир.Секр.Служ., Дир.Служ.Марш."},
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

        WinSetTransparent(180, myGui)
        return myGui
    }

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

    build_law_search_gui() {
        akty := Map()
        akty["1YK"] := get_YK()
        akty["2DK"] := get_DK()

        inputObj := InputBox("Введите слово или номер статьи для поиска по УК и АК", "Поиск по УК и АК", "W360 H90")

        if (inputObj.Result != "OK" or inputObj.Value == "" or inputObj.Value == " ") {
            return Gui()
        }

        foundAkty := Map()

        for aktKey, akt in akty {
            foundAkty[aktKey] := {name: akt.name, zakony: []}
            for razdel in akt.razdely {
                for glava in razdel.glavy {
                    for zakon in glava.zakony {
                        for stro4ka in zakon.stro4ki {
                            if (InStr(zakon.nomer, inputObj.Value, "Locale") or InStr(stro4ka, inputObj.Value, "Locale")) {
                                foundAkty[aktKey].zakony.push({razdel: razdel.name, glava: glava.name, zakon: zakon})
                                break
                            }
                        }
                    }
                }
            }
        }

        myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
        myGui.BackColor := "black"

        offsetY := 0
        for aktKey, foundAkt in foundAkty {
            if (foundAkt.zakony.Length > 0) {
                newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundAkt.name, height:10, color: "cWhite", style: "U"}])
                offsetY := offsetY + newOffset
                for foundZakon in foundAkt.zakony {
                    newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.razdel, height:10, color: "cBlue"}])
                    offsetY := offsetY + newOffset

                    newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.glava, height:10, color: "cAqua"}])
                    offsetY := offsetY + newOffset

                    if (foundZakon.zakon.HasOwnProp("chast")) {
                        switch(foundZakon.zakon.chast) {
                        case "🟢": zakonColor := "c16C60C"
                        case "🟡": zakonColor := "cFFF100"
                        default: zakonColor := "cWhite"
                        }
                    } else {
                        zakonColor := "cWhite"
                    }

                    newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.zakon.nomer, height:10, color: zakonColor}])

                    if (foundZakon.zakon.HasOwnProp("tip")) {
                        newOffset := add_text_to_gui(myGui, 5, offsetY + 15, [{text:foundZakon.zakon.tip, height:10, color: "c007ACC"}])
                    }

                    for stro4ka in foundZakon.zakon.stro4ki {
                        newOffset := add_text_to_gui(myGui, 100, offsetY, [{text:stro4ka, height:10}])
                        offsetY := offsetY + newOffset
                    }

                    if (foundZakon.zakon.HasOwnProp("nakazanie")) {
                        newOffset := add_text_to_gui(myGui, 100, offsetY, [{text:foundZakon.zakon.nakazanie, height:10, color: "cRed"}])
                        offsetY := offsetY + newOffset
                    }

                    offsetY := offsetY + 5
                }
            }
        }

        WinSetTransparent(180, myGui)
        myGui.Show("x0 y0 NoActivate")
        return myGui
    }

    build_timer() {
        global timerStatus
        myGui := Gui()
        While (true) {
            if (timerStatus == "START") {
                startTimeStamp := 0
                timeBuffer := FormatTime(, "HH")
                startTimeStamp := startTimeStamp + timeBuffer * 3600
                timeBuffer := FormatTime(, "mm")
                startTimeStamp := startTimeStamp + timeBuffer * 60
                timeBuffer := FormatTime(, "ss")
                startTimeStamp := startTimeStamp + timeBuffer
                timerStatus := "STARTED"
            }
            if (timerStatus == "STARTED") {
                timeStamp := 0
                timeBuffer := FormatTime(, "HH")
                timeStamp := timeStamp + timeBuffer * 3600
                timeBuffer := FormatTime(, "mm")
                timeStamp := timeStamp + timeBuffer * 60
                timeBuffer := FormatTime(, "ss")
                timeStamp := timeStamp + timeBuffer

                secondsGone := timeStamp - startTimeStamp
                hoursGone := Floor(secondsGone / 3600)
                secondsGone := secondsGone - hoursGone * 3600
                minutesGone := Floor(secondsGone / 60)
                secondsGone := secondsGone - minutesGone * 60

                hoursGone := SubStr("0" . hoursGone, -2)
                minutesGone := SubStr("0" . minutesGone, -2)
                secondsGone := SubStr("0" . secondsGone, -2)

                timeGone := hoursGone . ":" . minutesGone . ":" . secondsGone

                myGui.Destroy()

                myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
                myGui.BackColor := "black"

                add_text_to_gui(myGui, 15, 10, [{text:timeGone, height:20}])

                WinSetTransparent(180, myGui)
                myGui.Show("x1780 y930 NoActivate")
            }
            if (timerStatus == "DISABLE") {
                myGui.Hide()
                timerStatus := "DISABLED"
            }
            Sleep 1000
        }
    }

    start_timer() {
        global timerStatus
        timerStatus := "START"
    }

    disable_timer() {
        global timerStatus
        timerStatus := "DISABLE"
    }

    get_DK() {
        akt_name := "Дорожный Кодекс штата Сан-Андреас (от 28.03.2023)"

        akt := {name: akt_name, razdely: []}

        razdel_name := ""

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава I. Общие положения"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 1.",
            stro4ki: ["Наказание в виде лишения свободы, предусмотренное статьями настоящего Кодекса, отбываются в КПЗ LSPD/LSSD. (( 1 месяц = 10 минут))"],
            nakazanie: ""
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 2.",
            stro4ki: ["При нарушении трех или более статей дорожного кодекса, а также их неуплате, сотрудник правоохранительных органов имеет право изъять лицензию на вождение."],
            nakazanie: ""
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава II. Обязанности водителя"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 3.",
            stro4ki: ["Водитель должен предъявить и передать сотруднику правоохранительных органов свою лицензию на вождение транспортного средства (ТС) с соответствующей категорией, а также техпаспорт на транспортное средство.",
            " В случае, если транспортное средство зарегистрировано на организацию, техпаспорт не запрашивается."],
            nakazanie: "Наказание: В случае отсутствия лицензии на управление транспортом, предусмотрен штраф до $3'000, либо 3 месяц лишения свободы. Отказ от предоставления -> ответственность в соответствии со ст. 17.6 УАК."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 4.",
            stro4ki: ["Водитель обязан остановиться по требованию сотрудника правоохранительных органов."],
            nakazanie: "Наказание: Штраф до $4.000, а также 2 месяца лишения свободы, в случае принудительной остановки транспортного средства."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 5.",
            stro4ki: ["Водитель обязан по требованию сотрудника правоохранительных органов проходить освидетельствование на содержание алкоголя и наркотических веществ в крови."],
            nakazanie: "Наказание: Штраф до $1.500, принудительное освидетельствование, 2 месяца лишения свободы."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 6.",
            stro4ki: ["При аварии, водитель обязан остановиться и не трогаться с места. Также водитель не должен трогать и перемещать предметы, связанные с происшествием"],
            nakazanie: "Наказание: Штраф до $5.000 или изъятие лицензии на управление транспортом."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 7.",
            stro4ki: ["При аварии в которой погибли или ранены люди, водитель обязан оказать первую помощь и вызвать скорую помощь - EMS."],
            nakazanie: "Наказание: Штраф до $2.000, 3 месяца лишения свободы в случае гибели пострадавшего от бездействия водителя."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 8.",
            stro4ki: ["Если, в результате аварии, причинен вред только имуществу, водители по обоюдному желанию могут освободить проезжую часть, зафиксировав средствами фотосъемки положение транспортных средств ",
            "по отношению друг к другу."],
            nakazanie: ""
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 9.",
            stro4ki: ["Водителю запрещается управлять транспортным средством в состоянии алкогольного опьянения."],
            nakazanie: "Наказание: Штраф до $5.000, либо 3 месяца лишения свободы."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 9.1.",
            stro4ki: ["Водителю запрещается управлять транспортным средством в состоянии наркотического опьянении, вне зависимости от легального статуса наркотического вещества."],
            nakazanie: "Наказание: Штраф до $5.000, а также 4 месяца лишения свободы с изъятием наркотиков."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 10.",
            stro4ki: ["Владельцу транспортного средства запрещено передавать управление лицам, не имеющим право на вождение автомобиля (лицу без лицензии, под алкогольным или наркотическим опьянении, ",
            "находящемуся в утомленном состоянии)."],
            nakazanie: "Наказание: Штраф до $4.000 для владельца и 3 месяца лишения свободы для лица управляющего транспорт с нарушениями."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 11.",
            stro4ki: ["Водителю запрещено пересекать и занимать место в организованных колоннах или кортежах."],
            nakazanie: "Наказание: Штраф до $4.000, либо 4 месяца лишения свободы при создании угрозы безопасности колонны или кортежа."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 12.",
            stro4ki: ["Водителю запрещено управлять транспортным средством в состоянии усталости."],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 13.",
            stro4ki: ["Водителю запрещается пользоваться во время движения телефоном."],
            nakazanie: "Наказание: Штраф до $3.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 14.",
            stro4ki: ["Водителю запрещено совершать опасное вождение, которое выражается в:",
            "⁃ не выполнении требования уступить дорогу во время перестроения (подрезание);",
            "⁃ несоблюдении безопасной дистанции;",
            "⁃ резком торможении, если такое торможение не требуется для предотвращения аварии;",
            "⁃ препятствовании обгону;",
            "⁃ нарушении сразу двух и более статей Дорожного Кодекса. ",
            ],
            nakazanie: "Наказание: Штраф до $4.000, либо 4 месяца лишения свободы в случаях опасного вождения, создавшего угрозу жизни и здоровью участникам дорожного движения."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 14.1.",
            stro4ki: ["Водитель и пассажиры обязаны пристегнуть ремень безопасности до начала движения транспортного средства и оставаться пристегнутыми до полной остановки транспортного средства."],
            nakazanie: "Наказание: Штраф до $3.500."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава III. Специальные сигналы"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 15.",
            stro4ki: ["Водители транспортного средства с маячком синего или красного цвета и включенной сиреной могут отступать от требований Дорожного Кодекса, при условии обеспечения безопасности движения",
            "и нанесении минимального урона окружению."],
            nakazanie: "Наказание: Штраф до $3.000 или изъятие лицензии на управление транспортом."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 16.",
            stro4ki: ["При приближении транспортного средства с включенными проблесковым маячком синего или красного цвета и сиреной водители обязаны уступить дорогу для обеспечения беспрепятственного проезда ",
            "указанного транспортного средства."],
            nakazanie: "Наказание: Штраф до $3.000 или изъятие лицензии на управление транспортом."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 17.",
            stro4ki: ["Приближаясь к стоящему транспортному средству с включенным проблесковым маячком синего или красного цвета, водитель должен снизить скорость, чтобы иметь возможность немедленно остановиться ",
            "в случае необходимости."],
            nakazanie: "Наказание: Штраф до $3.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 18.",
            stro4ki: ["Проблесковый маячок желтого цвета служит для предупреждения других водителей, и позволяет только совершать обгон через запрещающую это разметку, а также не придерживаться установленного скоростного режима."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава IV. Обязанности пешехода"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 19.",
            stro4ki: ["Пешеходы должны двигаться по тротуару или обочине. Беспорядочное движение по проезжей части пешеходами запрещено."],
            nakazanie: "Наказание: Штраф до $3.500."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 20.",
            stro4ki: ["Пешеходы должны руководствоваться трафиком перед тем как пересекать дорогу. Если в зоне видимости нет движущегося транспорта, то дорогу можно пересечь."],
            nakazanie: "Наказание: Штраф до $500."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 21.",
            stro4ki: ["При приближении транспортных средств с включенным проблесковым маячком синего или красного цвета пешеходы обязаны воздержаться от перехода дороги, а пешеходы, находящиеся на проезжей части, ",
            "должны незамедлительно освободить проезжую часть."],
            nakazanie: "Наказание: Штраф до $5.000."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава V. Сигналы светофора"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 22.",
            stro4ki: ["Сигналы светофора имеют следующие значения:",
            "⁃ Зеленый сигнал – разрешает движение;",
            "⁃ Желтый сигнал – информирует о смене сигнала светофора;",
            "⁃ Красный сигнал – запрещает движение.",
            " ",
            "⁃ Разрешается отступать от требований сигналов светофоров, если трафик на дорогах низкий либо отсутствует вовсе.",
            "⁃ Требования сигналов светофоров следует выполнять при загруженном трафике, когда разъезд на перекрестке затруднен, проезжает тот кому горит зеленый, кому горит красный пропускает.",
            "⁃ Стоять на светофоре при пустой дороге - запрещается. ",
            ],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 23.",
            stro4ki: ["Водителю разрешается совершить правый поворот на красный сигнал светофора, в случаях когда водитель совершая маневр не создает помех другим транспортным средствам."],
            nakazanie: ""
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава VI. Маневрирование"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 24.",
            stro4ki: ["При выезде на дорогу с прилегающей территории водитель должен уступить дорогу транспортным средствам и пешеходам, движущимся по ней, а при съезде с дороги - пешеходам и велосипедистам, ",
            "путь движения которых он пересекает."],
            nakazanie: "Наказание: Штраф до $1.500."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 25.",
            stro4ki: ["При перестроении водитель должен уступить дорогу транспортным средствам, движущимся попутно без изменения направления движения."],
            nakazanie: "Наказание: Штраф до $500."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 26.",
            stro4ki: ["Перед поворотом направо водитель должен заранее занять крайнее правое положение. Перед поворотом налево или разворотом водитель должен заранее занять крайнее левое положение. ",
            "Также поворот может быть произведен не с крайней полосы, если имеется соответствующая разметка."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 27.",
            stro4ki: ["При развороте или повороте налево вне перекрестка, водитель должен пропустить встречные транспортные средства."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 28.",
            stro4ki: ["На перекрестках, которые регулируются дорожными знаками, водитель должен уступить дорогу транспортным средствам пользующимся приоритетом."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 29.",
            stro4ki: ["Разворот запрещается:",
            "⁃ На пешеходных переходах",
            "⁃ В тоннелях",
            "⁃ На мостах",
            "⁃ На железнодорожных переездах",
            "⁃ В местах с видимостью менее 100 метров.",
            ],
            nakazanie: "Наказание: Штраф до $4.000 или изъятие лицензии на управление транспортом."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава VII. Расположение ТС на проезжей части"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 30.",
            stro4ki: ["Движение в штате Сан-Андреас является правосторонним. Транспортное средство должно двигаться по правой стороне дороги, если нет разметки."],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 31.",
            stro4ki: ["На дорогах с двусторонним движением запрещается двигаться по полосе встречного движения"],
            nakazanie: "Наказание: Штраф до $5.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 32.",
            stro4ki: ["Транспортные средства которые не могут двигаться со скоростью более чем 60 км/ч должны двигаться по правой полосе, кроме случаев перестроения в полосу для совершения левого поворота или разворота."],
            nakazanie: "Наказание: Штраф до $900."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 33.",
            stro4ki: ["Запрещается двигаться транспортным средством по обочинам, тротуарам, пешеходным и велодорожкам."],
            nakazanie: "Наказание: Штраф до $5.000 или изъятие лицензии на управление транспортом."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава VIII. Скоростные лимиты"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 34.",
            stro4ki: [
            "Скоростной лимит настоящим Кодексом установлен для всех водителей транспортных средств:",
            "⁃ В населенных пунктах – 100 км/ч;",
            "⁃ В жилых зонах и дворовых территориях – 50 км/ч;",
            "⁃ Вне населенных пунктах – 130 км/ч;",
            "⁃ На автомагистралях (хайвеях) – 170 км/ч.",
            ],
            nakazanie: "Наказание: Штраф до $1.000 10-25 км/ч; $2.000 до $4.000 26-40 км/ч; $4.000 до $6.000 41 и более км/ч."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 35.",
            stro4ki: ["Транспортным средствам, производящим буксировку разрешается двигаться со скоростью не более 50 км/ч."],
            nakazanie: "Наказание: Штраф до $500."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 36.",
            stro4ki: ["Водителю запрещается создавать помехи другим транспортным средствам, двигаясь без необходимости со слишком малой скоростью."],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава IX. Обгон и опережение"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 37.",
            stro4ki: ["Перед обгоном водитель должен убедиться в безопасности маневра."],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 38.",
            stro4ki: ["Обгон запрещен:",
            "⁃ когда обгоняемое транспортное средство совершает поворот налево;",
            "⁃ на пешеходных переходах;",
            "⁃ на железнодорожных переездах и ближе чем за 100 метров перед ними;",
            "⁃ на мостах и под ними, а также в тоннелях;",
            "⁃ в конце подъема, на опасных поворотах и на других участках с ограниченной видимостью.",
            ],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 39.",
            stro4ki: ["Водитель должен пропустить автобус, который выезжает с автобусной остановки."],
            nakazanie: "Наказание: Штраф до $900."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава X. Остановка и парковка"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 40.",
            stro4ki: ["Остановка и парковка разрешаются на правой стороне дороги, кроме дорог с односторонним движением и дорог с двумя полосами движения (по 1 на каждое направление)."],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 41.",
            stro4ki: ["Ставить транспортное средство разрешается в один ряд параллельно краю проезжей части. Двухколесные транспортные средства допускается ставить в два ряда."],
            nakazanie: "Наказание: Штраф до $3.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 42.",
            stro4ki: ["Остановка запрещается:",
            "⁃ параллельно красному бордюру;",
            "⁃ на пешеходных переходах и тротуаре;",
            "⁃ на ж/д переездах, трамвайных путях, мостах, в тоннелях;",
            "⁃ на крутых и опасных поворотах;",
            "⁃ на перекрестках;",
            "⁃ на служебных стоянках государственных учреждений;",
            "⁃ в специально обозначенных местах, указанных в подзаконных актах или указах.",
            ],
            nakazanie: "Наказание: Штраф до $5.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 43.",
            stro4ki: ["Остановка запрещена на автомагистралях (хайвеях), кроме случаев чрезвычайной остановки."],
            nakazanie: "Наказание: Штраф до $2.500."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава XI. Движение по автомагистралям (хайвеям)"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 44.",
            stro4ki: [
            "На автомагистралях (хайвеях) запрещается:",
            "⁃ движение пешеходов, мопедов, велосипедов, тракторов, иных транспортных средств;",
            "скорость которых по техническим характеристикам менее 40 км/ч;",
            "⁃ движение задним ходом;",
            "⁃ движение грузовиков вне крайней правой полосы;",
            "⁃ разворот и выезд на разделительную полосу.",
            ],
            nakazanie: "Наказание: Штраф до $800."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава XII. Пользование фарами и звуковыми сигналами"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 45.",
            stro4ki: ["В темное время суток или в условиях плохой погоды, а также в тоннелях транспортные средства должны использовать ближний или дальний свет фар."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 46.",
            stro4ki: ["В населенных пунктах где дорога освещена, дальний свет должен быть переключен на ближний"],
            nakazanie: "Наказание: Штраф до $1.500."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 47.",
            stro4ki: ["Звуковой сигнал разрешается подавать для предупреждения других водителей о намерении обгона вне населенных пунктов, а также в других случаях, когда это необходимо только для предотвращение дорожной аварии."],
            nakazanie: "Наказание: Штраф до $800."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава XIII. Дорожная разметка и знаки"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 48.",
            stro4ki: ["Пересекать желтую двойную сплошную линию для совершения обгона запрещено. Пересекать такую разметку разрешается для разворота или въезда/выезда с прилегающей территории или дворов, ",
            "убедившись в безопасности такого маневра."],
            nakazanie: "Наказание: Штраф до $3.000 или изъятие лицензии на управление транспортом."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 49.",
            stro4ki: ["Одиночная желтая сплошная линия предупреждает о встречном движении, совершать обгон запрещено. Совершать разворот и поворот для въезда/выезда с прилегающей территории или дворов - разрешается, ",
            "убедившись в безопасности такого маневра.",
            "Обгон можно совершать пересекая ТОЛЬКО пунктирную разметку на дороге."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 50.",
            stro4ki: ["Белая сплошная линия у правого края дороги обозначает край проезжей части и начало обочины – пересекать такую разметку разрешено.",
            "В тоже время белая сплошная линия нанесенная в пределах проезжей части, обозначает границы полос движения в опасных местах на дороге, такую разметку пересекать запрещено."],
            nakazanie: "Наказание: Штраф до $1.000 (если пересекая линию разметки, водитель создал опасные условия для других ТС)."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 51.",
            stro4ki: ["Стрелочки нанесенные на дорогу для каждой полосы, указывают направления движения по полосам, с какой полосы можно совершать тот или иной маневр."],
            nakazanie: "Наказание: Штраф до $800."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 52.",
            stro4ki: ["Разметка в виде стрелок налево под углом указывает о сужении проезжей части, водитель должен будет пропустить транспорт чтобы выехать на главную полосу."],
            nakazanie: "Наказание: Штраф до $1.000 (если водитель не пропустил транспорт при перестроении из сужающейся полосы)."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 53.",
            stro4ki: ["Стоп-линия указывает место где нужно остановиться для того чтобы пропустить движущийся транспорт на перекрёстке, если транспорта нет, то следует снизить скорость и притормозить.",
            "Может использоваться надпись STOP на дороге без самой линии. Также данная разметка может действовать совместно со знаком STOP (в данном случае нарушения не суммируются)."],
            nakazanie: "Наказание: Штраф до $3.000 или изъятие лицензии на управление транспортом."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 54.",
            stro4ki: ["Требуется останавливаться перед пешеходным переходом, если пешеходы пересекают дорогу.",
            "а) Пешеходный переход обозначается двумя продольными параллельными линиями в пределах которых пешеходы совершают переход дороги.",
            "б) Пешеходный переход обозначается разметкой-зеброй по которой пешеходы совершают переход дороги."],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 55.",
            stro4ki: ["Двойная сплошная линия переходящая в сплошную линию с пунктирной, разрешает пересекать ее для обгона только со стороны пунктирной линии."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 56.",
            stro4ki: ["Разметка Bus Lane обозначает специальную полосу для автобусов. Водители “не автобусов” могут двигаться по этой полосе, если не создают помеху автобусам, в тоже время водители автобусов",
            " обязаны двигаться только по этой полосе, если такая имеется."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 57.",
            stro4ki: ["Разметка надписями No Parking и Keep Clear запрещает постановку любого транспорта в пределах разметки, кроме транспорта экстренных служб.",
            "Цвет разметки может быть как желтой, так и белой."],
            nakazanie: "Наказание: Штраф до $1.200."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 58.",
            stro4ki: [
            "Разделительная полоса. Может выделятся конструктивно: бордюром и зелеными насаждениями, а также может выделяется желтой сплошной линией по контуру. Пересекать и двигаться по разделительной полосе запрещено.",
            "Разделительная полоса может выделяться одинарной желтой сплошной, двойной желтой сплошной и белой сплошной линиями."
            ],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 59.",
            stro4ki: ["Разметку ст. 60 (может быть как белой, так и желтой) категорически запрещается пересекать, ибо ее края обозначены одинарной сплошной (ст. 50)"],
            nakazanie: "Наказание: Штраф до $1.200."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 60.",
            stro4ki: ["Знак требует снизить скорость и притормозить перед знаком, либо совершить полную остановку для того чтобы пропустить другой транспорт движущийся на перекрестке. Если имеется стоп-линия,",
            " то требуется остановиться перед ней. Если стоп-линия отсутствует, требуется остановиться перед знаком."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 61.",
            stro4ki: ["Знак предписывает выполнить требование уступить дорогу."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 62.",
            stro4ki: ["Знак запрещает совершать разворот на данном перекрестке."],
            nakazanie: "Наказание: Штраф до $1.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 63.",
            stro4ki: ["Знак запрещает дальнейшее движение."],
            nakazanie: "Наказание: Штраф до $600."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 64.",
            stro4ki: ["Знак запрещает совершать обгон до ближайшего перекрестка (либо до выезда из населенного пункта), даже если разметка позволяет обгон."],
            nakazanie: "Наказание: Штраф до $2.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 65.",
            stro4ki: ["Знак запрещает парковку в зоне действия знака (зона действия может обозначаться стрелочкой на знаке, от самого знака до ближайшего перекрестка в направлении стрелочки).",
            "На знаке могут быть написаны условия запрета парковки."],
            nakazanie: "Наказание: Штраф до $600."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 66.",
            stro4ki: ["Знак предписывает двигаться по правой стороне относительно знака.",
            "66.1 Знак предписывает двигаться по левой стороне относительно знака."],
            nakazanie: "Наказание: Штраф до $600."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава XIV. Номерные знаки"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 67.",
            stro4ki: ["Несоответствие номерного знака установленном на транспортном средстве с номерным знаком в техпаспорте."],
            nakazanie: "Наказание: Штраф до $5.000 и изъятие водительских прав."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 68.",
            stro4ki: ["Управление транспортным средством с нечитаемыми номерными знаками."],
            nakazanie: "Наказание: Штраф до $3.500."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 69.",
            stro4ki: ["Управление транспортным средством с незарегистрированным номерным знаком или его отсутствием."],
            nakazanie: "Наказание: Предупреждение, при повторном нарушении штраф до $5.000."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 70.",
            stro4ki: ["Смена номеров или сокрытие номерных знаков причастных к совершению преступления."],
            nakazanie: "Наказание: Наказание в соответствии с нарушением статьи 16.14 УК."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава IX Мотоциклетные шлемы"

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "Статья 71.",
            stro4ki: ["Управление мотоциклом/квадроциклом/трициклом без шлема или в незастегнутом шлеме."],
            nakazanie: "Наказание: Штраф до 5000$, при повторном нарушение изъятие водительского удостоверения."
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "Статья 72.",
            stro4ki: ["Перевозка пассажира на мотоцикле/квадроцикле/трицикле, у которого нет шлема или шлем не застегнут."],
            nakazanie: "Наказание: Штраф до 4000$, при повторном нарушение изъятие водительского удостоверения."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        return akt
    }

    get_YK() {
        ;^(\d+(\.\d+)+( \*+ )?(\(.(/.)*\))?) (.*)$
        ;zakon := {\n    nomer: "$1",\n    stro4ki: ["$6"]\n}

        akt_name := "УГОЛОВНО-АДМИНИСТРАТИВНЫЙ КОДЕКС ШТАТА САН-АНДРЕАС (от 28.03.2023)"

        akt := {name: akt_name, razdely: []}

        razdel_name := "Раздел I. Преступление и административное правонарушение"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 1. Понятие преступления, покушение на преступление и административное правонарушение."

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "1.1",
            stro4ki: ["Преступлением признается виновно совершенное общественно опасное деяние (противоправное, осознанное, волевое, действие или бездействие, нарушающее или создавшее реальную угрозу нарушения",
            " общественных отношений, охраняемых Уголовным законодательством), запрещенное настоящим Кодексом под угрозой наказания."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.2",
            stro4ki: ["Не является преступлением действие (бездействие), хотя формально и содержащее признаки преступления, но в силу малозначительности не представляющее общественной опасности."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.3",
            stro4ki: ["Совокупностью преступлений признается совершение двух или более преступлений. При совокупности преступлений лицо несет уголовную ответственность за каждое совершенное преступление ",
            "по соответствующей статье или части статьи настоящего Кодекса."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.4",
            stro4ki: ["Покушением на преступление признаются умышленные действия (бездействие) лица, непосредственно направленные на совершение преступления, если при этом преступление не было доведено до конца",
            " по независящим от этого лица обстоятельствам."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.5",
            stro4ki: ["Административным правонарушением признается противоправное, виновное действие (бездействие) физического или юридического лица, за которое настоящим Кодексом установлена административная ответственность."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.6",
            stro4ki: ["Незнание положений настоящего Кодекса и Законодательства Штата Сан-Андреас в целом, не освобождает виновное лицо от ответственности."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.7",
            stro4ki: [
            "В зависимости от характера и степени общественной опасности деяния, предусмотренные настоящим Кодексом, подразделяются на преступления небольшой тяжести, преступления средней тяжести, тяжкие преступления ",
            "и особо тяжкие преступления.",
            "К преступлениям небольшой тяжести относятся преступления, предусмотренные статьями 6.2, 7.4, 13.2, 16.6, 17.2, 17.5, 17.9, 18.1, 18.2 настоящего кодекса.",
            "К преступлениям средней тяжести относятся преступления, предусмотренные: 6.5, 8.1, 8.2, 8.3, 9.3, 10.3, 10.6, 11.1, 11.3, 11.4, 11.10, 11.11,11.12, 12.7.2, 15.1, 15.1.1, 15.2, 15.4, 15.5, 15.6, ",
            "16.1.1, 16.1.2, 16.7, 16.10, 16.11, 16.13, 16.15, 16.17, 18.4, 18.5, 18.7, 18.8 настоящего кодекса.",
            "К тяжким преступлениям относятся преступления, предусмотренные статьями настоящего кодекса: 6.3, 7.1, 10.4, 11.2, 11.6, 11.7, 12.8, 12.9, 12.10, 12.10.1, 13.2.1, 13.5, 14.1, 14.3, 14.5, 15.7, ",
            "16.1, 16.4, 16.5, 16.8, 16.12, 16.14, 17.1, 18.3, 18.6 настоящего кодекса.",
            "К особо тяжким преступлениям относятся преступления, предусмотренные статьями: 6.4, 12.1, 12.2, 12.3, 12.5, 12.12, 14.2, 14.4, 14.6, 16.2 настоящего кодекса."
            ]
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 2. Соучастие в преступлении."

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "2.1",
            stro4ki: ["Соучастием в преступлении признается умышленное совместное участие двух или более лиц в совершении умышленного преступления."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "2.2",
            stro4ki: [
            "Соучастниками преступления наряду с исполнителем признаются организатор, подстрекатель и пособник.",
            "Исполнитель - лицо, непосредственно совершившее преступление, либо непосредственно участвовавшее в его совершении совместно с другими лицами (соисполнителями).",
            "Организатор - организатором признается лицо, организовавшее совершение преступления или руководившее его исполнением.",
            "Подстрекатель - лицо, склонившее другое лицо к совершению преступления путем уговора, подкупа, угрозы или другим способом.",
            "Пособник - лицо, содействовавшее совершению преступления советами, указаниями, предоставлением информации, средств или орудий совершения преступления либо устранением препятствий."
            ]
        }
        glava.zakony.push(zakon)
        zakon := {
            nomer: "2.3",
            stro4ki: ["Соучастники преступления вне зависимости от вида соучастия несут ответственность в равном объёме."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "2.4",
            stro4ki: ["Преступление признается совершенным группой лиц, если в его совершении совместно участвовали более 2-х исполнителей."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "2.5",
            stro4ki: ["Совершение преступления группой лиц рассматривается как отягчающее обстоятельство при вынесении наказания."]
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 3. Обстоятельства, исключающие преступность деяния."

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "3.1",
            stro4ki: ["Не является преступлением причинение вреда посягающему лицу в состоянии необходимой обороны, при защите личности и прав обороняющегося или других лиц, если это посягательство было сопряжено с насилием, ",
            "опасным для жизни обороняющегося или другого лица, либо с непосредственной угрозой применения такого насилия."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.2",
            stro4ki: ["При причинении вреда в состоянии необходимой обороны не должны быть нарушены пределы необходимой обороны (умышленные действия, явно не соответствующие характеру и опасности посягательства)."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.3",
            stro4ki: ["Не является преступлением причинение вреда лицу, совершившему преступление, при его задержании для доставления органам власти, если иными средствами задержать такое лицо не представлялось возможным ",
            "и при этом не было допущено превышения необходимых для этого мер (когда лицу без необходимости причиняется явно чрезмерный, не вызываемый обстановкой вред)."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.4",
            stro4ki: ["Не является преступлением причинение вреда в состоянии крайней необходимости, то есть для устранения опасности, непосредственно угрожающей личности и правам данного лица или иных лиц, ",
            "если эта опасность не могла быть устранена иными средствами и при этом, не было допущено превышения пределов крайней необходимости, явно не соответствующего характеру и степени угрожавшей опасности и обстоятельствам."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.5",
            stro4ki: ["Не является преступлением причинение вреда при обоснованном риске для достижения общественно полезной цели, если указанная цель не могла быть достигнута не связанными с риском действиями (бездействием). ",
            "Риск не признается обоснованным, если он заведомо был сопряжен с угрозой для жизни многих людей."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.6",
            stro4ki: ["Не является преступлением причинение вреда охраняемым интересам лицом, действующим во исполнение обязательных для него приказа или распоряжения. Уголовную ответственность за причинение такого вреда ",
            "несет лицо, отдавшее незаконный приказ или распоряжение. (Лицо, совершившее преступление во исполнение заведомо незаконного приказа или распоряжения, несет уголовную ответственность на общих основаниях. ",
            "Неисполнение заведомо незаконного приказа или распоряжения исключает уголовную ответственность)."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.6.1",
            stro4ki: ["При передаче задержанного от сотрудника одной государственной структуры к другой, обязательным условием является предоставление опознавательного жетона или удостоверения. ",
            "Также ответственность за данного задержанного несет сотрудник, который передал преступника, а не государственный служащий, который совершил заключение под стражу."]
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        razdel_name := "Раздел II. Назначение наказания и освобождение от ответственности и наказания"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 4. Назначение наказания."

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "4.1",
            stro4ki: ["Лицу, признанному виновным в совершении преступления и/или административного правонарушения, назначается справедливое наказание в пределах, предусмотренных настоящим Кодексом."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "4.2",
            stro4ki: ["При назначении наказания учитываются характер и степень общественной опасности преступления и личность виновного, в том числе обстоятельства, смягчающие и отягчающие наказание."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "4.3",
            stro4ki: [
            "Смягчающими обстоятельствами признаются:",
            "Совершение преступления в результате физического или психического принуждения либо в силу материальной, служебной или иной зависимости;",
            "Совершение преступления при нарушении условий правомерности необходимой обороны, задержания лица, совершившего преступление, крайней необходимости, обоснованного риска, исполнения приказа или распоряжения;",
            "Противоправность или аморальность поведения потерпевшего, явившегося поводом для преступления;",
            "Явка с повинной, активное способствование раскрытию и расследованию преступления, изобличению и уголовному преследованию других соучастников преступления;",
            "Оказание медицинской и иной помощи потерпевшему после совершения преступления, добровольное возмещение имущественного ущерба и морального вреда, причиненных в результате преступления, иные действия,",
            " направленные на заглаживание вреда, причиненного потерпевшему;",
            "Иные обстоятельства."
            ]
        }
        glava.zakony.push(zakon)
        zakon := {
            nomer: "4.4",
            stro4ki: [
            "Отягчающими обстоятельствами признаются:",
            "Совершение преступления в составе группы лиц;",
            "Совершение преступления по мотивам политической, идеологической, расовой, национальной или религиозной ненависти, или вражды либо по мотивам ненависти или вражды в отношении какой-либо социальной группы;",
            "Совершение преступления из мести за правомерные действия других лиц, а также с целью скрыть другое преступление или облегчить его совершение;",
            "Совершение преступления в отношении лица или его близких в связи с осуществлением данным лицом служебной деятельности или выполнением общественного долга;",
            "Совершение преступления с особой жестокостью, садизмом, издевательством, а также мучениями для потерпевшего;",
            "Совершение преступления с использованием доверия, оказанного виновному в силу его служебного положения или договора;",
            "Совершение преступления с использованием форменной одежды или документов представителя власти;",
            "Рецидивизм."
            ]
        }
        glava.zakony.push(zakon)
        zakon := {
            nomer: "4.5",
            stro4ki: [
            "В результате судебного процесса по уголовному делу могут быть назначены следующие виды наказаний:",
            "Судебный штраф;",
            "Лишение права занимать определенные должности или заниматься определенной деятельностью;",
            "Увольнение с государственной или военной службы, в том числе с лишением всех званий, наград и привилегий;",
            "Лишение свободы на определенный срок;",
            "Пожизненное лишение свободы."
            ]
        }
        glava.zakony.push(zakon)
        zakon := {
            nomer: "4.6",
            stro4ki: ["При нарушении двух и более административных статей УАК, предусматривающих арест, лицо, признанное виновным в совершении преступления, может быть привлечено к уголовной ответственности сроком до 2 лет."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "4.7",
            stro4ki: ["В случае, если лицо обвиняется по более чем одной статье, то срок лишения свободы по всем инкриминируемым статьям суммируется."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "4.8",
            stro4ki: ["Штрафы, предусмотренные статьями настоящего Кодекса, взыскиваются сотрудником государственной структуры, применившим данную меру наказания, а также в судебном порядке сотрудниками Офиса Генерального Прокурора."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "4.9",
            stro4ki: ["Упразднена."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "4.10",
            stro4ki: [
            "Выход под залог возможно осуществить только из КПЗ LSPD/LSSD и СИЗО Федеральной тюрьмы в соответствии с положениями соответствующих статей настоящего Кодекса и Закона 'О деятельности Коллегии Адвокатов ",
            "на территории штата Сан-Андреас'.",
            "Примечание: Если органом, проводившим расследование/арест, не был установлен запрет выхода под залог в соответствии с Процессуальным кодексом штата Сан-Андреас, лицу, отбывающему наказание, ",
            "лишение свободы может быть заменено на залог, определяемый в соответствии с положениями соответствующих статей настоящего Кодекса и Закона 'О деятельности Коллегии Адвокатов на территории штата Сан-Андреас'."
            ]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "4.11",
            stro4ki: ["Выпуск под залог осуществляется из расчета 1 год лишения свободы - $1500 залога."]
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 5. Освобождение от уголовной ответственности и наказания."

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "5.1",
            stro4ki: ["Лицо, впервые совершившее преступление и/или административное правонарушение, предусматривающее какой-либо вред, может быть освобождено от ответственности, если оно примирилось ",
            "с потерпевшим и загладило причиненный потерпевшему вред."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "5.2",
            stro4ki: [
            "Лицо, впервые совершившее преступление может быть освобождено Судом или сотрудниками Офиса Генерального Прокурора от уголовной ответственности с назначением штрафа.",
            "Примечание: Лицо не может быть освобождено от уголовной ответственности по статье 5.2 УАК в случае нарушения статей Главы 6: 6.3, 6.4; Главы 7: 7.1; Главы 8; Главы 10: 10.1, 10.2, 10.3, 10.4; ",
            "Главы 12: 12.1, 12.2, 12.3, 12.5, 12.8; Главы 13: 13.1, 13.2, 13.2.1, 13.5; Главы 14; Главы 15: 15.1, 15.1.1, 15.4, 15.5; Главы 17: 17.1, 17.2, 17.5, 17.8."
            ]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "5.3",
            stro4ki: ["Лицо освобождается от ответственности, если со дня совершения преступления и/или административного правонарушения прошел 31 год (( 31 ООС день )), кроме части 4 настоящей главы."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "5.4",
            stro4ki: ["К лицам, совершившим преступления, предусмотренные главой 14, а также статьями 6.3, 6.4, 8.2, 12.1, 12.2, 12.3, 12.5, 13.2, 13.2.1, 15.1, 15.6, 17.1 настоящего Кодекса, сроки давности не применяются."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "5.5",
            stro4ki: [
            "Запреты к работе на государственной службе:",
            "Административные [A] статьи влекут за собой запрет на работу в государственных учреждениях/организациях на 5 лет (( 5 ООС дней )).",
            "Региональные [P] статьи влекут за собой запрет на работу в государственных учреждениях/организациях на 15 лет (( 15 ООС дней )), кроме статей, описанных в статье 5.4 настоящего кодекса.",
            "- Регионально-Федеральные [Р/Ф] и финансовые [Д] статьи влекут за собой запрет на работу в государственных учреждениях/организациях на 30 лет (( 30 ООС дней )), кроме статей, описанных в статье 5.4 настоящего кодекса.",
            "Федеральные [Ф], а также статьи описанные в статье 5.4 настоящего Кодекса, влекут за собой пожизненный запрет на работу, службу в государственных учреждениях, организациях.",
            "Примечание: Срок запрета исчисляется с момента отбытия наказания.",
            "Запрещено принимать на работу людей с действующими статьями которые накладывают запрет на работу в государственных структурах."
            ]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "5.6",
            stro4ki: ["Лицо, добровольно сдавшее предметы, указанные в статьях 12.8, 12.9, 13.1, 13.2, 13.2.1 настоящего Кодекса, освобождается от уголовной ответственности по соответствующей статье. ",
            "Не может признаваться добровольной сдачей предметов их изъятие при задержании лица, а также при производстве любых оперативных и/или следственных действий."]
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        ;Особенная часть

        ;(( Независимо от количества статей: ))
        ;(( Максимальный срок заключения в федеральный блок — 120 минут ))
        ;(( Максимальный срок заключения в следственный изолятор — 60 минут ))
        ;(( Минимальный срок заключения в оба блока — 30 минут ))
        ;(( Максимальный срок заключения в КПЗ — 40 минут ))

        ;(🟢) - Административная часть (( 1 сутки = 1 минута )).
        ;(🟡) - Уголовная часть (( 1 год = 10 минутам )).
        ;[А] - Административные статьи.
        ;[Р] - Региональные статьи.
        ;[Ф] - Федеральные статьи.
        ;[Э] - Финансовые статьи.
        ;[В] - Военные статьи.
        ;[Д] - Должностные статьи.

        razdel_name := "Раздел III. Преступления против личности"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 6. Преступления против жизни и здоровья."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟢",
            nomer: "6.1",
            tip: "[А]",
            stro4ki: ["Умышленное нанесение телесных повреждений (( 5 - 99% HP ))."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "6.2",
            tip: "[Р]",
            stro4ki: ["Умышленное нанесение особо тяжких телесных повреждений (( Нокнутое состояние ))."],
            nakazanie: "→ От 3 до 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "6.3",
            tip: "[Р/Ф]",
            stro4ki: ["Убийство, то есть умышленное причинение смерти другому человеку (( IC смерть персонажа ))."],
            nakazanie: "→ От 6 до 10 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "6.4",
            tip: "[Ф]",
            stro4ki: ["Тяжкое убийство, то есть убийство двух или более лиц, лица или его близких в связи с осуществлением данным лицом служебной деятельности; совершенное с особой жестокостью; совершенное общеопасным способом; ",
            "совершенное группой лиц; из корыстных побуждений или по найму (( IC смерть персонажа ))."],
            nakazanie: "→ 12 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "6.5",
            tip: "[Р]",
            stro4ki: ["Причинение тяжкого вреда здоровью по неосторожности (( Нокнутое состояние ))."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "6.6",
            tip: "[А]",
            stro4ki: ["Угрозы: - расправы; причинения увечий; смерти другому человеку, с целью устрашить его."],
            nakazanie: "→ От 10 до 30 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 7. Преступления против свободы, чести и достоинства личности."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "7.1",
            tip: "[Ф]",
            stro4ki: ["Похищение человека."],
            nakazanie: "→ 10 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "7.2",
            tip: "[А]",
            stro4ki: ["Клевета, то есть распространение заведомо ложных сведений, порочащих честь и достоинство другого лица или подрывающих его репутацию."],
            nakazanie: "→ От 10 до 40 суток ограничения свободы в КПЗ, либо штраф от 2.500$ до 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "7.3",
            tip: "[А]",
            stro4ki: ["Клевета, содержащаяся в публичном выступлении, средствах массовой информации либо с использованием своего служебного положения."],
            nakazanie: "→ От 10 до 30 суток ограничения свободы в КПЗ, либо штраф от 2.500$ до 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "7.4",
            tip: "[Р]",
            stro4ki: ["Клевета, соединенная с обвинением лица в совершении преступления."],
            nakazanie: "→ 40 суток лишения свободы в КПЗ, либо штраф до 5.000$"
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "7.5",
            tip: "[А]",
            stro4ki: ["Нарушение против личности, деловой репутации и оскорбления сотрудниками представительства Средств Массовой информации, равно нарушение законодательства об журналистской деятельности."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ, либо штраф от 2.500$ до 5.000$."
        }
        glava.zakony.push(zakon)
        ;Примечание: Лишает права осуществлять журналистскую деятельность в течение 14 лет (( 14 дней ))

        razdel.glavy.Push(glava)

        glava_name := "Глава 8. Преступления против половой неприкосновенности и половой свободы личности."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "8.1",
            tip: "[Р]",
            stro4ki: ["Изнасилование, мужеложство, лесбиянство или иные действия сексуального характера, то есть половое сношение с применением насилия или с угрозой его применения к потерпевшей (потерпевшему)",
            " или к другим лицам либо с использованием беспомощного состояния потерпевшей (потерпевшему)."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "8.2",
            tip: "[Ф]",
            stro4ki: ["Изнасилование, мужеложство, лесбиянство или иные действия сексуального характера повлекшее причинение тяжкого вреда здоровью или смерть потерпевшего (потерпевшей)."],
            nakazanie: "→ 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "8.3",
            tip: "[Р]",
            stro4ki: ["Понуждение лица к половому сношению, мужеложству, лесбиянству или совершению иных действий сексуального характера путем шантажа, угрозы уничтожением, повреждением или изъятием имущества либо ",
            "с использованием материальной или иной зависимости потерпевшего (потерпевшей)."],
            nakazanie: "→ От 3 до 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 9. Преступления против конституционных прав и свобод человека и гражданина."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟢",
            nomer: "9.1",
            tip: "[А]",
            stro4ki: ["Незаконный сбор или распространение сведений о частной жизни лица, составляющих его личную или семейную тайну, без его согласия либо распространение этих сведений в публичном выступлении, ",
            "публичном произведении или средствах массовой информации, в том числе с использованием своего служебного положения."],
            nakazanie: "→ До 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "9.2",
            tip: "[А]",
            stro4ki: ["Незаконное проникновение или же попытка (взлом) в жилище, совершенное против воли проживающего в нем лица, либо в его отсутствие, в том числе с использованием своего служебного положения."],
            nakazanie: "→ До 40 суток ограничения свободы в КПЗ, либо штраф 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "9.3",
            tip: "[Р/Ф]",
            stro4ki: ["Воспрепятствование свободному осуществлению гражданином своих избирательных прав, в том числе соединенные с подкупом, обманом, принуждением, применением насилия либо с угрозой его применения."],
            nakazanie: "→ 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "9.4",
            tip: "[А]",
            stro4ki: ["Воспрепятствование законной профессиональной деятельности журналистов путем принуждения их к распространению либо к отказу от распространения информации."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ, либо штраф от 2.500$ до 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "9.5",
            tip: "[А]",
            stro4ki: ["Воспрепятствование законной профессиональной деятельности журналистов путем незаконного ограничения права поиска, получения, передачи, производства и распространения информации любым законным способом."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ, либо штраф от 2.500$ до 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "9.6",
            tip: "[А]",
            stro4ki: ["Дискриминация в сфере труда, выраженная в неправомерных с точки зрения трудового законодательства действиях работодателя в отношении официально трудоустроенного сотрудника,"],
            nakazanie: "→ Штраф в размере 10.000$."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        razdel_name := "Раздел IV. Преступления в сфере экономики"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 10. Преступления против собственности."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟢",
            nomer: "10.1",
            tip: "[А]",
            stro4ki: ["Кража, то есть тайное хищение чужого имущества."],
            nakazanie: "→ До 40 суток ограничения свободы в КПЗ, либо штраф 4.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "10.2",
            tip: "[А/Э]",
            stro4ki: ["Мошенничество, то есть хищение чужого имущества или приобретение права на чужое имущество путем обмана или злоупотребления доверием."],
            nakazanie: "→ До 40 суток ограничения свободы в КПЗ, либо штраф до $20000 и возмещение ущерба."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "10.3",
            tip: "[Р]",
            stro4ki: ["Грабеж, то есть открытое хищение чужого имущества."],
            nakazanie: "→ От 3 до 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "10.4",
            tip: "[Р/Ф]",
            stro4ki: ["Разбой, то есть нападение в целях хищения чужого имущества, совершенное с угрозой или применением насилия, опасного для жизни или здоровья, либо с угрозой применения такого насилия."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "10.5",
            tip: "[А]",
            stro4ki: ["Неправомерное завладение автомобилем или иным транспортным средством как с целью хищения, так и без (угон)."],
            nakazanie: "→ 40 суток ограничения свободы в КПЗ, либо штраф 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "10.6",
            tip: "[Р]",
            stro4ki: ["Умышленные уничтожение или повреждение чужого имущества."],
            nakazanie: "→ От 3 до 4 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "10.7",
            tip: "[А]",
            stro4ki: ["Вандализм, то есть осквернение зданий или иных сооружений, порча имущества, общественного транспорта или иных общественных мест."],
            nakazanie: "→ 40 суток ограничения свободы в КПЗ, либо штраф 5.000$."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 11. Преступления в сфере экономической деятельности."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "11.1",
            tip: "[Э]",
            stro4ki: ["Осуществление предпринимательской деятельности без регистрации."],
            nakazanie: "→ 4 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.2",
            tip: "[Р/Э]",
            stro4ki: ["Принуждение к совершению сделки или к отказу от ее совершения под угрозой применения насилия, уничтожения или повреждения чужого имущества."],
            nakazanie: "→ От 3 до 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.3",
            tip: "[Р/Э]",
            stro4ki: ["Организация, проведение и участие в азартных играх в общественных местах."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.4",
            tip: "[Э]",
            stro4ki: ["Уклонение от уплаты налогов."],
            nakazanie: "→ От 4 до 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "11.5",
            tip: "[А]",
            stro4ki: ["Браконьерство. Ловля рыбы или охотничья деятельность вне специально отведенных местах без соответствующей лицензии или вылов рыбы/добыча шкур в количестве превышающем установленные",
            " ответственными органами нормы"],
            nakazanie: "→ Наказывается в соответствии с законом 'об Охране природных ресурсов'."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.6",
            tip: "[Ф/Э]",
            stro4ki: ["Финансовые махинации (Нецелесообразный расход средств госбюджета; премирование сотрудников или номинация на премии при отсутствии отчетности; хищение денежных средств выданных из госбюджета)."],
            nakazanie: "→ От 5 до 12 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.7",
            tip: "[Ф/Э]",
            stro4ki: ["Расходование бюджетных средств должностным лицом на цели, не соответствующим условиям их получения."],
            nakazanie: "→ От 5 до 10 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "11.8",
            tip: "[А/Э]",
            stro4ki: [
            "Осуществление торговой деятельности в общественных местах.",
            "Исключение: Предназначенными для осуществления торговли, общественными местами, являются Амфитеатр, Пляж Дель-Перро (Рынок Б/У автомобилей) и рынок, находящийся на пляже Vespucci."
            ],
            nakazanie: "→ До 40 суток ограничения свободы в КПЗ, либо штраф 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.9",
            tip: "[Ф/Э]",
            stro4ki: ["Отказ от предоставления финансовой информации уполномоченным лицам (сокрытие финансовой документации или уклонения от проверки)."],
            nakazanie: "→ От 3 до 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.10",
            tip: "(Э)",
            stro4ki: ["Уклонение от уплаты штрафа наложенным официальным постановлением."],
            nakazanie: "→ Принудительное взыскание суммы долга в 2-х кратном размере и от 3 до 6 лет лишения свободы"
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "11.11",
            tip: "(Ф)",
            stro4ki: ["Распространение журналистом рекламы или сведений об организации или группе лиц, которая не зарегистрирована в установленном Законом о предпринимательской деятельности порядке, ",
            "а равно в отсутствии у организации или группы лиц лицензии, либо в условиях аннулирования или приостановления лицензии на предпринимательскую деятельность у организации или группы лиц."],
            nakazanie: "→ От 1 до 2 лет лишения свободы либо штраф в размере 25.000$ - 75.000$"
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        razdel_name := "Раздел V. Преступления против общественной безопасности и общественного порядка"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 12. Преступления против общественной безопасности."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "12.1",
            tip: "[Ф]",
            stro4ki: ["Терроризм, то есть совершение взрыва, поджога или иных действий, устрашающих население и создающих опасность гибели человека, причинения значительного имущественного ущерба ",
            "либо наступления иных тяжких последствий, в целях дестабилизации деятельности органов власти или международных организаций либо воздействия на принятие ими решений, ",
            "а также угроза совершения указанных действий в целях воздействия на принятие решений органами власти."],
            nakazanie: "→ 12 лет лишения свободы в Федеральной тюрьме.."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.2",
            tip: "[Ф]",
            stro4ki: ["Склонение, вербовка или иное вовлечение лица в терроризм, а равно финансирование терроризма."],
            nakazanie: "→ От 5 до 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.3",
            tip: "[Ф]",
            stro4ki: ["Захват или удержание лица в качестве заложника, совершенные в целях понуждения государства, организации или гражданина совершить какое-либо действие или воздержаться от совершения какого-либо действия ",
            "как условия освобождения заложника."],
            nakazanie: "→ 10 лет лишения свободы."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "12.4",
            tip: "[А]",
            stro4ki: ["Заведомо ложное сообщение о готовящихся взрыве, поджоге или иных действиях, создающих опасность гибели людей, причинения значительного имущественного ущерба ",
            "либо наступления иных общественно опасных последствий."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.5",
            tip: "[Р/Ф]",
            stro4ki: ["Организация массовых беспорядков, а равно участие в них, сопровождавшихся насилием, погромами, поджогами, уничтожением имущества, применением оружия, взрывных устройств, взрывчатых, ",
            "отравляющих либо иных веществ и предметов, представляющих опасность для окружающих, а также оказанием вооруженного сопротивления представителю власти, а равно подготовка лица для организации таких массовых беспорядков",
            " или участия в них."],
            nakazanie: "→ От 5 до 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "12.6",
            tip: "[А]",
            stro4ki: ["Хулиганство, то есть неоднократное нарушение общественного порядка, выражающее явное неуважение к обществу, нарушение правил поведения в учреждениях, организациях,",
            " а равно неоднократное и злостное мелкое хулиганство (см. комментарий к ст. 12.6).",
            "1. Граждане обязаны соблюдать общепринятые нормы поведения граждан в общественных местах.",
            "2. На территории учреждения запрещается:",
            "Нарушать общественный порядок (в том числе громко, нецензурно выражаться, оскорбительно приставать к посетителям и персоналу и иным образом провоцировать конфликты);",
            "Использовать любые средства, вещества которые могут привести к пожару или взрыву;",
            "Приносить, передавать или использовать оружие, спиртные напитки, табачные изделия, токсические и наркотические вещества;",
            "Производить любые иные действия, влекущие за собой опасные последствия для окружающих и самого посетителя;",
            "Курить сигареты/кальян/бонг и использовать вейп в помещениях учреждения и на его территории;",
            "Употреблять в речи ненормативную лексику, неприличные слова и выражения, жесты;",
            "Создавать конфликтные ситуации и решать их посредством драки или иного злоупотребления силой;",
            "Делать сотрудникам Учреждения предложения коррупционного, заранее невыполнимого или непристойного характера, унижать и оскорблять их словами или действиями, отвлекать их от выполнения служебных обязанностей;",
            "Осуществлять на территории учреждения любую агитационную деятельность, адресованную неограниченному кругу лиц;",
            "Проходить в служебные помещения и на рабочие места сотрудников Учреждения без сопровождения работников Учреждения или сотрудников охраны.",

            ],
            nakazanie: "→ До 40 суток ограничения свободы в КПЗ, либо штраф до 3.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.7",
            tip: "[А]",
            stro4ki: ["Незаконное проникновение (нахождение) на охраняемый в соответствии с законодательством Штата Сан-Андреас объект",
            "Охраняемыми объектами являются следующие:",
            "– Участки LSPD, LSSD и служебные парковки, кроме территории холла.",
            "– Офис FIB и служебные парковки, кроме территории холла.",
            "– Капитолий Штата Сан-Андреас, кроме территории холла.",
            "– Здания медицинских учреждений и служебные парковки, кроме территории холла.",
            "– Государственное химическое предприятие Humane Labs.",
            "Запрещен полный доступ всем, кроме:",
            "– Участки LSPD, LSSD и служебные парковки, кроме территории холла. Имеют доступ: Губернатор, Вице-Губернатор, Управляющий Делами Губернатора, Генеральный прокурор, его заместители и советники, ",
            "Министр Внутренней Безопасности, его заместители и советники, Мэры города Лос-Сантос и округа Блейн, их заместители и советники, сотрудники Офиса Генерального прокурора, ",
            "сотрудники правоохранительных структур во время проведения процессуальных действий (исключение - сотрудники LSPD/LSSD, обладающие полным доступом), частные и государственные адвокаты, ",
            "(исключение - служебные парковки), сотрудники Экстренной Медицинской Службы во время осуществления первой медицинской помощи при поступлении вызова.",
            "Примечание: частные и государственные адвокаты имеют доступ исключительно к КПЗ LSPD и LSSD с целью выполнения своих служебных обязанностей.",
            "– Офис FIB и служебные парковки, кроме территории холла. Имеют доступ: Губернатор, Вице-Губернатор,Управляющий Делами Губернатора, Генеральный прокурор Штата Сан-Андреас, его заместители, ",
            "Министр Внутренней Безопасности, его заместители, сотрудники FIB, сотрудники Экстренной Медицинской Службы во время осуществления первой медицинской помощи при поступлении вызова.",
            "– Капитолий Штата Сан-Андреас, кроме территории холла. Имеют доступ: сотрудники Правительства Штата Сан-Андреас, сотрудники Экстренной Медицинской Службы во время осуществления первой медицинской помощи ",
            "при поступлении вызова.",
            "– Здания медицинских учреждений и служебные парковки, кроме территории холла. Имеют доступ: Губернатор, Вице-Губернатор, Управляющий Делами Губернатор, Главы отраслевых Департаментов Правительства, ",
            "их заместители и советники, сотрудники Офиса Генерального прокурора, сотрудники правоохранительных структур во время проведения процессуальных действий, сотрудники Экстренной Медицинской Службы.",
            "– Государственное химическое предприятие Humane Labs. Имеют доступ: Губернатор, Вице-губернатор, Управляющий Делами Губернатора, Главы отраслевых Департаментов Правительства и их заместители, ",
            "сотрудники правоохранительных структур во время проведения процессуальных действий, сотрудники Экстренной Медициской Службы во время осуществления первой медицинской помощи при поступлении вызова. ",
            ],
            nakazanie: "→ До 40 суток лишения свободы, либо штраф в размере до 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "12.7.1",
            tip: "[А]",
            stro4ki: ["Незаконное проникновение (нахождение) на частную территорию, объект. (см. комментарий к ст. 12.7.1)",
            "Частной территорией, объектами считается:",
            "1. Weazel News, кроме территории холла;",
            "2. Территория частных организаций (Особняки).",
            "Запрещен полный доступ всем, кроме:",
            "1. Weazel News - кроме территории холла - сотрудники LSPD/USSS/FIB для проведения процессуальных действий, а также Генеральный прокурор и его заместители, Вице-Губернатор, Губернатор.",
            "2. Территория частных организаций (Особняки) - сотрудники LSPD/LSSD/USSS/FIB для проведения процессуальных действий.",
            "Исключение: Доступ может быть получен при наличии соответствующего ордера от Генерального прокурора Штата Сан-Андреас, Вице-Губернатора, Губернатора или Верховного Судьи.",
            "Доступ иных лиц на охраняемые объекты возможен исключительно при сопровождении лиц, имеющих право доступа к ним.",
            ],
            nakazanie: "→ От 10 до 30 суток лишения свободы, либо штраф до 5000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.7.2",
            tip: "[Р/Ф]",
            stro4ki: ["Незаконное проникновение (нахождение) на особо охраняемый объект в соответствии с законодательством штата Сан-Андреас,",
            "Особо охраняемыми объектами являются следующие:",
            "– ВПП, ангары аэропорта и прилегающие территории",
            "– Федеральная тюрьма Bolingbroke и ее воздушное пространство",
            "– Форт Занкудо и его воздушное пространство;",
            "– Авианосец USS Luxington и его воздушное пространство;",
            "– Дополнительные объекты, указанные в нормативно-правовых актах ",
            "Запрещен полный доступ всем, кроме:",
            "– ВПП, ангары аэропорта и прилегающие территории. Имеют доступ: сотрудники USSS, сотрудники Правительства, сотрудники силовых структур для выполнения служебных заданий. Медики для оказания первой помощи.",
            "– Форт Занкудо. Имеют доступ: военнослужащие Национальной Гвардии Штата, Губернатор, Вице-Губернатор, Управляющий Делами Губернатора, Генеральный прокурор и его заместители, советники, Министр Внутренней Безопасности, ",
            "его заместители и советники, сотрудники государственных структур во время специальных операцией по защите интересов национальной безопасности. Другие граждане в сопровождении генералитета или при наличии пропуска,",
            " выданного генералитетом Национальной Гвардии в соответствии с внутренним регламентом.",
            "– Авианосец. Имеют доступ: военнослужащие Национальной Гвардии Штата, Губернатор, Вице-Губернатор,Управляющий Делами Губернатора, Министр Внутренней Безопасности, его заместители и советники.",
            " Другие граждане в сопровождении генералитета или при наличии пропуска, выданного генералитетом Национальной Гвардии в соответствии с внутренним регламентом.",
            "– Вся территория Федеральной Тюрьмы, кроме гостевой парковки и холла тюрьмы. Имеют доступ: сотрудники SASPA. Сотрудники LSPD, USSS, NG, LSSD, FIB при исполнении своих должностных обязанностей. ",
            "EMS для оказания медицинской помощи или по вызову сотрудниками федеральной тюрьмы. Губернатор, Вице-Губернатор, Управляющий Делами Губернатора, Министр Внутренней Безопасности, его заместители и советники, ",
            "Генеральный прокурор, его заместители и советники, сотрудники Офиса Генерального прокурора, государственные адвокаты, руководство сотрудников правоохранительных структур в случае задержания их подчиненных",
            " по вызову сотрудников, производящих процесс задержания, частные адвокаты по вызову задержанного с целью реализации его прав во время задержания.",
            ],
            nakazanie: "→ 5 лет лишения свободы в Федеральной Тюрьме"
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.8",
            tip: "[Р/Ф]",
            stro4ki: [
            "Незаконные приобретение, передача, сбыт, хранение, перевозка или ношение любых видов оружия/боеприпасов, спец. средств государственного образца, открытое ношение бронежилета гражданского образца ",
            "на территории госучреждений, а также иное нарушение закона “о Регулировании оборота оружия боеприпасов и спецсредств в штате Сан-Андреас”.",
            "12.8.1 Лицо, добровольно сдавшее предметы, указанные в настоящей статье, освобождается от уголовной ответственности, если нет нарушений других статей настоящего кодекса."],
            nakazanie: "→ От 3 до 8 лет лишения свободы в Федеральной тюрьме и лишение лицензии на оружие."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.9",
            tip: "[Ф]",
            stro4ki: ["Незаконные приобретение, передача, сбыт, хранение, перевозка, изготовление или ношение взрывчатых веществ или взрывных устройств и предметов, поражающее действие которых основано",
            " на использовании горючих веществ."],
            nakazanie: "→ От 3 до 10 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.10",
            tip: "[Р/Ф]",
            stro4ki: ["Хищение огнестрельного оружия, комплектующих деталей к нему, боеприпасов, взрывчатых веществ или взрывных устройств."],
            nakazanie: "→ 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.10.1",
            tip: "[Р/Ф]",
            stro4ki: ["Хищение, совершенное сотрудниками правоохранительных органов, огнестрельного оружия, комплектующих деталей к нему, боеприпасов, наркотических веществ и бронежилетов, спец.средств, ",
            "изъятых в ходе служебной деятельности и (или) находящихся на складе улик (вещественных доказательств) или подлежащее уничтожению."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "12.11",
            tip: "[А]",
            stro4ki: ["Нарушение установленного порядка организации, либо проведения собрания, митинга, демонстрации, шествия или пикетирования, согласно закону 'О собраниях, митингах, демонстрациях, шествиях и пикетированиях'."],
            nakazanie: "→ 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.12",
            tip: "(Ф)",
            stro4ki: ["Создание преступного сообщества (преступной организации) в целях совершения одного или нескольких тяжких или особо тяжких преступлений либо руководство преступным сообществом (преступной организацией) ",
            "или входящими в него (нее) структурными подразделениями, а равно координация действий организованных групп, создание устойчивых связей между ними, разработка планов и создание условий ",
            "для совершения преступлений организованными группами, раздел сфер преступного влияния и (или) преступных доходов между такими группами."],
            nakazanie: "→ От 10 до 12 лет лишения свободы, либо пожизненное лишение свободы."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 13. Преступления против здоровья населения и общественной нравственности."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟢",
            nomer: "13.1",
            tip: "[А]",
            stro4ki: [
            "Незаконные приобретение, хранение, перевозка, изготовление наркотических средств свыше 5 грамм легких наркотических веществ ((косяк)) или до 3 грамм тяжелых наркотических веществ ((SPANK)).",
            "Исключение: Пометка М в медицинской карте позволяет употреблять, иметь при себе до 8 штук курительной марихуаны (косяков, марихуаны), но не дает право на осуществление продажи курительной марихуаны."
            ],
            nakazanie: "→ 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "13.2",
            tip: "[Р/Ф]",
            stro4ki: ["Незаконные приобретение, хранение, сбыт, перевозка легких наркотических веществ ((косяк)) свыше 10 грамм, либо тяжелых наркотических веществ ((SPANK)) свыше 3 грамм."],
            nakazanie: "→ 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "13.2.1",
            tip: "[Ф]",
            stro4ki: ["Незаконные приобретение, хранение, перевозка наркотических средств свыше 35 грамм , либо тяжелых наркотических веществ ((SPANK)) свыше 5 грамм, либо анальгетиков."],
            nakazanie: "→ 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "13.3",
            tip: "[А]",
            stro4ki: ["Сутенерство. Вовлечение лиц в занятие проституцией. Организация притона для занятия проституцией, либо же сопровождение лица для занятия проституцией с целью получения дохода."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "13.4",
            tip: "[А]",
            stro4ki: ["Нахождение в неприемлемом виде в общественных местах (( Зеленых зонах )) и местах большого скопления людей свыше семи человек, а также на закрытых и охраняемых территориях. (см. комментарий к ст. 13.4)",
            "Неприемлемым видом считается:",
            "Нахождение без любого из элементов верхней одежды;",
            "Нахождение в маске, для гражданских лиц.",
            "Исключение: Высокопоставленное руководство государственных структур при исполнении служебных обязанностей, а также сотрудники ЧВК при исполнении обязанностей,",
            " предусмотренных Законом “О деятельности ЧВК и ЧОП на территории штата Сан-Андреас”. По первому требованию сотрудников государственных структур - лица попадающие под данный перечень обязаны предъявить опознавательный знак в случае ",
            " если являются засекреченной личностью, в ином случае снять маску и предъявить служебное удостоверение.",
            "Исключение: Разрешено находиться в общественном месте в медицинской маске.",
            "Примечание: Если гражданское лицо было задержано за отказ снять маску в общественном месте, то сотрудник проводящий задержание имеет полное право сорвать её.",
            "В состоянии опьянения, оскорбляющем человеческое достоинство.",
            "Нахождение в мотоциклетном шлеме.",
            "Примечание: Разрешено находиться в мотоциклетном шлеме на территории байкерских клубов, а также находясь в транспортном средстве (включая мотоциклы).",
            "Нахождение в трусах, беговых шортах, в купальниках и нижнем белье.",
            "Исключение: нахождение на территории пляжа. В беговых шортах разрешено нахождение на спортивных площадках.",
            "Нахождение в одежде, которая скрывает личность. (Пример: худи, которое застегивается на лице).",
            "Исключение: Одежда с медицинской маской (Пример: топ с маской Nike). ",
            ],
            nakazanie: "→ До 30 суток ограничения свободы в КПЗ, либо штраф в размере до 3.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "13.5",
            tip: "[Р/Ф]",
            stro4ki: ["Использование, хранение гражданскими лицами спец. средств государственного образца: бронежилет, тазер, дубинка, и прочее государственное имущество, имеющие серийные номера государственного образца (FIB,LSPD,LSSD,ARMY,MAY,PRIS)."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "13.6",
            tip: "[А]",
            stro4ki: ["Проституция. Предоставление, а равно предложение услуг сексуального характера. "],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        razdel_name := "Раздел VI. Преступления против государственной власти"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 14. Преступления против основ конституционного строя и безопасности государства."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "14.1",
            tip: "[Ф]",
            stro4ki: ["Посягательство на жизнь государственного или общественного деятеля, совершенное в целях прекращения его государственной или иной политической деятельности либо из мести за такую деятельность."],
            nakazanie: "→ 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "14.2",
            tip: "[Ф]",
            stro4ki: ["Действия, направленные на насильственный захват власти или насильственное удержание власти, а равно вооруженный мятеж, в нарушение Конституции штата Сан-Андреас, ",
            "а равно направленные на насильственное изменение конституционного строя штата Сан-Андреас."],
            nakazanie: "→ 12 лет лишения свободы в Федеральной тюрьме. По решению суда - пожизненное лишение свободы."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "14.3",
            tip: "[Ф]",
            stro4ki: ["Разглашение сведений, составляющих государственную тайну, лицом, которому она была доверена или стала известна по службе, работе, если эти сведения стали достоянием других лиц."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "14.4",
            tip: "[Ф]",
            stro4ki: ["Подрыв национальной безопасности, а равно попытка подрыва либо призыв к подрыву национальной безопасности путем: выведения государственных средств в офшоры, ",
            "спонсирования террористов или группу лиц которая замешана в гос. перевороте, продажа документов имеющие гриф секретно, уничтожение Государственных документов которые имеют важность или подделка этих документов."],
            nakazanie: "→ 12 лет лишения свободы в Федеральной тюрьме. По решению суда - пожизненное лишение свободы."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "14.5",
            tip: "[Ф]",
            stro4ki: ["Публичные призывы к осуществлению действий, направленных на нарушение территориальной целостности Штата, направленные против основ конституционного строя и безопасности Штата ."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме. По решению суда - пожизненное лишение свободы."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "14.6",
            tip: "[Ф]",
            stro4ki: ["Государственная измена, то есть совершенные жителями штата шпионаж, выдача иностранному государству, международной либо иностранной организации или их дипломатическим представительствам сведений,",
            " составляющих государственную тайну, доверенную лицу или ставшую известной ему по службе, работе, либо оказание финансовой, материально-технической, консультационной или иной помощи иностранному государству, ",
            "международной либо иностранной организации или их дипломатическим представительствам в деятельности, направленной против безопасности штата."],
            nakazanie: "→ 12 лет лишения свободы в Федеральной Тюрьме. По решению суда - пожизненное лишение свободы."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 15. Преступления против власти."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "15.1",
            tip: "[Ф/Д]",
            stro4ki: ["Превышение должностных полномочий, то есть совершение должностным лицом действий, явно выходящих за пределы его полномочий и повлекших существенное нарушение прав и законных интересов граждан ",
            "или организаций, либо охраняемых законом интересов общества или государства."],
            nakazanie: "→ 6 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.1.1",
            tip: "[Ф/Д]",
            stro4ki: ["Злоупотребление должностными полномочиями, то есть использование должностным лицом своих полномочий вопреки интересам службы, если это деяние повлекло существенное нарушение прав и законных интересов",
            " граждан или организаций, либо охраняемых законом интересов общества или государства."],
            nakazanie: "→ 4 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.2",
            tip: "[Ф/Д]",
            stro4ki: ["Умышленное неисполнение сотрудником органов правопорядка приказа начальника, отданного в установленном порядке и не противоречащего закону, причинившее существенный вред правам и законным интересам ",
            "граждан или организаций."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "15.3",
            tip: "[А]",
            stro4ki: ["Самовольное присвоение гражданином полномочий должностного лица."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.4",
            tip: "[Ф]",
            stro4ki: ["Получение взятки, то есть получение должностным лицом, лично или через посредника взятки в виде денег, иного имущества, либо в виде оказания ему услуг имущественного характера,",
            " предоставления иных имущественных прав за совершение действий (бездействие) в пользу взяткодателя или представляемых им лиц."],
            nakazanie: "→ 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.5",
            tip: "[Р]",
            stro4ki: ["Дача/попытка дачи взятки должностному лицу, лично или через посредника."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.6",
            tip: "[Ф/Д]",
            stro4ki: ["Халатность, то есть неисполнение или ненадлежащее исполнение должностным лицом своих обязанностей вследствие недобросовестного или небрежного отношения к службе либо обязанностей по должности,",
            " если это повлекло причинение физического вреда или существенное нарушение прав и законных интересов граждан или организаций либо охраняемых законом интересов общества или государства."],
            nakazanie: "→ От 3 до 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.7",
            tip: "[Р/Ф]",
            stro4ki: ["Дискредитация Правительства, равно как подрыв доверия общественности против действующего Правительства."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной Тюрьме."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 16. Преступления против правосудия."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "16.1",
            tip: "[Ф]",
            stro4ki: ["Вмешательство в какой бы то ни было форме в деятельность суда, в целях воспрепятствования осуществлению правосудия."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.1.1",
            tip: "[Р/Ф]",
            stro4ki: ["Воспрепятствование законной деятельности адвоката, в том числе по защите доверителя."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.1.2",
            tip: "[Ф]",
            stro4ki: ["Воспрепятствование законной профессиональной деятельности прокурора или иного лица, производящего следствие, по уголовному преследованию в рамках делопроизводства."],
            nakazanie: "→ 4 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.2",
            tip: "[Ф]",
            stro4ki: ["Угроза, а равно посягательство на жизнь судьи, или иного лица, участвующего в отправлении правосудия, прокурора, защитника, эксперта, специалиста, судебного пристава, судебного исполнителя,",
            " а равно их близких в связи с рассмотрением дел в суде, производством расследования либо исполнением приговора, решения суда или иного судебного акта, ",
            "совершенное в целях воспрепятствования законной деятельности указанных лиц, либо из мести за такую деятельность."],
            nakazanie: "→ 4 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "16.3",
            tip: "[А]",
            stro4ki: ["Неуважение к суду, выразившееся в оскорблении участников судебного разбирательства или неуважении суда."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.4",
            tip: "[Ф]",
            stro4ki: ["Привлечение заведомо невиновного к уголовной или административной ответственности или незаконное возбуждение уголовного дела."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.5",
            tip: "[Ф]",
            stro4ki: ["Заведомо незаконное заключение под стражу или содержание под стражей."],
            nakazanie: "→ 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.6",
            tip: "[Ф]",
            stro4ki: ["Фальсификация доказательств по гражданскому, административному делу лицом, участвующим в деле, или его представителем."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.7",
            tip: "[Ф]",
            stro4ki: ["Фальсификация доказательств по уголовному делу лицом, производящим расследование, прокурором или защитником."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.8",
            tip: "[Ф]",
            stro4ki: ["Вынесение судьей (судьями) заведомо неправомерного приговора, решения или иного судебного акта."],
            nakazanie: "→ От 5 до 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "16.9",
            tip: "[А]",
            stro4ki: ["Заведомо ложный донос о совершении преступления."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.10",
            tip: "[Ф]",
            stro4ki: ["Заведомо ложные показания свидетеля, потерпевшего либо заключение или показание эксперта, показание специалиста в суде."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.11",
            tip: "[Ф]",
            stro4ki: ["Подкуп свидетеля, потерпевшего в целях дачи ими ложных показаний либо эксперта, специалиста в целях дачи ими ложного заключения или ложных показаний."],
            nakazanie: "→ 4 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.12",
            tip: "[Ф]",
            stro4ki: ["Злостное неисполнение вступивших в законную силу приговора суда, решения суда или иного судебного акта, постановления прокурора или выданного ордера, а равно воспрепятствование их исполнению."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.13",
            tip: "[Ф]",
            stro4ki: ["Сокрытие улик или уничтожение улик."],
            nakazanie: "→ 7 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.14",
            tip: "[Ф]",
            stro4ki: [
            "Уклонение от расследования, задержания и суда, намеренные действия, которые направлены правонарушителем на уклонение от реального уголовного срока или другой уголовной ответственности.",
            "Таковыми являются попытка скрыться при задержании или публикации ордера на арест, неявка на вызов сотрудника Офиса Генерального Прокурора или сотрудника правоохранительных органов уполномоченного вести следствие ",
            "и задержание, а также по судебной повестке; смена фамилии и других идентификационных данных, изменение своего внешнего вида при помощи пластической хирургии."
            ],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.15",
            tip: "[Р/Ф]",
            stro4ki: ["Дача заведомо ложных показаний должностному лицу в ходе рассмотрения дела или проведения допроса."],
            nakazanie: "→ От 3 до 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "16.16",
            tip: "[А]",
            stro4ki: ["Вмешательство или воспрепятствование гражданским лицом, в какой бы то ни было форме, в процесс задержания, проведения ареста или в процесс разбирательства, ",
            "осуществляемого Государственным служащим силовой структуры Штата San- Andreas."],
            nakazanie: "→ До 20 суток ограничения свободы в КПЗ, либо штраф 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.17",
            tip: "[Р/Ф]",
            stro4ki: ["Вмешательство или воспрепятствование процессу задержания или непосредственно аресту, а также процессу разбирательства, лицом являющимся государственным служащим с использованием ",
            "своего служебного положения в государственной структуре. Исключения является вмешательство сотрудника Прокуратуры, на законном основании нарушений процесса задержания, ареста или разбирательств, ",
            "со стороны государственного служащего, проводящего задержание."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        glava_name := "Глава 17. Преступления против порядка управления."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "17.1",
            tip: "[Ф]",
            stro4ki: ["Посягательство на жизнь сотрудника правоохранительного органа, военнослужащего, а равно их близких в связи с исполнением им своих должностных обязанностей, либо из мести за такую деятельность."],
            nakazanie: "→ От 6 до 10 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "17.2",
            tip: "[Р]",
            stro4ki: ["Применение насилия, не опасного для жизни, но причинившее ущерб здоровью, либо угроза применения насилия в отношении представителя власти находящегося при исполнении."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "17.3",
            tip: "[А]",
            stro4ki: ["Оскорбление представителя власти при исполнении им своих должностных обязанностей или в связи с их исполнением. Оскорбление заключается в негативной оценке личности, либо внешности человека, ",
            "его качеств, поведения, причем в форме, противоречащей установленным правилам поведения и требованиям общечеловеческой морали, а также косвенное оскорбление представителей власти. ((Камень, клоун, мусор и т. п.))."],
            nakazanie: "→ 30 суток ограничения свободы в КПЗ, либо штраф от 3 000$ до 5 000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "17.4",
            tip: "[А]",
            stro4ki: ["Воспрепятствование профессиональной деятельности государственного служащего или провокация в отношении них выраженные в любой форме, при исполнении ими своих обязанностей, ",
            "а равно воспрепятствование работе. (см. комментарий к ст. 17.4)",
            "Провокацией гос. служащего при исполнении считается:",
            "Отвлечение сотрудника в момент проведение процессуальных действий от таковых для развлечения или иных преследуемых целей, преграждение пути сотрудника и иных действий повлекших воспрепятствование работы гос. служащих.",
            ],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "17.5",
            tip: "[Р/Ф]",
            stro4ki: ["Использование не зарегистрированной лицензии и/или подделка удостоверения, опознавательного знака (жетон, бейджик, нашивка) или иного официального документа, предоставляющего права ",
            "или освобождающего от обязанностей, в целях его использования либо сбыт такого документа и/или лицензии."],
            nakazanie: "→ От 3 до 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "17.6",
            tip: "[А]",
            stro4ki: ["Неповиновение законному требованию/распоряжению правомочного, либо намеренный уход/побег от такого лица (прокурор, сотрудник правоохранительных органов, сотрудник USSS, сотрудник SASPA,",
            " военнослужащий находящийся на посту, во время специальных операций и т.д.)."],
            nakazanie: "→ До 40 суток лишения свободы, либо штраф в размере до 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "17.7",
            tip: "[А]",
            stro4ki: [
            "Отказ от оплаты штрафа, который был выписан и передан нарушителю правомочным лицом.",
            "Примечание: Отказ от уплаты штрафа будет считаться в случае, если он не был оплачен в течении 2-х минут."
            ],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "17.8",
            tip: "[А]",
            stro4ki: ["Невыполнение в рамках надзора или делопроизводства в установленный срок законного постановления (предписания, предостережения, распоряжения и иного правового акта) сотрудника Правительства."],
            nakazanie: "→ Штраф от 20 000$ до 100 000$ в казну Правительства."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "17.9",
            tip: "[Р/Ф]",
            stro4ki: [
            "Cовершение лицом нескольких действий, содержащего составы административных правонарушений, ответственность за которые предусмотрена двумя и более статьями Административного кодекса.",
            "Примечание: При аресте необходимо указать номер данной статьи, а также номера статей Административной части. Пример: 17.9 [17.3, 17.4, 17.7]"
            ],
            nakazanie: "→ От 5 до 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        razdel_name := "Раздел VII. Преступления против военной службы"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 18. Преступления против военной службы."

        glava := {name: glava_name, zakony: []}

        zakon := {
            chast: "🟡",
            nomer: "18.1",
            tip: "[В]",
            stro4ki: ["Неисполнение подчиненным приказа начальника, отданного в установленном порядке, причинившее существенный вред интересам службы."],
            nakazanie: "→ 4 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "18.2",
            tip: "[Р/В]",
            stro4ki: ["Самовольное оставление части или места службы, а равно неявка в срок без уважительных причин на службу при увольнении из части."],
            nakazanie: "→ От 3 до 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "18.3",
            tip: "[Р/В]",
            stro4ki: ["Дезертирство, то есть самовольное оставление части или места службы в целях уклонения от прохождения военной службы, а равно неявка в тех же целях на службу."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "18.4",
            tip: "[В]",
            stro4ki: ["Нарушение правил несения боевого дежурства (боевой службы) по своевременному обнаружению и отражению внезапного нападения на охраняемый объект либо по обеспечению его безопасности."],
            nakazanie: "→ 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "18.5",
            tip: "[В]",
            stro4ki: ["Умышленные уничтожение или повреждение оружия, боеприпасов или предметов военной техники."],
            nakazanie: "→ 3 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "18.6",
            tip: "[В]",
            stro4ki: ["Уничтожение или повреждение по неосторожности оружия, боеприпасов или предметов военной техники, повлекшие тяжкие последствия."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "18.7",
            tip: "[Р/В]",
            stro4ki: ["Нарушение правил вождения или эксплуатации боевой, специальной или транспортной машины, повлекшее по неосторожности причинение тяжкого вреда здоровью человека."],
            nakazanie: "→ От 3 до 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "18.8",
            tip: "[Ф/В]",
            stro4ki: ["Нарушение правил полетов или подготовки к ним либо иных правил эксплуатации летательных аппаратов, повлекшее по неосторожности тяжкие последствия."],
            nakazanie: "→ 6 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        razdel.glavy.Push(glava)

        akt.razdely.Push(razdel)

        return akt
    }

