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
currentGUIAktion := "DESTROY"
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
        } else {
            currentGUI.Hide()
        }

        currentGUI := build_law_search_gui()
        currentGUIAktion := "DESTROY"
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

!5::
    {
        ;       y896
        ; x2           x267
        ;       y1063

        xPos := 2
        yPos := 896
        nPositions := []
        while (xPos <= 267) {
            c := PixelGetColor(xPos, yPos)
            if (c == "0x000000") {
                nPositions.push({x:xPos, y:yPos})
            }
            xPos := xPos + 5
        }
        xPos := xPos - 5
        while (yPos <= 1063) {
            c := PixelGetColor(xPos, yPos)
            if (c == "0x000000") {
                nPositions.push({x:xPos, y:yPos})
            }
            yPos := yPos + 5
        }
        yPos := yPos - 5
        while (xPos >= 2) {
            c := PixelGetColor(xPos, yPos)
            if (c == "0x000000") {
                nPositions.push({x:xPos, y:yPos})
            }
            xPos := xPos - 5
        }
        xPos := xPos + 5
        while (yPos >= 896) {
            c := PixelGetColor(xPos, yPos)
            if (c == "0x000000") {
                nPositions.push({x:xPos, y:yPos})
            }
            yPos := yPos - 5
        }
        yPos := yPos + 5

        global testGUI
        testGUI.Destroy()

        testGUI := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
        testGUI.BackColor := "black"

        yOffset := 0
        cc := 0
        xPosAv := 0
        yPosAv := 0
        for nPosition in nPositions {
            yOffset := yOffset + add_text_to_gui(testGUI, 15, 10 + yOffset, [{text:"x" . nPosition.x . " y" . nPosition.y}])

            cc := cc + 1
            xPosAv := xPosAv + nPosition.x
            yPosAv := yPosAv + nPosition.y
        }
        xPosAv := Round(xPosAv/cc)
        yPosAv := Round(yPosAv/cc)
        add_text_to_gui(testGUI, 15, 10 + yOffset + 15, [{text:"x" . xPosAv . " y" . yPosAv}])

        CoordMode("Mouse", "Screen")
        MouseGetPos(&mouseXposScreen, &mouseYposScreen)

        WinSetTransparent(180, testGUI)
        testGUI.Show("x" . mouseXposScreen . " y" . mouseYposScreen . " NoActivate")

        SendMode("Play")
        MouseMove(10, 0, 50, "R")
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

!R::
    {
        Reload
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
        } else {
            currentGUI.Hide()
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

        add_text_to_gui(myGui, 350, 1000, [
            {text:"Вы имеете право хранить молчание. Всё, что вы скажете, может быть исп. против Вас."},
            {text:"Вы имеете право на один телефонный звонок. Также вы имеете право на адвоката."},
            {text:"Если вам необходим адвокат, он будет для Вас запрошен. Вам ясны ваши права?"},
        ])

        coordY := 5
        offsetY := add_text_to_gui(myGui, 1000, coordY, [
            {text:"(Статья 10) Основания на задержание", style: "U"},
            {text:"► лицо застиг. в момент сов. прест."},
            {text:"► на подозр. будут следы прест."},
            {text:"► фото или видео фиксация"},
            {text:"► ордер или указ"},
            {text:" подпис. Губ., Виц.Губ., ГП, ЗГП"},
            {text:" или реш. суда"},
            {text:"► 3 свидетеля"},
            {text:"► лицо в маске до уст. личн."},
            {text:""},
            {text:"Личн. обыск н месте", style: "U"},
            {text:"► сопротивление, неподчинение"},
            {text:"► попытка бегства;"},
            {text:"► насилие или угроза насилия долж. лицу"},
            {text:"► маску или был вооружен"},
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
            {text:"► гос.сотр. -> руков.+прок. (10мин ответ)"},
            {text:" если руков. не прибыло -> уведомить"},
            {text:"► Принять решение"},
            {text:" (если гос.сотр -> решение принимает прок.)"},
            {text:"► Посадить или опустить"},
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
            {text:"► USMS (при контр. за LSSD)"},
            {text:"► сотрудники оффиса ГП (при контр. за LSSD)"},
        ])

        coordY := coordY + offsetY + 10
        offsetY := add_text_to_gui(myGui, 1000, coordY, [
            {text:"Неприкос", style: "U"},
            {text:"► Губ., Виц.Губ. (+советники), Спик.Конгр., Конгресмены"},
            {text:"► Министры(+их замы), Гл.Колл.Адв., Мэры, Виц.Мэры"},
            {text:"► Судьи, Дир.Секр.Служ., Дир.Служ.Марш."},
            {text:"► ГП, ЗГП, Помощники ГП (во время исп.служ.об)"},])

        coordY := coordY + offsetY + 10
        offsetY := add_text_to_gui(myGui, 1000, coordY, [
            {text:"Коды", style: "U"},
            {text:"0 сотрудник ранен/убит"},
            {text:"1 стрельба"},
            {text:"2 помощь с мигалками"},
            {text:"3 эвакуация сотр./задерж."},
            {text:"4 всё хорошо"},])

        coordY := coordY + offsetY + 10
        offsetY := add_text_to_gui(myGui, 1000, coordY, [
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

        add_text_to_gui(myGui, 5, 5, [{text:"TEST 2", height:100, color: "cBlue"}])

        WinSetTransparent(180, myGui)
        return myGui
    }

    build_law_search_gui() {
        yk := get_YK()

        inputObj := InputBox("Введите слово или номер статьи для поиска по УК и АК", "Поиск по УК и АК", "W360 H90")

        if (inputObj.Result != "OK" or inputObj.Value == "" or inputObj.Value == " ") {
            return Gui()
        }

        foundZakony := {yk: [], ak: []}

        for razdel in yk.razdely {
            for glava in razdel.glavy {
                for zakon in glava.zakony {
                    for stro4ka in zakon.stro4ki {
                        if (InStr(zakon.nomer, inputObj.Value, "Locale") or InStr(stro4ka, inputObj.Value, "Locale")) {
                            foundZakony.yk.push({razdel: razdel.name, glava: glava.name, zakon: zakon})
                            break
                        }
                    }
                }
            }
        }

        myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
        myGui.BackColor := "black"

        offsetY := 0
        if (foundZakony.yk.Length > 0) {
            newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:yk.name, height:10, color: "cWhite", style: "U"}])
            offsetY := offsetY + newOffset
            for foundZakon in foundZakony.yk {
                newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.razdel, height:10, color: "cBlue"}])
                offsetY := offsetY + newOffset

                newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.glava, height:10, color: "cAqua"}])
                offsetY := offsetY + newOffset

                newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.zakon.nomer, height:10, color: "cLime"}])

                if (foundZakon.zakon.HasOwnProp("prioritet_rozyska")) {
                    add_text_to_gui(myGui, 5, offsetY + newOffset, [{text:"Пр.Роз.: " . foundZakon.zakon.prioritet_rozyska, height:10}])
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

    get_YK() {
        ;^(\d+(\.\d+)+( \*+ )?(\(.(/.)*\))?) (.*)$
        ;zakon := {\n    nomer: "$1",\n    stro4ki: ["$6"]\n}

        akt_name := "УГОЛОВНО-АДМИНИСТРАТИВНЫЙ КОДЕКС ШТАТА САН-АНДРЕАС"

        akt := {name: akt_name, razdely: []}

        razdel_name := "Раздел I. Преступление и административное правонарушение"

        razdel := {name: razdel_name, glavy: []}

        glava_name := "Глава 1. Понятие преступления, покушение на преступление и административное правонарушение."

        glava := {name: glava_name, zakony: []}

        zakon := {
            nomer: "1.1",
            stro4ki: ["Преступлением признается виновно совершенное общественно опасное деяние (противоправное, осознанное, волевое, действие или бездействие, нарушающее или создавшее реальную угрозу нарушения общественных отношений, охраняемых Уголовным законодательством), запрещенное настоящим Кодексом под угрозой наказания."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.2",
            stro4ki: ["Не является преступлением действие (бездействие), хотя формально и содержащее признаки преступления, но в силу малозначительности не представляющее общественной опасности."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.3",
            stro4ki: ["Совокупностью преступлений признается совершение двух или более преступлений. При совокупности преступлений лицо несет уголовную ответственность за каждое совершенное преступление по соответствующей статье или части статьи настоящего Кодекса."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "1.4",
            stro4ki: ["Покушением на преступление признаются умышленные действия (бездействие) лица, непосредственно направленные на совершение преступления, если при этом преступление не было доведено до конца по независящим от этого лица обстоятельствам."]
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
            "В зависимости от характера и степени общественной опасности деяния, предусмотренные настоящим Кодексом, подразделяются на преступления небольшой тяжести, преступления средней тяжести, тяжкие преступления и особо тяжкие преступления.",
            "К преступлениям небольшой тяжести относятся преступления, предусмотренные статьями 6.2, 7.4, 13.2, 16.6, 17.2, 17.5, 17.9, 18.1, 18.2 настоящего кодекса.",
            "К преступлениям средней тяжести относятся преступления, предусмотренные: 6.5, 8.1, 8.2, 8.3, 9.3, 10.3, 10.6, 11.1, 11.3, 11.4, 11.10, 11.11,11.12, 12.7.2, 15.1, 15.1.1, 15.2, 15.4, 15.5, 15.6, 16.1.1, 16.1.2, 16.7, 16.10, 16.11, 16.13, 16.15, 16.17, 18.4, 18.5, 18.7, 18.8 настоящего кодекса.",
            "К тяжким преступлениям относятся преступления, предусмотренные статьями настоящего кодекса: 6.3, 7.1, 10.4, 11.2, 11.6, 11.7, 12.8, 12.9, 12.10, 12.10.1, 13.2.1, 13.5, 14.1, 14.3, 14.5, 15.7, 16.1, 16.4, 16.5, 16.8, 16.12, 16.14, 17.1, 18.3, 18.6 настоящего кодекса.",
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
            stro4ki: ["Не является преступлением причинение вреда посягающему лицу в состоянии необходимой обороны, при защите личности и прав обороняющегося или других лиц, если это посягательство было сопряжено с насилием, опасным для жизни обороняющегося или другого лица, либо с непосредственной угрозой применения такого насилия."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.2",
            stro4ki: ["При причинении вреда в состоянии необходимой обороны не должны быть нарушены пределы необходимой обороны (умышленные действия, явно не соответствующие характеру и опасности посягательства)."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.3",
            stro4ki: ["Не является преступлением причинение вреда лицу, совершившему преступление, при его задержании для доставления органам власти, если иными средствами задержать такое лицо не представлялось возможным и при этом не было допущено превышения необходимых для этого мер (когда лицу без необходимости причиняется явно чрезмерный, не вызываемый обстановкой вред)."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.4",
            stro4ki: ["Не является преступлением причинение вреда в состоянии крайней необходимости, то есть для устранения опасности, непосредственно угрожающей личности и правам данного лица или иных лиц, если эта опасность не могла быть устранена иными средствами и при этом, не было допущено превышения пределов крайней необходимости, явно не соответствующего характеру и степени угрожавшей опасности и обстоятельствам."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.5",
            stro4ki: ["Не является преступлением причинение вреда при обоснованном риске для достижения общественно полезной цели, если указанная цель не могла быть достигнута не связанными с риском действиями (бездействием). Риск не признается обоснованным, если он заведомо был сопряжен с угрозой для жизни многих людей."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.6",
            stro4ki: ["Не является преступлением причинение вреда охраняемым интересам лицом, действующим во исполнение обязательных для него приказа или распоряжения. Уголовную ответственность за причинение такого вреда несет лицо, отдавшее незаконный приказ или распоряжение. (Лицо, совершившее преступление во исполнение заведомо незаконного приказа или распоряжения, несет уголовную ответственность на общих основаниях. Неисполнение заведомо незаконного приказа или распоряжения исключает уголовную ответственность)."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "3.6.1",
            stro4ki: ["При передаче задержанного от сотрудника одной государственной структуры к другой, обязательным условием является предоставление опознавательного жетона или удостоверения. Также ответственность за данного задержанного несет сотрудник, который передал преступника, а не государственный служащий, который совершил заключение под стражу."]
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
            "Оказание медицинской и иной помощи потерпевшему после совершения преступления, добровольное возмещение имущественного ущерба и морального вреда, причиненных в результате преступления, иные действия, направленные на заглаживание вреда, причиненного потерпевшему;",
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
            "Выход под залог возможно осуществить только из КПЗ LSPD/LSSD и СИЗО Федеральной тюрьмы в соответствии с положениями соответствующих статей настоящего Кодекса и Закона 'О деятельности Коллегии Адвокатов на территории штата Сан-Андреас'.",
            "Примечание: Если органом, проводившим расследование/арест, не был установлен запрет выхода под залог в соответствии с Процессуальным кодексом штата Сан-Андреас, лицу, отбывающему наказание, лишение свободы может быть заменено на залог, определяемый в соответствии с положениями соответствующих статей настоящего Кодекса и Закона 'О деятельности Коллегии Адвокатов на территории штата Сан-Андреас'."
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
            stro4ki: ["Лицо, впервые совершившее преступление и/или административное правонарушение, предусматривающее какой-либо вред, может быть освобождено от ответственности, если оно примирилось с потерпевшим и загладило причиненный потерпевшему вред."]
        }
        glava.zakony.push(zakon)

        zakon := {
            nomer: "5.2",
            stro4ki: [
            "Лицо, впервые совершившее преступление может быть освобождено Судом или сотрудниками Офиса Генерального Прокурора от уголовной ответственности с назначением штрафа.",
            "Примечание: Лицо не может быть освобождено от уголовной ответственности по статье 5.2 УАК в случае нарушения статей Главы 6: 6.3, 6.4; Главы 7: 7.1; Главы 8; Главы 10: 10.1, 10.2, 10.3, 10.4; Главы 12: 12.1, 12.2, 12.3, 12.5, 12.8; Главы 13: 13.1, 13.2, 13.2.1, 13.5; Главы 14; Главы 15: 15.1, 15.1.1, 15.4, 15.5; Главы 17: 17.1, 17.2, 17.5, 17.8."
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
            stro4ki: ["Лицо, добровольно сдавшее предметы, указанные в статьях 12.8, 12.9, 13.1, 13.2, 13.2.1 настоящего Кодекса, освобождается от уголовной ответственности по соответствующей статье. Не может признаваться добровольной сдачей предметов их изъятие при задержании лица, а также при производстве любых оперативных и/или следственных действий."]
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
            stro4ki: ["Тяжкое убийство, то есть убийство двух или более лиц, лица или его близких в связи с осуществлением данным лицом служебной деятельности; совершенное с особой жестокостью; совершенное общеопасным способом; совершенное группой лиц; из корыстных побуждений или по найму (( IC смерть персонажа ))."],
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
            stro4ki: ["Изнасилование, мужеложство, лесбиянство или иные действия сексуального характера, то есть половое сношение с применением насилия или с угрозой его применения к потерпевшей (потерпевшему) или к другим лицам либо с использованием беспомощного состояния потерпевшей (потерпевшему)."],
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
            stro4ki: ["Понуждение лица к половому сношению, мужеложству, лесбиянству или совершению иных действий сексуального характера путем шантажа, угрозы уничтожением, повреждением или изъятием имущества либо с использованием материальной или иной зависимости потерпевшего (потерпевшей)."],
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
            stro4ki: ["Незаконный сбор или распространение сведений о частной жизни лица, составляющих его личную или семейную тайну, без его согласия либо распространение этих сведений в публичном выступлении, публичном произведении или средствах массовой информации, в том числе с использованием своего служебного положения."],
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
            stro4ki: ["Браконьерство. Ловля рыбы или охотничья деятельность вне специально отведенных местах без соответствующей лицензии или вылов рыбы/добыча шкур в количестве превышающем установленные ответственными органами нормы"],
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
            stro4ki: ["Распространение журналистом рекламы или сведений об организации или группе лиц, которая не зарегистрирована в установленном Законом о предпринимательской деятельности порядке, а равно в отсутствии у организации или группы лиц лицензии, либо в условиях аннулирования или приостановления лицензии на предпринимательскую деятельность у организации или группы лиц."],
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
            stro4ki: ["Терроризм, то есть совершение взрыва, поджога или иных действий, устрашающих население и создающих опасность гибели человека, причинения значительного имущественного ущерба либо наступления иных тяжких последствий, в целях дестабилизации деятельности органов власти или международных организаций либо воздействия на принятие ими решений, а также угроза совершения указанных действий в целях воздействия на принятие решений органами власти."],
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
            stro4ki: ["Захват или удержание лица в качестве заложника, совершенные в целях понуждения государства, организации или гражданина совершить какое-либо действие или воздержаться от совершения какого-либо действия как условия освобождения заложника."],
            nakazanie: "→ 10 лет лишения свободы."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "12.4",
            tip: "[А]",
            stro4ki: ["Заведомо ложное сообщение о готовящихся взрыве, поджоге или иных действиях, создающих опасность гибели людей, причинения значительного имущественного ущерба либо наступления иных общественно опасных последствий."],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.5",
            tip: "[Р/Ф]",
            stro4ki: ["Организация массовых беспорядков, а равно участие в них, сопровождавшихся насилием, погромами, поджогами, уничтожением имущества, применением оружия, взрывных устройств, взрывчатых, отравляющих либо иных веществ и предметов, представляющих опасность для окружающих, а также оказанием вооруженного сопротивления представителю власти, а равно подготовка лица для организации таких массовых беспорядков или участия в них."],
            nakazanie: "→ От 5 до 8 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "12.6",
            tip: "[А]",
            stro4ki: ["Хулиганство, то есть неоднократное нарушение общественного порядка, выражающее явное неуважение к обществу, нарушение правил поведения в учреждениях, организациях, а равно неоднократное и злостное мелкое хулиганство (см. комментарий к ст. 12.6)."],
            nakazanie: "→ До 40 суток ограничения свободы в КПЗ, либо штраф до 3.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.7",
            tip: "[А]",
            stro4ki: ["Незаконное проникновение (нахождение) на охраняемый в соответствии с законодательством Штата Сан-Андреас объект"],
            nakazanie: "→ До 40 суток лишения свободы, либо штраф в размере до 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "12.7.1",
            tip: "[А]",
            stro4ki: ["Незаконное проникновение (нахождение) на частную территорию, объект. (см. комментарий к ст. 12.7.1)"],
            nakazanie: "→ От 10 до 30 суток лишения свободы, либо штраф до 5000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.7.2",
            tip: "[Р/Ф]",
            stro4ki: ["Незаконное проникновение (нахождение) на особо охраняемый объект в соответствии с законодательством штата Сан-Андреас,"],
            nakazanie: "→ 5 лет лишения свободы в Федеральной Тюрьме"
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.8",
            tip: "[Р/Ф]",
            stro4ki: [
            "Незаконные приобретение, передача, сбыт, хранение, перевозка или ношение любых видов оружия/боеприпасов, спец. средств государственного образца, открытое ношение бронежилета гражданского образца на территории госучреждений, а также иное нарушение закона “о Регулировании оборота оружия боеприпасов и спецсредств в штате Сан-Андреас”.",
            "12.8.1 Лицо, добровольно сдавшее предметы, указанные в настоящей статье, освобождается от уголовной ответственности, если нет нарушений других статей настоящего кодекса."],
            nakazanie: "→ От 3 до 8 лет лишения свободы в Федеральной тюрьме и лишение лицензии на оружие."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "12.9",
            tip: "[Ф]",
            stro4ki: ["Незаконные приобретение, передача, сбыт, хранение, перевозка, изготовление или ношение взрывчатых веществ или взрывных устройств и предметов, поражающее действие которых основано на использовании горючих веществ."],
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
            stro4ki: ["Хищение, совершенное сотрудниками правоохранительных органов, огнестрельного оружия, комплектующих деталей к нему, боеприпасов, наркотических веществ и бронежилетов, спец.средств, изъятых в ходе служебной деятельности и (или) находящихся на складе улик (вещественных доказательств) или подлежащее уничтожению."],
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
            stro4ki: ["Создание преступного сообщества (преступной организации) в целях совершения одного или нескольких тяжких или особо тяжких преступлений либо руководство преступным сообществом (преступной организацией) или входящими в него (нее) структурными подразделениями, а равно координация действий организованных групп, создание устойчивых связей между ними, разработка планов и создание условий для совершения преступлений организованными группами, раздел сфер преступного влияния и (или) преступных доходов между такими группами."],
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
            stro4ki: ["Нахождение в неприемлемом виде в общественных местах (( Зеленых зонах )) и местах большого скопления людей свыше семи человек, а также на закрытых и охраняемых территориях. (см. комментарий к ст. 13.4)"],
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
            stro4ki: ["Действия, направленные на насильственный захват власти или насильственное удержание власти, а равно вооруженный мятеж, в нарушение Конституции штата Сан-Андреас, а равно направленные на насильственное изменение конституционного строя штата Сан-Андреас."],
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
            stro4ki: ["Подрыв национальной безопасности, а равно попытка подрыва либо призыв к подрыву национальной безопасности путем: выведения государственных средств в офшоры, спонсирования террористов или группу лиц которая замешана в гос. перевороте, продажа документов имеющие гриф секретно, уничтожение Государственных документов которые имеют важность или подделка этих документов."],
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
            stro4ki: ["Государственная измена, то есть совершенные жителями штата шпионаж, выдача иностранному государству, международной либо иностранной организации или их дипломатическим представительствам сведений, составляющих государственную тайну, доверенную лицу или ставшую известной ему по службе, работе, либо оказание финансовой, материально-технической, консультационной или иной помощи иностранному государству, международной либо иностранной организации или их дипломатическим представительствам в деятельности, направленной против безопасности штата."],
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
            stro4ki: ["Превышение должностных полномочий, то есть совершение должностным лицом действий, явно выходящих за пределы его полномочий и повлекших существенное нарушение прав и законных интересов граждан или организаций, либо охраняемых законом интересов общества или государства."],
            nakazanie: "→ 6 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.1.1",
            tip: "[Ф/Д]",
            stro4ki: ["Злоупотребление должностными полномочиями, то есть использование должностным лицом своих полномочий вопреки интересам службы, если это деяние повлекло существенное нарушение прав и законных интересов граждан или организаций, либо охраняемых законом интересов общества или государства."],
            nakazanie: "→ 4 года лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "15.2",
            tip: "[Ф/Д]",
            stro4ki: ["Умышленное неисполнение сотрудником органов правопорядка приказа начальника, отданного в установленном порядке и не противоречащего закону, причинившее существенный вред правам и законным интересам граждан или организаций."],
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
            stro4ki: ["Получение взятки, то есть получение должностным лицом, лично или через посредника взятки в виде денег, иного имущества, либо в виде оказания ему услуг имущественного характера, предоставления иных имущественных прав за совершение действий (бездействие) в пользу взяткодателя или представляемых им лиц."],
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
            stro4ki: ["Халатность, то есть неисполнение или ненадлежащее исполнение должностным лицом своих обязанностей вследствие недобросовестного или небрежного отношения к службе либо обязанностей по должности, если это повлекло причинение физического вреда или существенное нарушение прав и законных интересов граждан или организаций либо охраняемых законом интересов общества или государства."],
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
            stro4ki: ["Угроза, а равно посягательство на жизнь судьи, или иного лица, участвующего в отправлении правосудия, прокурора, защитника, эксперта, специалиста, судебного пристава, судебного исполнителя, а равно их близких в связи с рассмотрением дел в суде, производством расследования либо исполнением приговора, решения суда или иного судебного акта, совершенное в целях воспрепятствования законной деятельности указанных лиц, либо из мести за такую деятельность."],
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
            "Таковыми являются попытка скрыться при задержании или публикации ордера на арест, неявка на вызов сотрудника Офиса Генерального Прокурора или сотрудника правоохранительных органов уполномоченного вести следствие и задержание, а также по судебной повестке; смена фамилии и других идентификационных данных, изменение своего внешнего вида при помощи пластической хирургии."
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
            stro4ki: ["Вмешательство или воспрепятствование гражданским лицом, в какой бы то ни было форме, в процесс задержания, проведения ареста или в процесс разбирательства, осуществляемого Государственным служащим силовой структуры Штата San- Andreas."],
            nakazanie: "→ До 20 суток ограничения свободы в КПЗ, либо штраф 5.000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "16.17",
            tip: "[Р/Ф]",
            stro4ki: ["Вмешательство или воспрепятствование процессу задержания или непосредственно аресту, а также процессу разбирательства, лицом являющимся государственным служащим с использованием своего служебного положения в государственной структуре. Исключения является вмешательство сотрудника Прокуратуры, на законном основании нарушений процесса задержания, ареста или разбирательств, со стороны государственного служащего, проводящего задержание."],
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
            stro4ki: ["Оскорбление представителя власти при исполнении им своих должностных обязанностей или в связи с их исполнением. Оскорбление заключается в негативной оценке личности, либо внешности человека, его качеств, поведения, причем в форме, противоречащей установленным правилам поведения и требованиям общечеловеческой морали, а также косвенное оскорбление представителей власти. ((Камень, клоун, мусор и т. п.))."],
            nakazanie: "→ 30 суток ограничения свободы в КПЗ, либо штраф от 3 000$ до 5 000$."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟢",
            nomer: "17.4",
            tip: "[А]",
            stro4ki: ["Воспрепятствование профессиональной деятельности государственного служащего или провокация в отношении них выраженные в любой форме, при исполнении ими своих обязанностей, а равно воспрепятствование работе. (см. комментарий к ст. 17.4)"],
            nakazanie: "→ От 20 до 40 суток ограничения свободы в КПЗ."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "17.5",
            tip: "[Р/Ф]",
            stro4ki: ["Использование не зарегистрированной лицензии и/или подделка удостоверения, опознавательного знака (жетон, бейджик, нашивка) или иного официального документа, предоставляющего права или освобождающего от обязанностей, в целях его использования либо сбыт такого документа и/или лицензии."],
            nakazanie: "→ От 3 до 5 лет лишения свободы в Федеральной тюрьме."
        }
        glava.zakony.push(zakon)

        zakon := {
            chast: "🟡",
            nomer: "17.6",
            tip: "[А]",
            stro4ki: ["Неповиновение законному требованию/распоряжению правомочного, либо намеренный уход/побег от такого лица (прокурор, сотрудник правоохранительных органов, сотрудник USSS, сотрудник SASPA, военнослужащий находящийся на посту, во время специальных операций и т.д.)."],
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

