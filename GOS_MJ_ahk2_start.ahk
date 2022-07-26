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
currentGUIAktion := "DESTROY"
gui1 := build_gui_1()
gui2 := build_gui_2()

timerStatus := "CREATE"
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
    paste_message_in_chat_and_submit("/b", ">>>>  ZwergZ#3560  <<<<")
}

+F5::
{
    paste_message_in_chat_and_submit("/do", "На форме жетон:  [ LSSD | SPD | 2863 | D.S. ] .")
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
    paste_message_in_chat_and_submit("/b", ">>>>  останавливайся или я заливаю за PG  <<<<")
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

    add_text_to_gui(myGui, 5, 5, [{text:"TEST 1", height:100, color: "cBlue"}])

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
    ak := get_AK()

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

    for razdel in ak.razdely {
        for glava in razdel.glavy {
            for zakon in glava.zakony {
                for stro4ka in zakon.stro4ki {
                    if (InStr(zakon.nomer, inputObj.Value, "Locale") or InStr(stro4ka, inputObj.Value, "Locale")) {
                        foundZakony.ak.push({razdel: razdel.name, glava: glava.name, zakon: zakon})
                        break
                    }
                }
            }
        }
    }
    
    myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
    myGui.BackColor := "black"

    offsetY := 0
    if (foundZakony.ak.Length > 0) {
        newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:ak.name, height:10, color: "cWhite", style: "U"}])
        offsetY := offsetY + newOffset        
        for foundZakon in foundZakony.ak {
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
        offsetY := offsetY + 10
    }
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
    
    While (true) {
        if (timerStatus == "CREATE") {
            myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
            myGui.BackColor := "black"
            
            timerStatus := "DISABLED"
        }
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

    akt_name := "Уголовный кодекс (от 25.07.2022)"

    akt := {name: akt_name, razdely: []}

    razdel1_name := "Раздел 1."

    razdel1 := {name: razdel1_name, glavy: []}

    glava1_name := "Глава 1. Понятие преступления и покушение на преступление."

    glava1 := {name: glava1_name, zakony: []}

    zakon := {
        nomer: "1.1",
        stro4ki: ["Преступлением признается виновно совершенное общественно опасное деяние (противоправное, осознанное, волевое, действие или бездействие, нарушающее или создавшее реальную угрозу нарушения общественных отношений, охраняемых Уголовным законодательством), запрещенное настоящим Кодексом под угрозой наказания."]
    }
    glava1.zakony.push(zakon)

    zakon := {
        nomer: "1.2",
        stro4ki: ["Не является преступлением действие (бездействие), хотя формально и содержащее признаки преступления, но в силу малозначительности не представляющее общественной опасности."]
    }
    glava1.zakony.push(zakon)

    zakon := {
        nomer: "1.3",
        stro4ki: ["Совокупностью преступлений признается совершение лицом двух или более преступлений, предусмотренных статьями настоящего Кодекса."]
    }
    glava1.zakony.push(zakon)

    zakon := {
        nomer: "1.3.1",
        stro4ki: ["По приговору суда лицо может быть привлечено к уголовной ответственности по совокупности преступлений за каждое совершенное преступление по соответствующей статье настоящего Кодекса."]
    }
    glava1.zakony.push(zakon)

    zakon := {
        nomer: "1.3.2",
        stro4ki: ["В случаях, не предусмотренных статьей 1.3.1 настоящего Кодекса, лицо несет наказание по той статье, которая имеет наибольший приоритет розыска."]
    }
    glava1.zakony.push(zakon)

    zakon := {
        nomer: "1.4",
        stro4ki: ["Покушением на преступление признаются умышленные действия (бездействие) лица, непосредственно направленные на совершение преступления, если при этом преступление не было доведено до конца по не зависящим от этого лица обстоятельствам. Уголовная ответственность за покушение наступает по статье настоящего Кодекса, предусматривающей ответственность за оконченное преступление, со ссылкой на настоящую статью, но не может превышать половины предельного наказания за оконченное преступление."]
    }
    glava1.zakony.push(zakon)

    razdel1.glavy.push(glava1)

    glava2_name := "Глава 2. Соучастие в преступлении."

    glava2 := {name: glava2_name, zakony: []}
    zakon := {
        nomer: "2.1",
        stro4ki: ["Соучастием в преступлении признается умышленное совместное участие двух или более лиц в совершении умышленного преступления."]
    }
    glava2.zakony.push(zakon)

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
    glava2.zakony.push(zakon)

    zakon := {
        nomer: "2.3",
        stro4ki: ["Соучастники преступления вне зависимости от вида соучастия несут ответственность в равном объёме."]
    }
    glava2.zakony.push(zakon)

    zakon := {
        nomer: "2.4",
        stro4ki: ["Преступление признается совершенным группой лиц, если в его совершении совместно участвовали два или более исполнителя."]
    }
    glava2.zakony.push(zakon)

    zakon := {
        nomer: "2.5",
        stro4ki: ["Совершение преступления группой лиц влечет более строгое наказание."]
    }
    glava2.zakony.push(zakon)

    razdel1.glavy.push(glava2)

    glava3_name := "Глава 3. Обстоятельства, исключающие преступность деяния."

    glava3 := {name: glava3_name, zakony: []}

    zakon := {
        nomer: "3.1",
        stro4ki: ["Не является преступлением причинение вреда посягающему лицу в состоянии необходимой обороны, при защите личности и прав обороняющегося или других лиц, если это посягательство было сопряжено с насилием, опасным для жизни обороняющегося или другого лица, либо с непосредственной угрозой применения такого насилия."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.2",
        stro4ki: ["При причинении вреда в состоянии необходимой обороны не должны быть нарушены пределы необходимой обороны (умышленные действия, явно не соответствующие характеру и опасности посягательства)."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.3",
        stro4ki: ["Не является преступлением причинение вреда лицу, совершившему преступление, при его задержании для доставления органам власти, если иными средствами задержать такое лицо не представлялось возможным и при этом не было допущено превышения необходимых для этого мер (когда лицу без необходимости причиняется явно чрезмерный, не вызываемый обстановкой вред)."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.4",
        stro4ki: ["Не является преступлением причинение вреда в состоянии крайней необходимости, то есть для устранения опасности, непосредственно угрожающей личности и правам данного лица или иных лиц, если эта опасность не могла быть устранена иными средствами и при этом не было допущено превышения пределов крайней необходимости (явно не соответствующего характеру и степени угрожавшей опасности и обстоятельствам)."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.5",
        stro4ki: ["Не является преступлением причинение вреда при обоснованном риске для достижения общественно полезной цели, если указанная цель не могла быть достигнута не связанными с риском действиями (бездействием). Риск не признается обоснованным, если он заведомо был сопряжен с угрозой для жизни многих людей."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.6",
        stro4ki: ["Не является преступлением причинение вреда охраняемым интересам лицом, действующим во исполнение обязательных для него приказа или распоряжения. Уголовную ответственность за причинение такого вреда несет лицо, отдавшее незаконные приказ или распоряжение. (Лицо, совершившее преступление во исполнение заведомо незаконных приказа или распоряжения, несет уголовную ответственность на общих основаниях. Неисполнение заведомо незаконных приказа или распоряжения исключает уголовную ответственность)."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.7",
        stro4ki: ["Не является преступлением деяние, совершенное неумышленно, то есть по неосторожности, кроме случаев, когда иное предусмотрено соответствующими статьями Особенной части настоящего Кодекса."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.7.1",
        stro4ki: ["Деяние признается умышленным, если лицо осознавало общественную опасность деяния и желало наступления опасных последствий или относилось к их наступлению безразлично."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.7.2",
        stro4ki: ["Деяние признается неумышленно, если лицо предвидело возможность наступления общественно опасных последствий деяния, но без достаточных к тому оснований самонадеянно рассчитывало на предотвращение этих последствий, а равно не предвидело возможности наступления общественно опасных последствий деяния, хотя при необходимой внимательности и предусмотрительности должно было и могло предвидеть эти последствия."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.8",
        stro4ki: ["Закон, устраняющий преступность деяния, который смягчает наказание и улучшает положения лица, совершившего преступление, имеет обратную силу, то есть распространяется на лиц, совершивших соответствующие деяния до вступления такого закона в силу."]
    }
    glava3.zakony.push(zakon)

    razdel1.glavy.push(glava3)

    akt.razdely.push(razdel1)

    razdel2_name := "Раздел 2. Назначение наказания и освобождение от уголовной ответственности и наказания."

    razdel2 := {name: razdel2_name, glavy: []}

    glava4_name := "Глава 4. Назначение наказания. Виды и цели наказания."

    glava4 := {name: glava4_name, zakony: []}

    zakon := {
        nomer: "4.1",
        stro4ki: ["Лицу, признанному виновным в совершении преступления, назначается справедливое наказание в пределах, предусмотренных соответствующей статьей Особенной части настоящего Кодекса, и с учетом положений Общей части настоящего Кодекса."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.2",
        stro4ki: ["При назначении наказания учитываются характер и степень общественной опасности преступления и личность виновного, в том числе обстоятельства, смягчающие и отягчающие наказание."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.3",
        stro4ki: ["Смягчающими обстоятельствами признаются:"]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.3.1",
        stro4ki: ["Совершение преступления в результате физического или психического принуждения либо в силу материальной, служебной или иной зависимости."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.3.2",
        stro4ki: ["Совершение преступления при нарушении условий правомерности необходимой обороны, задержания лица, совершившего преступление, крайней необходимости, обоснованного риска, исполнения приказа или распоряжения."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.3.3",
        stro4ki: ["Противоправность или аморальность поведения потерпевшего, явившегося поводом для преступления."]
    }
    glava4.zakony.push(zakon)
    ;явка с повинной, активное способствование раскрытию и расследованию преступления, изобличению и уголовному преследованию других соучастников преступления.

    zakon := {
        nomer: "4.3.4",
        stro4ki: ["Оказание медицинской и иной помощи потерпевшему после совершения преступления, добровольное возмещение имущественного ущерба и морального вреда, причиненных в результате преступления, иные действия, направленные на заглаживание вреда, причиненного потерпевшему."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.3.5",
        stro4ki: ["Иные обстоятельства."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4",
        stro4ki: ["Отягчающими обстоятельствами признаются:"]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.1",
        stro4ki: ["Совершение преступления в составе группы лиц."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.2",
        stro4ki: ["Совершение преступления по мотивам политической, идеологической, расовой, национальной или религиозной ненависти, или вражды либо по мотивам ненависти или вражды в отношении какой-либо социальной группы."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.3",
        stro4ki: ["Совершение преступления из мести за правомерные действия других лиц, а также с целью скрыть другое преступление или облегчить его совершение."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.4",
        stro4ki: ["Совершение преступления в отношении лица или его близких в связи с осуществлением данным лицом служебной деятельности или выполнением общественного долга."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.5",
        stro4ki: ["Совершение преступления с особой жестокостью, садизмом, издевательством, а также мучениями для потерпевшего."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.6",
        stro4ki: ["Совершение преступления с использованием доверия, оказанного виновному в силу его служебного положения или договора."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.7",
        stro4ki: ["Совершение преступления с использованием форменной одежды или документов представителя власти."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.4.8",
        stro4ki: ["Многократное умышленное совершение преступления, а равно рецидив."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.5",
        stro4ki: ["Наказание является мерой государственного принуждения, назначаемая по приговору суда и иным решениям, описанных настоящим Кодексом. Наказание применяется к лицу, признанному виновным в совершении преступления, и заключается в лишении или ограничении прав и свобод по соответствующим положениям статьей настоящего Кодекса."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.6",
        stro4ki: ["Назначение наказание осуществляется введением в законную силу соответствующего судебного решения."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.6.1",
        stro4ki: ["Время содержания лица под стражей до судебного разбирательства учитывается при вынесении приговора."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.6.2",
        stro4ki: ["Штрафы, предусмотренные статьями настоящего Кодекса, применяются исключительно в судебном порядке либо прокуратурой."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.7",
        stro4ki: [
            "В результате судебного процесса по уголовному делу могут быть назначены следующие виды наказаний:",
            "- Судебный штраф. (Сумма регулируется на усмотрение Суда)",
            "- Лишение права занимать определенные должности или заниматься определенной деятельностью",
            "- Лишение права занимать любую должность в государственной организации (Черный список)",
            "- Увольнение с государственной или военной службы, в том числе с лишением всех званий, наград и привилегий",
            "- Лишение свободы на определенный срок",
            "- Пожизненное лишение свободы",
            "- Компенсация и возмещение пострадавшему юридическому или физическому лицу. (Сумма регулируется на усмотрение Суда)",
            "- Конфискация имущества",
            "- Принудительное психиатрическое лечение",
            "- Исправительные работы"
        ]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.7.1",
        stro4ki: ["Мера наказания указанная в статьях, может регулироваться вердиктом Суда. Виды наказания указаны в статье 4.7 настоящего Кодекса."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.7.2",
        stro4ki: ["В результате расследования правоохранительными органами по уголовному делу может быть назначено только лишение свободы на определенный срок (КПЗ)."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.7.3",
        stro4ki: ["Если органом, проводившим расследование, не был установлен запрет выхода под залог в соответствии с Процессуальным кодексом Штата Сан-Андреас, лицу, отбывающему наказание, лишение свободы может быть заменено на залог, определяемый в соответствии с положениями соответствующих статей настоящего Кодекса."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.8",
        stro4ki: ["Наказание за совершение деяния, нарушающего любую из статей настоящего кодекса, не может превышать меры, которая предусмотрена нарушенной статьей."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.9",
        stro4ki: ["В случае совершения лицом особо тяжкого преступления, срок лишения свободы может превышать установленный настоящим Законом вплоть до пожизненного лишения свободы."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.9.1",
        stro4ki: ["В момент расследования правоохранительными органами или составление уголовного дела, лицо совершившее нарушение, может быть лишен свободы (КПЗ) до конца судебного или досудебного разбирательства."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.10",
        stro4ki: ["Виды преступлений бывают: (F) Федеральными, (R) Региональными."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.10.1",
        stro4ki: ["Федеральное преступление → к этому виду преступления относятся деяния с обозначением (F). Такие преступления обязаны разбирать представители федеральных структур."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.10.1.1",
        stro4ki: ["Если задержание такого преступника проводят органы правоохранительной власти, они обязаны довести задержание до пункта 2.1.7 включительно, согласно Главе 2, статье 2 'Порядок задержания' Процессуального Кодекса, после чего сообщить по рации департамента с запросом о передаче задержанного Федеральной структуре."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.10.1.2",
        stro4ki: ["В случае, если в течении 3-х минут ответа от Федеральной структуры не поступает, то сотрудник правоохранительных органов обязан продолжить процесс задержания с последующим помещением в камеру предварительного заключения (КПЗ)."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.10.1.3",
        stro4ki: ["Федеральная структура имеет право дистанционно отреагировать на запрос и одобрить процесс задержания без присутствия на его месте проведения."]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.10.2",
        stro4ki: ["Региональное преступление → к этому виду преступления относится деяния с обозначением (R). Такие преступления обязаны разбирать все уполномоченные правоохранительные органы."]
    }
    glava4.zakony.push(zakon)

    razdel2.glavy.push(glava4)

    glava5_name := "Глава 5. Освобождение от уголовной ответственности и наказания."

    glava5 := {name: glava5_name, zakony: []}

    zakon := {
        nomer: "5.1",
        stro4ki: ["Лицо, впервые совершившее преступление, предусмотренное статьями: предельный срок наказания за которое не превышает 4 лет лишения свободы,, может быть освобождено прокуратурой от уголовной ответственности, если оно примирилось с потерпевшим и загладило причиненный потерпевшему вред."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.2",
        stro4ki: [
            "Лицо, впервые совершившее преступление может быть освобождено решением суда или прокуратурой от уголовной ответственности с назначением штрафа, а также занесением в DataBase, с указанием освобождения от уголовной ответственности, если такое лицо нарушило не более одного пункта из уголовных статей.",
            "Примечание: такие статьи, как 6.2 УК, 6.3 УК, 6.4 УК, 12.1 УК, 12.12 УК, 12.13 УК, 14.1 УК, 14.2 УК, 16.2 УК, 16.17 УК, 17.1 УК являются особо тяжкими, освобождение по данным статьям невозможно."
        ]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.3",
        stro4ki: ["Лицо освобождается от уголовной ответственности, если со дня совершения преступления прошло 15 дней."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.3.1",
        stro4ki: ["В случае, если за данный период времени не были применены санкции по отношению к нарушителю."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.3.2",
        stro4ki: ["Сроки давности по уголовному преступлению приостанавливают свое течение на время проведения судебного разбирательства или следствия."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.4",
        stro4ki: ["К лицам, совершившим преступления, предусмотренными статьями 6.2, 6.3, 6.4, 6.5, 8.2, 12.1, 12.2, 12.3, 12.4, 12.5, 12.13, 15.1, 16.2, 17.1 настоящего Кодекса, сроки давности не применяются."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.5",
        stro4ki: ["Запреты к работе на государственной службе:"]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.5.1",
        stro4ki: ["Срок запрета исчисляется с момента отбытия наказания."]
    }
    glava5.zakony.push(zakon)

    ;Статьи помеченные ' * ' влекут за собой запрет на работу, службу в государственных учреждениях, организациях 7 дней.
    ;Статьи помеченные ' ** ' влекут за собой запрет на работу, службу в государственных учреждениях, организациях 21 день.
    ;Статьи помеченные ' *** ' влекут за собой пожизненный запрет на работу, службу в государственных учреждениях, организациях.

    zakon := {
        nomer: "5.6",
        stro4ki: ["Лицо, добровольно сдавшее предметы, указанные в статьях 12.8, 12.8.1, 13.1, 13.2, 14.4 настоящего Кодекса, освобождается от уголовной ответственности по соответствующей статье. Не может признаваться добровольной сдачей предметов их изъятие при задержании лица, а также при производстве любых оперативных и/или следственных действий."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.7",
        stro4ki: ["Найденные наркотические вещества в ходе обыска сотрудниками гос. структуры в количестве до 3 грамм (включительно), изымаются без привлечения к уголовной ответственности."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.7.1",
        stro4ki: ["В случае нахождения у гражданина более 3 грамм наркотических веществ, несёт за собой уголовную ответственность."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.7.2",
        stro4ki: ["В случае нахождения у гражданина более 3 грамм 'Семена Green', несёт за собой уголовную ответственность."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.7.2.1",
        stro4ki: ["Найденные вещества 'Семена Green' в ходе обыска сотрудниками гос. структуры в количество до 3 грамм (включительно), являются легальными и изымаются без привлечения к уголовной ответственности."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.7.2.2",
        stro4ki: ["Одно “Семя Green” приравнивается к 1-му грамму наркотических веществ."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.8",
        stro4ki: ["В случае нахождения у гражданина до двух “Кустов Green” (включительно), изымаются без привлечения к уголовной ответственности."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.8.1",
        stro4ki: ["Один 'Куст Green' приравнивается к 5-ти граммам наркотических веществ."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.9",
        stro4ki: ["Выход под залог осуществляют только лицензированные адвокаты. Содействие в выходе под залог имеют лица, которые были признаны членами коллегии адвокатов."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.10",
        stro4ki: ["Стоимость выхода под залог регламентирует настоящий Кодекс и определяется согласно приоритету розыска."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.10.1",
        stro4ki: ["Приоритет розыска 1 - стоимость выхода под залог составляет - 8.000$"]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.10.2",
        stro4ki: ["Приоритет розыска 2 - стоимость выхода под залог составляет - 10.000$"]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.10.3",
        stro4ki: ["Приоритет розыска 3 - стоимость выхода под залог составляет - 12.000$"]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.10.4",
        stro4ki: ["Приоритет розыска 4 - стоимость выхода под залог составляет - 15.000$"]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.10.5",
        stro4ki: ["Приоритет розыска 5 - стоимость выхода под залог составляет - 20.000$"]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.11",
        stro4ki: ["Члены коллегии адвокатов обязаны вести учёт поступлений денежных средств за выход под залог."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.11.1",
        stro4ki: [
            "Залог, выплаченный заключённым, рассматривается в отношении 80/20, где 80% является оплатой услуг адвоката, который выпустил под залог заключенного, а 20% - выдается сотруднику правоохранительных органов.",
            "Примечание: Выпустить под залог имеет право только тот сотрудник правоохранительных органов, который непосредственно заполнял Database с данными задержанного (приоритетно), либо в случае отсутствия данного сотрудника - сотрудник являвшийся субъектом задержания и чьи данные фигурируют в Database задержанного."
        ]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.11.2",
        stro4ki: ["Офицеру полиции запрещено назначать/повышать размер залога."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.11.3",
        stro4ki: ["Офицер который содействует адвокату, обязан указать свои служебные данные для оформления документации."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.12",
        stro4ki: ["Причины, по которым лицу отказывается в праве выхода под залог:"]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.12.1",
        stro4ki: ["Задержанный заключен по одной или нескольким статьям Уголовного кодекса San Andreas из приведенного перечня: 6.3 УК, 6.4 УК, 7.1 УК, 8.2 УК, 12.1 УК, 12.2 УК, 12.3 УК, 12.4 УК, 12.5 УК, 12.12 УК, 12.13 УК, 12.14 УК, 14.1 УК, 14.2 УК, 14.2.1 УК, 16.2 УК, 16.17 УК, 17.1 УК, 17.13 УК."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.12.2",
        stro4ki: ["Задержанный является рецидивистом. Рецидивом преступлений признается совершение умышленного преступления лицом, имеющим судимость за ранее совершенное умышленное преступление (информация по совершенным преступлениям должна подтверждаться предъявлением дел)."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.12.3",
        stro4ki: ["Заключенный не обладает оговоренной суммой для выхода под залог."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.12.4",
        stro4ki: ["Задержанный отказывается сотрудничать со следствием."]
    }
    glava5.zakony.push(zakon)

    zakon := {
        nomer: "5.12.5",
        stro4ki: ["Задержанный осужден более чем по трём статьям."]
    }
    glava5.zakony.push(zakon)

    razdel2.glavy.push(glava5)

    akt.razdely.push(razdel2)

    ;Основная часть
    razdel3_name := "Раздел 3. Преступления против личности."

    razdel3 := {name: razdel3_name, glavy: []}


    glava6_name := "Глава 6. Преступления против жизни и здоровья."

    glava6 := {name: glava6_name, zakony: []}

    zakon := {
        nomer: "6.1 * (R)",
        stro4ki: ["Умышленное нанесение телесных повреждений."],
        prioritet_rozyska: 2,
        nakazanie: "От 2 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.1.1 * (R)",
        stro4ki: ["Умышленное нанесение тяжких телесных повреждений."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет, выход под залог разрешён."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.2 ** (F/R)",
        stro4ki: ["Убийство, то есть умышленное причинение смерти другому человеку."],
        prioritet_rozyska: 4,
        nakazanie: "8 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.3 *** (F)",
        stro4ki: ["Тяжкое убийство, то есть убийство двух или более лиц, равно как убийство близких жертвы в связи с осуществлением данным лицом служебной деятельности."],
        prioritet_rozyska: 5,
        nakazanie: "От 10 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.4 *** (F)",
        stro4ki: ["Групповое убийство, равно как совершенное убийство группой лиц с особой жесткостью."],
        prioritet_rozyska: 5,
        nakazanie: "От 30 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.5 ** (R)",
        stro4ki: ["Причинение тяжкого вреда здоровью по неосторожности."],
        prioritet_rozyska: 2,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.6 ** (R)",
        stro4ki: ["Причинение смерти по неосторожности."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.7 ** (F/R)",
        stro4ki: ["Угроза расправой (прямая или косвенная) должностному (сотруднику гос. структур) лицу а равно их близким."],
        prioritet_rozyska: 3,
        nakazanie: "До 3 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.8 * (F/R)",
        stro4ki: ["Угрозы с целью запугать человека."],
        prioritet_rozyska: 2,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.9 ** (R)",
        stro4ki: [
            "Умышленное нанесение телесных повреждений животному.",
            "Примечание: Ловля рыбы не попадает под действия данной статьи и не несет за собой ответственности согласно статье 2.1.1 Закона О Защите прав животных."
        ],
        prioritet_rozyska: 2,
        nakazanie: "От 2 лет до 6 лет лишения свободы."
    }
    glava6.zakony.push(zakon)

    razdel3.glavy.push(glava6)

    glava7_name := "Глава 7. Преступления против свободы, чести и достоинства личности."

    glava7 := {name: glava7_name, zakony: []}

    zakon := {
        nomer: "7.1 *** (F)",
        stro4ki: ["Похищение человека."],
        prioritet_rozyska: 5,
        nakazanie: "От 40 лет лишения свободы."
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.2 * (R)",
        stro4ki: ["Клевета, содержащаяся в публичном выступлении, средствах массовой информации либо с использованием своего служебного положения."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.3 * (R)",
        stro4ki: ["Клевета, соединенная с обвинением лица в совершении преступления."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.4 * (R)",
        stro4ki: ["Нарушение против личности, деловой репутации и оскорбления сотрудниками представительства Средств Массовой информации, равно нарушение законодательства об журналистской деятельности."],
        prioritet_rozyska: 4,
        nakazanie: "До 4 лет лишения свободы, без права осуществлять журналистскую деятельность."
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.5 ** (R)",
        stro4ki: ["Действия, направленные на возбуждение ненависти либо вражды по отношению к человеку или группе лиц по признаку от их пола, расы, национальности, языка, религии, происхождения, имущественного и должностного положения, место жительства, убеждений, принадлежности к общественным объединениям или каким-либо социальным группам."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.6 *** (R)",
        stro4ki: ["Действия, направленные на возбуждение ненависти либо вражды по отношению к человеку или группе лиц по признаку от их пола, расы, национальности, языка, религии, происхождения, имущественного и должностного положения, место жительства, убеждений, принадлежности к общественным объединениям или каким-либо социальным группам, совершенные представителем власти."],
        prioritet_rozyska: 4,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava7.zakony.push(zakon)

    razdel3.glavy.push(glava7)

    glava8_name := "Глава 8. Преступления против половой неприкосновенности и половой свободы личности."

    glava8 := {name: glava8_name, zakony: []}

    zakon := {
        nomer: "8.1 ** (R)",
        stro4ki: ["Насильственные действия сексуального характера, то есть половое сношение с применением насилия или с угрозой его применения к потерпевшей (потерпевшему) или к другим лицам либо с использованием беспомощного состояния потерпевшей (потерпевшему)."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.2 *** (F)",
        stro4ki: ["Насильственные действия сексуального характера повлекшее по неосторожности причинение тяжкого вреда здоровью или смерть потерпевшего (потерпевшей)."],
        prioritet_rozyska: 5,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.3 ** (R)",
        stro4ki: ["Насильственное принуждение лица к половому сношению или совершению иных действий сексуального характера путем шантажа, угрозы уничтожением, повреждением или изъятием имущества либо с использованием материальной или иной зависимости потерпевшего (потерпевшей)."],
        prioritet_rozyska: 2,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava8.zakony.push(zakon)

    razdel3.glavy.push(glava8)

    glava9_name := "Глава 9. Преступления против конституционных прав и свобод человека и гражданина."

    glava9 := {name: glava9_name, zakony: []}

    zakon := {
        nomer: "9.1 ** (F)",
        stro4ki: ["Незаконное собирание или распространение сведений о частной жизни лица, составляющих его личную или семейную тайну, без его согласия либо распространение этих сведений в публичном выступлении, публичном произведении или средствах массовой информации, в том числе с использованием своего служебного положения."],
        prioritet_rozyska: 1,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava9.zakony.push(zakon)

    zakon := {
        nomer: "9.2 ** (R)",
        stro4ki: ["Незаконное проникновение в жилище и частную территорию, совершенное против воли владельца, в том числе с использованием своего служебного положения."],
        prioritet_rozyska: 2,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava9.zakony.push(zakon)

    zakon := {
        nomer: "9.3 * (F)",
        stro4ki: ["Воспрепятствование свободному осуществлению гражданином своих избирательных прав, в том числе соединенные с подкупом, обманом, принуждением, применением насилия либо с угрозой его применения."],
        prioritet_rozyska: 1,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava9.zakony.push(zakon)

    zakon := {
        nomer: "9.4 * (R)",
        stro4ki: ["Воспрепятствование законной профессиональной деятельности журналистов путем принуждения их к распространению либо к отказу от распространения информации."],
        prioritet_rozyska: 1,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava9.zakony.push(zakon)

    zakon := {
        nomer: "9.5 * (R)",
        stro4ki: ["Воспрепятствование законной профессиональной деятельности журналистов путем незаконного ограничения права поиска, получения, передачи, производства и распространения информации любым законным способом."],
        prioritet_rozyska: 1,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava9.zakony.push(zakon)

    zakon := {
        nomer: "9.6 ** (R)",
        stro4ki: ["Необоснованный отказ от предоставления медицинских услуг лицами, уполномоченными на осуществления таких действий, если это повлекло за собой причинение вреда больному. Необоснованный отказ от предоставления услуг правоохранительных органов."],
        prioritet_rozyska: 2,
        nakazanie: "До 5 лет лишения свободы."
    }
    glava9.zakony.push(zakon)

    razdel3.glavy.push(glava9)

    akt.razdely.push(razdel3)

    razdel4_name := "Раздел 4. Преступления в сфере экономики."

    razdel4 := {name: razdel4_name, glavy: []}

    glava10_name := "Глава 10. Преступления против собственности."

    glava10 := {name: glava10_name, zakony: []}

    zakon := {
        nomer: "10.1 * (R)",
        stro4ki: ["Кража, то есть тайное хищение чужого имущества, стоимостью свыше 3.000$."],
        prioritet_rozyska: 1,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.2 * (R)",
        stro4ki: ["Кража, то есть тайное хищение чужого имущества, стоимостью свыше 5.000$."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.3 *** (F/R)",
        stro4ki: ["Кража, то есть тайное хищение чужого имущества, стоимостью свыше 15.000$."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.4 ** (F/R)",
        stro4ki: ["Мошенничество, то есть хищение чужого имущества или приобретение права на чужое имущество путем обмана или злоупотребления доверием."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.5 *** (R)",
        stro4ki: ["Грабеж, то есть открытое хищение чужого имущества."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.6 *** (F/R)",
        stro4ki: ["Разбой, то есть нападение в целях хищения чужого имущества, совершенное с применением насилия, опасного для жизни или здоровья, либо с угрозой применения такого насилия."],
        prioritet_rozyska: 4,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.7 * (F/R)",
        stro4ki: ["Неправомерное завладение автомобилем или иным транспортным средством (угон)."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.7.1 ** (F/R)",
        stro4ki: ["Неправомерное завладение транспортом, принадлежащему государству или государственному ведомству."],
        prioritet_rozyska: 4,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.8 * (R)",
        stro4ki: ["Умышленные уничтожение или повреждение чужого имущества."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.8.1 * (R)",
        stro4ki: ["Умышленные уничтожение или повреждение государственного имущества."],
        prioritet_rozyska: 3,
        nakazanie: "до 5 лет. Выход под залог разрешён."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.9 ** (F)",
        stro4ki: ["Умышленные уничтожение или повреждение чужого имущества, совершенные из хулиганских побуждений, путем поджога, взрыва или иным общеопасным способом."],
        prioritet_rozyska: 4,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    zakon := {
        nomer: "10.10 * (R)",
        stro4ki: ["Вымогательство, то есть требование передачи чужого имущества или права на имущество под угрозой применения насилия либо уничтожения или повреждения чужого имущества."],
        prioritet_rozyska: 2,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava10.zakony.push(zakon)

    razdel4.glavy.push(glava10)

    glava11_name := "Глава 11. Преступления в сфере экономической деятельности."

    glava11 := {name: glava11_name, zakony: []}

    zakon := {
        nomer: "11.1 * (F/R)",
        stro4ki: ["Осуществление предпринимательской деятельности без регистрации."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.2 * (R)",
        stro4ki: ["Принуждение к совершению сделки или к отказу от ее совершения под угрозой применения насилия, уничтожения или повреждения чужого имущества."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.3 * (F/R)",
        stro4ki: ["Незаконная организация азартных игр (игорного бизнеса), равно как их проведение и (или) участие в деятельности такой организации."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.4 ** (F/R)",
        stro4ki: ["Уклонение от уплаты налогов - принудительное взыскание суммы долга в 2-х кратном размере."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.5 ** (F/R)",
        stro4ki: ["Сокрытие денежных средств либо имущества, за счет которых должно производиться взыскание налогов."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.6 ** (F/R)",
        stro4ki: ["Ограничение конкуренции путем заключения соглашения между субъектами-конкурентами, либо совершенное лицом с использованием своего служебного положения, если это деяние причинило крупный ущерб гражданам, организациям или государству либо повлекло извлечение дохода в крупном размере."],
        prioritet_rozyska: 4,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.7 ** (R)",
        stro4ki: ["Преднамеренное банкротство, то есть совершение управленческим составом юридического лица действий (бездействия), влекущих к потере платежеспособности юридического лица и невозможности производить расчеты по долгам."],
        prioritet_rozyska: 2,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.8 * (R)",
        stro4ki: ["Незаконные получение и разглашение сведений, составляющих коммерческую, налоговую или банковскую тайну."],
        prioritet_rozyska: 2,
        nakazanie: "До 3 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.9 ** (F/R)",
        stro4ki: ["Уклонение организации от уплаты штрафа - принудительное взыскание суммы штрафа в 2-х кратном размере."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.10 *** (F)",
        stro4ki: ["Нецелевое использование средств государственного бюджета."],
        prioritet_rozyska: 4,
        nakazanie: "До 7 лет лишения свободы с двукратной выплатой всех ненадлежаще растраченных средств."
    }
    glava11.zakony.push(zakon)

    zakon := {
        nomer: "11.11 *** (F)",
        stro4ki: ["Присвоение себе финансовых средств, принадлежащих государственной структуре или государственному учреждению."],
        prioritet_rozyska: 4,
        nakazanie: "До 7 лет лишения свободы с двукратной выплатой всех присвоенных средств."
    }
    glava11.zakony.push(zakon)

    razdel4.glavy.push(glava11)

    akt.razdely.push(razdel4)

    razdel5_name := "Раздел 5. Преступления против общественной безопасности и общественного порядка."

    razdel5 := {name: razdel5_name, glavy: []}

    glava12_name := "Глава 12. Преступления против общественной безопасности."

    glava12 := {name: glava12_name, zakony: []}

    zakon := {
        nomer: "12.1 *** (F)",
        stro4ki: ["Терроризм, то есть совершение взрыва, поджога или иных действий, устрашающих население и создающих опасность гибели человека, причинения значительного имущественного ущерба либо наступления иных тяжких последствий, в целях дестабилизации деятельности органов власти или международных организаций либо воздействия на принятие ими решений, а также угроза совершения указанных действий в целях воздействия на принятие решений органами власти."],
        prioritet_rozyska: 5,
        nakazanie: "До пожизненного лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.2 *** (F)",
        stro4ki: ["Склонение, вербовка или иное вовлечение лица в терроризм, а равно финансирование терроризма."],
        prioritet_rozyska: 5,
        nakazanie: "От 40 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.3 *** (F)",
        stro4ki: ["Захват или удержание лица в качестве заложника, совершенные в целях понуждения государства, организации или гражданина совершить какое-либо действие или воздержаться от совершения какого-либо действия как условия освобождения заложника."],
        prioritet_rozyska: 5,
        nakazanie: "От 40 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.4 ** (R)",
        stro4ki: ["Заведомо ложное сообщение о готовящихся взрыве, поджоге или иных действиях, создающих опасность гибели людей, причинения значительного имущественного ущерба либо наступления иных общественно опасных последствий."],
        prioritet_rozyska: 3,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.5 ** (F)",
        stro4ki: ["Организация массовых беспорядков, а равно участие в них, сопровождавшихся насилием, погромами, поджогами, уничтожением имущества, применением оружия, взрывных устройств, взрывчатых, отравляющих либо иных веществ и предметов, представляющих опасность для окружающих, а также оказанием вооруженного сопротивления представителю власти, а равно подготовка лица для организации таких массовых беспорядков или участия в них."],
        prioritet_rozyska: 5,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.6 * (R)",
        stro4ki: ["Хулиганство, то есть грубое нарушение общественного порядка, выражающее явное неуважение к обществу, равно как совершено с применением оружия или предметов, используемых в качестве оружия."],
        prioritet_rozyska: 2,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.7 * (F/R)",
        stro4ki: ["Незаконное проникновение на закрытый в соответствии с законодательством штата Сан-Андреас, объект."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.7.1 *** (F/R)",
        stro4ki: ["Незаконное проникновение на режимный объект, обладающий особым статусом (SANG/FIB)."],
        prioritet_rozyska: 5,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.8 ** (F/R)",
        stro4ki: ["Незаконное приобретение, передача, сбыт, хранение, перевозка, ношение или использование любых видов оружия и боеприпасов."],
        prioritet_rozyska: 4,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.8.1 ** (F/R)",
        stro4ki: ["Незаконное приобретение, передача, сбыт, хранение, перевозка, ношение или использование любых видов государственных спец. средств, дефибриллятора, шприца с эпинефрином, алкотестера."],
        prioritet_rozyska: 4,
        nakazanie: "До 3х лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.9 ** (F)",
        stro4ki: ["Незаконные приобретение, передача, сбыт, хранение, перевозка, изготовление или ношение взрывчатых веществ или взрывных устройств."],
        prioritet_rozyska: 4,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.10 ** (F)",
        stro4ki: ["Хищение огнестрельного оружия, комплектующих деталей к нему, спец средств, боеприпасов, взрывчатых веществ или взрывных устройств."],
        prioritet_rozyska: 4,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.10.1 *** (F)",
        stro4ki: ["Хищение, совершенное сотрудниками правоохранительных органов, огнестрельного оружия, комплектующих деталей к нему, спец.средств, боеприпасов, взрывчатых веществ или взрывных устройств, изъятых в ходе служебной деятельности и (или) находящихся на складе улик (вещественных доказательств) или подлежащее уничтожению."],
        prioritet_rozyska: 5,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.11 ** (R/F)",
        stro4ki: ["Организация несанкционированных митингов, призыв к участию в незаконной демонстрации, шествии или пикетировании, равно как призыв к нарушению общественного порядка."],
        prioritet_rozyska: 4,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.12 *** (F)",
        stro4ki: ["Организация геноцида, равно как попытка организации его."],
        prioritet_rozyska: 5,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.13 *** (F)",
        stro4ki: ["Cоздание устойчивой преступной организации, целью которой является совершение преступлений федерального масштаба, равно как участие в подобной организации."],
        prioritet_rozyska: 5,
        nakazanie: "До пожизненного лишения свободы."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.14 *** (F)",
        stro4ki: ["Подрыв национальной безопасности, а равно попытка подрыва либо призыв к подрыву национальной безопасности путем: выведения государственных средств в офшоры, спонсирования террористов или группу лиц которая замешана в гос. перевороте, продажа документы имеющие гриф 'Секретно'."],
        prioritet_rozyska: 5,
        nakazanie: "От 24 года лишения свободы в федеральной тюрьме."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.15 *** (F)",
        stro4ki: ["Публичные призывы к осуществлению действий, направленных на нарушение территориальной целостности Штата, направленные против основ конституционного строя и безопасности штата."],
        prioritet_rozyska: 4,
        nakazanie: "8 лет лишение свободы в федеральной тюрьме, либо пожизненное лишение свободы по решению суда."
    }
    glava12.zakony.push(zakon)

    zakon := {
        nomer: "12.16 ** (R)",
        stro4ki: ["Участие в несанкционированных митингах, незаконных демонстрациях, шествиях или пикетированиях, равно как нарушение общественного порядка."],
        prioritet_rozyska: 2,
        nakazanie: "До 2х лет лишения свободы."
    }
    glava12.zakony.push(zakon)

    razdel5.glavy.push(glava12)

    glava13_name := "Глава 13. Преступления против здоровья населения и общественной нравственности."

    glava13 := {name: glava13_name, zakony: []}

    zakon := {
        nomer: "13.1 * (F/R)",
        stro4ki: [
            "Незаконные хранение, приобретение, перевозка наркотических веществ в значительном размере (свыше 3 грамм).",
            "Исключение: Разрешено хранить до 13 грамм включительно, лицам у которых имеется специальная медицинская справка “№2022”"
        ],
        prioritet_rozyska: 1,
        nakazanie: "До 3 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    zakon := {
        nomer: "13.2 ** (F)",
        stro4ki: [
            "Незаконные хранение, приобретение, перевозка и наркотических средств в крупном размере (свыше 8 грамм).",
            "Исключение: Разрешено хранить до 13 грамм включительно, лицам у которых имеется специальная медицинская справка “№2022”"
        ],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    zakon := {
        nomer: "13.3 *** (F)",
        stro4ki: [
            "Незаконные хранение, приобретение, перевозка наркотических средств в особо крупном размере (свыше 20 грамм).",
            "Исключение: Разрешено хранить до 13 грамм включительно, лицам у которых имеется специальная медицинская справка “№2022”"
        ],
        prioritet_rozyska: 5,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    zakon := {
        nomer: "13.4 ** (F/R)",
        stro4ki: [
            "Незаконное кустарное производство наркотических веществ в любых размерах.",
            "Примечание: кустарным производством является удобрение, полив, сбор или рассада кустарников, в составе которых имеются каннабиноидные или иные наркотические вещества."
        ],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    zakon := {
        nomer: "13.5 *** (F)",
        stro4ki: ["Незаконный сбыт, пересылка и производство наркотических средств, совершенные в крупном размере (свыше 25 грамм)."],
        prioritet_rozyska: 4,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    zakon := {
        nomer: "13.6 *** (F)",
        stro4ki: ["Незаконный сбыт, пересылка и производство наркотических средств, совершенные в особо крупном размере (свыше 50 грамм)."],
        prioritet_rozyska: 5,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    zakon := {
        nomer: "13.7 ** (F/R)",
        stro4ki: [
            "Пропаганда наркотических средств, психотропных веществ или растений, содержащих наркотические вещества.",
            "Примечание: Наличие справки, разрешающей использовать медицинские препараты с каннабиноидами, не дает возможности использовать данные препараты в общественных местах.",
            "Примечание: пропагандой являются следующие деяния: употребление таковых веществ в общественных местах, призыв к употреблению таковых веществ, попытка продажи таковых веществ, озвучивание лозунгов или песен, несущих в себе призывы к употреблению таковых веществ."
        ],
        prioritet_rozyska: 1,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    zakon := {
        nomer: "13.8 *** (F)",
        stro4ki: [
            "Приобретение, хранение, перевозка, изготовление, сбор наркотических веществ сотрудниками гос. структур.",
            "Исключение: Сотрудники отделов DEA, CID, DB, и подотдела К-9 которые ведут надзор за оборотом наркотических средств в штате SA."
        ],
        prioritet_rozyska: 5,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava13.zakony.push(zakon)

    razdel5.glavy.push(glava13)

    akt.razdely.push(razdel5)

    razdel6_name := "Раздел 6. Преступления против государственной власти."

    razdel6 := {name: razdel6_name, glavy: []}

    glava14_name := "Глава 14. Преступления против основ конституционного строя и безопасности государства."

    glava14 := {name: glava14_name, zakony: []}

    zakon := {
        nomer: "14.1 *** (F)",
        stro4ki: ["Посягательство на жизнь государственного или общественного деятеля, совершенное в целях прекращения его государственной или иной политической деятельности либо из мести за такую деятельность."],
        prioritet_rozyska: 5,
        nakazanie: "От 35 лет лишения свободы."
    }
    glava14.zakony.push(zakon)

    zakon := {
        nomer: "14.2 *** (F)",
        stro4ki: ["Действия, направленные на насильственный захват власти или насильственное удержание власти, а равно вооруженный мятеж, в нарушение Конституции штата Сан-Андреас, а равно направленные на насильственное изменение конституционного и/или государственного строя штата Сан-Андреас."],
        prioritet_rozyska: 5,
        nakazanie: "До пожизненного лишения свободы."
    }
    glava14.zakony.push(zakon)

    zakon := {
        nomer: "14.2.1 *** (F)",
        stro4ki: ["Агитация к действиям или возглавление движения, направленного на насильственный захват или насильственное удержание власти, вооруженный мятеж. Направление на насильственные изменения конституционного строя штата Сан-Андреас."],
        prioritet_rozyska: 3,
        nakazanie: "5-7 лет лишения свободы. По решению суда - пожизненное лишение свободы. Выход под залог - запрещён."
    }
    glava14.zakony.push(zakon)

    zakon := {
        nomer: "14.3 *** (F)",
        stro4ki: ["Разглашение сведений, составляющих государственную тайну, лицом, которому она была доверена или стала известна по службе, работе, если эти сведения стали достоянием других лиц."],
        prioritet_rozyska: 5,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava14.zakony.push(zakon)

    zakon := {
        nomer: "14.4 ** (F/R)",
        stro4ki: ["Приобретение, использование или сбыт формы государственной структуры, спец средств, служебного оружия, а также жетонов, удостоверений и нашивок."],
        prioritet_rozyska: 2,
        nakazanie: "До 5 лет лишения свободы."
    }
    glava14.zakony.push(zakon)

    razdel6.glavy.push(glava14)

    glava15_name := "Глава 15. Преступления против власти."

    glava15 := {name: glava15_name, zakony: []}

    zakon := {
        nomer: "15.1 ** (F)",
        stro4ki: ["Превышение должностных полномочий, то есть совершение должностным лицом действий, явно выходящих за пределы его полномочий и повлекших существенное нарушение прав и законных интересов граждан или организаций."],
        prioritet_rozyska: 4,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.1.1 * (F)",
        stro4ki: ["Злоупотребление должностными полномочиями, то есть использование должностным лицом своих полномочий вопреки интересам службы, если это деяние повлекло существенное нарушение прав и законных интересов граждан или организаций."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.2 * (F)",
        stro4ki: ["Умышленное неисполнение сотрудником органов правопорядка приказа начальника, отданного в установленном порядке и не противоречащего закону, причинившее существенный вред правам и законным интересам граждан или организаций."],
        prioritet_rozyska: 2,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.3 * (F/R)",
        stro4ki: ["Самовольное присвоение гражданином полномочий должностного лица повлекшие существенное нарушение прав и законных интересов граждан или организаций."],
        prioritet_rozyska: 1,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.4 ** (F/R)",
        stro4ki: ["Получение взятки, то есть получение должностным лицом, лично или через посредника взятки в виде денег, иного имущества, либо в виде оказания ему услуг имущественного характера, предоставления иных имущественных прав за совершение действий (бездействие) в пользу взяткодателя или представляемых им лиц."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.5 * (F/R)",
        stro4ki: ["Дача взятки должностному лицу, лично или через посредника."],
        prioritet_rozyska: 2,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.6 *** (F/R)",
        stro4ki: [
            "Халатность, то есть неисполнение или ненадлежащее исполнение должностным лицом своих обязанностей вследствие недобросовестного или небрежного отношения к службе либо обязанностей по должности, если это деяние повлекло существенное нарушение прав и законных интересов граждан, организаций и государства.",
            "Примечание: Решение о мере наказания выносится прокурором или судом."
        ],
        prioritet_rozyska: 4,
        nakazanie: "От дисциплинарного взыскания до уголовной ответственности в виде заключения под стражу до 6 лет лишения свободы и лишения права занимать любую должность в государственной организации."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.7 ** (F/R)",
        stro4ki: ["Подкуп голосов избирателей, равно как незаконная агитация в период проведения выборов, а также во время проведения голосования на выборных участках."],
        prioritet_rozyska: 1,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    zakon := {
        nomer: "15.8 * (R)",
        stro4ki: ["Провокация, равно как помеха исполнению обязанностей гос. служащих, возложенных на них законодательством штата."],
        prioritet_rozyska: 2,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava15.zakony.push(zakon)

    razdel6.glavy.push(glava15)

    glava16_name := "Глава 16. Преступления против правосудия."

    glava16 := {name: glava16_name, zakony: []}

    zakon := {
        nomer: "16.1 ** (F)",
        stro4ki: ["Вмешательство в какой бы то ни было форме в деятельность суда, следствия, ограничение прав граждан в целях воспрепятствования осуществлению правосудия."],
        prioritet_rozyska: 5,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.1.1 * (F)",
        stro4ki: ["Воспрепятствование законной профессиональной деятельности адвоката по защите доверителя от уголовного преследования, в том числе неповиновение законному требованию адвоката."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.1.2 * (F)",
        stro4ki: ["Воспрепятствование законной профессиональной деятельности прокурора или иного лица, производящего следствие, по уголовному преследованию в рамках делопроизводства, в том числе неповиновение его законному требованию."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.2 *** (F)",
        stro4ki: ["Угроза, а равно посягательство на жизнь судьи, или иного лица, участвующего в отправлении правосудия, прокурора, защитника, эксперта, специалиста, судебного пристава, судебного исполнителя, а равно их близких в связи с рассмотрением дел в суде, производством расследования либо исполнением приговора, решения суда или иного судебного акта, совершенное в целях воспрепятствования законной деятельности указанных лиц либо из мести за такую деятельность."],
        prioritet_rozyska: 5,
        nakazanie: "От 10 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.3 ** (R)",
        stro4ki: ["Неуважение к суду, в том числе оскорбление участников судебного разбирательства."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.4 ** (F)",
        stro4ki: ["Привлечение заведомо невиновного к уголовной или административной ответственности."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.5 ** (F)",
        stro4ki: ["Заведомо незаконное задержание, заключение под стражу или содержание под стражей."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.6 * (F)",
        stro4ki: ["Фальсификация доказательств по гражданскому, административному делу лицом, участвующим в деле, или его представителем."],
        prioritet_rozyska: 2,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.7 *** (F)",
        stro4ki: ["Фальсификация доказательств по уголовному делу лицом, производящим расследование, прокурором или защитником."],
        prioritet_rozyska: 5,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.8 *** (F)",
        stro4ki: ["Вынесение судьей (судьями) заведомо неправомерного приговора, решения или иного судебного акта."],
        prioritet_rozyska: 5,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.9 * (F/R)",
        stro4ki: ["Заведомо ложный донос о совершении преступления."],
        prioritet_rozyska: 2,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.10 * (F)",
        stro4ki: ["Заведомо ложные показания свидетеля, потерпевшего либо заключение или показание эксперта, показание специалиста в суде."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.11 ** (F)",
        stro4ki: ["Подкуп свидетеля, потерпевшего в целях дачи ими ложных показаний либо эксперта, специалиста в целях дачи ими ложного заключения или ложных показаний."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.12 ** (F/R)",
        stro4ki: ["Злостное неисполнение вступивших в законную силу приговора суда, решения суда или иного судебного акта, постановления прокурора или выданного ордера, указа кабинета министров, а равно воспрепятствование их исполнению."],
        prioritet_rozyska: 4,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.13 ** (F)",
        stro4ki: ["Сокрытие улик или уничтожение улик."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.14 ** (F)",
        stro4ki: ["Уклонение от расследования, задержания и суда, намеренные действия, которые направлены правонарушителем на уклонение от реального уголовного срока или другой уголовной ответственности. Таковыми считаются: Попытка скрыть, равно как скрыться при публикации ордеров/постановлений, не явка на вызов сотрудника прокуратуры или сотрудника правоохранительных органов уполномоченного вести следствие и задержание, смена фамилии и других идентификационных данных, изменение своего внешнего вида при помощи пластической хирургии и т.д."],
        prioritet_rozyska: 3,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.15 ** (F/R)",
        stro4ki: ["Дача заведомо ложных показаний и сведений лицу, ведущему следствие и(или) адвокату в ходе рассмотрения дела или проведения допроса."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.16 ** (F)",
        stro4ki: ["Укрывательство преступлений, равно как сокрытие лица, так и всевозможных средств, которые могли бы поспособствовать следствию или суду."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.17 *** (F)",
        stro4ki: ["Побег из места лишения свободы, из-под ареста или из-под стражи, совершенный лицом, отбывающим наказание или находящимся в предварительном заключении."],
        prioritet_rozyska: 5,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    zakon := {
        nomer: "16.18 *** (F)",
        stro4ki: ["Неисполнение представителем власти вступивших в законную силу приговора, решения суда или иного нормативно-правового акта, равно как воспрепятствование их исполнению."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava16.zakony.push(zakon)

    razdel6.glavy.push(glava16)

    glava17_name := "Глава 17. Преступления против порядка управления."

    glava17 := {name: glava17_name, zakony: []}

    zakon := {
        nomer: "17.1 *** (F/R)",
        stro4ki: ["Посягательство на жизнь сотрудника правоохранительного органа, военнослужащего, а равно их близких в связи с исполнением им своих должностных обязанностей либо из мести за такую деятельность."],
        prioritet_rozyska: 5,
        nakazanie: "До 20 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.2 * (F/R)",
        stro4ki: ["Применение насилия, не опасного для жизни или здоровья, либо угроза применения насилия в отношении представителя власти или его близких в связи с исполнением им своих должностных обязанностей."],
        prioritet_rozyska: 3,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.3 * (R)",
        stro4ki: [
            "Публичное оскорбление представителя власти при исполнении им своих должностных обязанностей или в связи с их исполнением (Оскорбление заключается в негативной оценке личности либо внешности человека, его качеств, поведения, причём в форме, противоречащей установленным правилам поведения и требованиям общечеловеческой морали).",
            "Примечание: публичным признается оскорбление, совершенное в присутствии 5-ти и более лиц."
        ],
        prioritet_rozyska: 2,
        nakazanie: "До 3-х лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.3.1 * (F/R)",
        stro4ki: ["Оскорбление представителя власти при исполнении им своих должностных обязанностей, а также в связи с их исполнением."],
        prioritet_rozyska: 1,
        nakazanie: "От 1 до 2 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.4 ** (F)",
        stro4ki: ["Использование не зарегистрированной лицензии и(или) подделка удостоверения или иного официального документа, предоставляющего права или освобождающего от обязанностей, в целях его использования либо сбыт такого документа и(или) лицензии."],
        prioritet_rozyska: 3,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.5 ** (F/R)",
        stro4ki: [
            "Самоуправство, то есть самовольное, вопреки установленному законом или иным нормативным правовым актом порядку совершение каких-либо действий.",
            "Примечание: Решение о мере наказания выносится прокурором или судом."
        ],
        prioritet_rozyska: 2,
        nakazanie: "От дисциплинарного взыскания до уголовной ответственности в виде заключения под стражу до 6 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.6 ** (F/R)",
        stro4ki: ["Неподчинение законным требованиям сотрудника Федерального Бюро Расследований (FIB), полицейского департамента (LSPD, LSCSD), USMS и USSS, Национальной Гвардии (SANG), а так же прокуратуры, равно как злонамеренное игнорирование таких требований."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.7 * (R)",
        stro4ki: ["Отказ от оплаты штрафа выписанного правомочным лицом (указанном в статье 17.6 настоящего кодекса), а равно отказ от возмещения ущерба согласно законодательству."],
        prioritet_rozyska: 2,
        nakazanie: "До 3 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.8 ** (F/R)",
        stro4ki: ["Укрывательство преступника, орудий и средств совершения преступления, следов преступления или предметов, добытых преступлением."],
        prioritet_rozyska: 2,
        nakazanie: "До 3 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.9 * (R)",
        stro4ki: ["Грубое и неоднократное оскорбление человека без его согласия в присутствии представителя власти."],
        prioritet_rozyska: 1,
        nakazanie: "До 1 года лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.10 ** (F/R)",
        stro4ki: ["Незаконная помеха при задержании нарушителя, равно как содействие повлекшее за собой упущение задержанного/преследуемого/арестованного."],
        prioritet_rozyska: 2,
        nakazanie: "До 3 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.11 * (F/R)",
        stro4ki: ["Провокация сотрудников SANG, равно как помеха несения службы на прилегающей постовой территории."],
        prioritet_rozyska: 2,
        nakazanie: "До 5 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.12 ** (F/R)",
        stro4ki: ["При движение военной колонны запрещено создавать помехи движения колонны, встраиваться в колонну, оттягивать её движение."],
        prioritet_rozyska: 2,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    zakon := {
        nomer: "17.13 *** (F/R)",
        stro4ki: ["Побег при задержании, равно как уклонение от правосудия."],
        prioritet_rozyska: 4,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava17.zakony.push(zakon)

    razdel6.glavy.push(glava17)

    glava18_name := "Глава 18. Преступления против военной службы."

    glava18 := {name: glava18_name, zakony: []}

    zakon := {
        nomer: "18.1 ** (F)",
        stro4ki: ["Неисполнение подчиненным приказа начальника, отданного в установленном порядке, причинившее существенный вред интересам службы."],
        prioritet_rozyska: 3,
        nakazanie: "До 4 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    zakon := {
        nomer: "18.2 ** (F)",
        stro4ki: ["Самовольное оставление части или места службы, а равно неявка в срок без уважительных причин на службу при увольнении из части."],
        prioritet_rozyska: 2,
        nakazanie: "До 2 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    zakon := {
        nomer: "18.3 ** (F)",
        stro4ki: ["Дезертирство, то есть самовольное оставление части или места службы в целях уклонения от прохождения военной службы, а равно неявка в тех же целях на службу."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    zakon := {
        nomer: "18.4 * (F)",
        stro4ki: ["Нарушение правил несения боевого дежурства (боевой службы) по своевременному обнаружению и отражению внезапного нападения на охраняемый объект либо по обеспечению его безопасности."],
        prioritet_rozyska: 3,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    zakon := {
        nomer: "18.5 ** (F)",
        stro4ki: ["Умышленные уничтожение или повреждение оружия, боеприпасов или предметов военной техники."],
        prioritet_rozyska: 4,
        nakazanie: "До 10 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    zakon := {
        nomer: "18.6 ** (F)",
        stro4ki: ["Уничтожение или повреждение по неосторожности оружия, боеприпасов или предметов военной техники, повлекшие тяжкие последствия."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    zakon := {
        nomer: "18.7 ** (F)",
        stro4ki: ["Нарушение правил вождения или эксплуатации боевой, специальной или транспортной машины, повлекшее по неосторожности причинение тяжкого вреда здоровью человека."],
        prioritet_rozyska: 2,
        nakazanie: "До 6 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    zakon := {
        nomer: "18.8 * (F)",
        stro4ki: ["Нарушение правил полетов или подготовки к ним либо иных правил эксплуатации военных летательных аппаратов, повлекшее по неосторожности тяжкие последствия."],
        prioritet_rozyska: 3,
        nakazanie: "До 8 лет лишения свободы."
    }
    glava18.zakony.push(zakon)

    razdel6.glavy.push(glava18)

    akt.razdely.push(razdel6)

    return akt
}

get_AK() {
    ;^(\d+(\.\d+)+)(\.)? (.*)$
    ;zakon := {\n    nomer: "$1",\n    stro4ki: ["$4"]\n}
    akt_name := "АДМИНИСТРАТИВНЫЙ КОДЕКС (от 25.07.2022)"

    akt := {name: akt_name, razdely: []}

    razdel1_name := "РАЗДЕЛ I ОБЩАЯ ЧАСТЬ​"

    razdel1 := {name: razdel1_name, glavy: []}

    glava1_name := "Статья 1. Задачи и понятие административного законодательства."

    glava1 := {name: glava1_name, zakony: []}

    zakon := {
        nomer: "1.1",
        stro4ki: ["Административный кодекс — кодифицированный нормативный акт, регулирующий общественные отношения по привлечению к административной ответственности, а также устанавливающий общие начала, перечень всех административных правонарушений (который может быть дополнен на региональном уровне), органы, рассматривающие дела, порядок привлечения, к административной ответственности и порядок исполнения решений по административным делам."]
    }
    glava1.zakony.push(zakon)

    zakon := {
        nomer: "1.2",
        stro4ki: ["Задачами законодательства об административных правонарушениях являются защита личности, охрана прав и свобод человека и гражданина, охрана здоровья граждан, санитарно-эпидемиологического благополучия населения, защита общественной нравственности, охрана окружающей среды, установленного порядка осуществления государственной власти, общественного порядка и общественной безопасности, собственности, защита законных экономических интересов физических и юридических лиц, общества и государства от административных правонарушений, а также предупреждение административных правонарушений."]
    }
    glava1.zakony.push(zakon)

    razdel1.glavy.push(glava1)

    glava2_name := "Статья 2. Понятия административного правонарушения и подведомственность административных дел."

    glava2 := {name: glava2_name, zakony: []}

    zakon := {
        nomer: "2.1",
        stro4ki: ["Административные правонарушения отличаются от преступлений тем, что их совершение не наносит существенного вреда обществу, они не обладают признаком общественной опасности в том смысле, который вкладывается в это понятие уголовным законодательством. Некоторые деяния могут признаваться как правонарушением, так и преступлением в зависимости от степени причинённого вреда или других обстоятельств, такие случаи описаны в Уголовном кодексе с правом выбора меры наказания в зависимости от тяжести."]
    }
    glava2.zakony.push(zakon)

    zakon := {
        nomer: "2.2",
        stro4ki: ["Административным правонарушением признается противоправное действие (бездействие) физического или юридического лица, за которое настоящим Кодексом или законами штата об административных правонарушениях установлена административная ответственность."]
    }
    glava2.zakony.push(zakon)

    zakon := {
        nomer: "2.3",
        stro4ki: [
            "Подведомственность административных дел.",
            "Привлечение к административной ответственности осуществляется сотрудниками правоохранительных структур:",
            "LSPD - Округ Лос-Сантос;",
            "LSСSD - Округ Блэйн;",
            "USMS по решению суда, с привлечением сотрудников LSPD или LSSD",
            "Прокуратура, с привлечением сотрудников LSPD или LSSD",
            "Исключение: разрешение на нарушение юрисдикции подведомственными государственными организациями."
        ]
    }
    glava2.zakony.push(zakon)

    razdel1.glavy.push(glava2)

    glava3_name := "Статья 3. Форма вины и назначение наказания."

    glava3 := {name: glava3_name, zakony: []}

    zakon := {
        nomer: "3.1",
        stro4ki: [
            "Форма вины:",
            "Административное правонарушение признается совершенным умышленно, если лицо, его совершившее, осознавало противоправный характер своего действия (бездействия), предвидело его вредные последствия и желало наступления таких последствий или сознательно их допускало либо относилось к ним.",
            "Административное правонарушение признается совершенным по неосторожности, если лицо, его совершившее, предвидело возможность наступления вредных последствий своего действия (бездействия), но без достаточных к тому оснований самонадеянно рассчитывало на предотвращение таких последствий либо не предвидело возможности наступления таких последствий, хотя должно было и могло их предвидеть.",
            "Не является административным правонарушением причинение лицом вреда охраняемым законом интересам в состоянии крайней необходимости, то есть для устранения опасности, угрожающей личности и правам данного лица или других лиц, а также охраняемым законом интересам общества или государства."
        ]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.2",
        stro4ki: ["При малозначительности совершенного административного правонарушения уполномоченные лица могут освободить лицо, совершившее административное правонарушение, от административной ответственности и ограничиться устным замечанием, кроме, вынесенных сотрудниками прокуратуры или судебных решений."]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.3",
        stro4ki: [
            "Обстоятельствами, смягчающими административную ответственность признаются:",
            "Раскаяние лица, совершившего административное правонарушение;",
            "Добровольное прекращение противоправного поведения лицом, совершившим административное правонарушение;",
            "Добровольное сообщение лицом, совершившим административное правонарушение, в орган, уполномоченный осуществлять производство по делу об административном правонарушении, о совершенном административном правонарушении;",
            "Оказание лицом, совершившим административное правонарушение, содействия органу, уполномоченному осуществлять производство по делу об административном правонарушении;",
            "Предотвращение лицом, совершившим административное правонарушение, вредных последствий административного правонарушения;",
            "Добровольное возмещение лицом, совершившим административное правонарушение, причиненного ущерба или добровольное устранение причиненного вреда потерпевшему."
        ]
    }
    glava3.zakony.push(zakon)

    zakon := {
        nomer: "3.4",
        stro4ki: [
            "Обстоятельствами, отягчающими административную ответственность, признаются:",
            "Продолжение противоправного поведения, несмотря на требование уполномоченных на то лиц прекратить его;",
            "Повторное совершение однородного административного правонарушения, то есть совершение административного правонарушения в период, когда лицо считается подвергнутым административному наказанию;",
            "Совершение административного правонарушения группой лиц;",
            "Совершение административного правонарушения в условиях стихийного бедствия или при других чрезвычайных обстоятельствах;",
            "Совершение административного правонарушения в состоянии опьянения либо отказ от прохождения медицинского освидетельствования на состояние опьянения при наличии достаточных оснований полагать, что лицо, совершившее правонарушение, находится в состоянии опьянения.",
            "При совершении лицом двух и более административных правонарушений административное наказание назначается за каждое совершенное правонарушение."
        ]
    }
    glava3.zakony.push(zakon)

    razdel1.glavy.push(glava3)

    glava4_name := "Статья 4. Виды и срок давности административных правонарушений."

    glava4 := {name: glava4_name, zakony: []}

    zakon := {
        nomer: "4.1",
        stro4ki: [
            "Виды административных наказаний.",
            "Предупреждение – мера административного наказания, выраженная в официальном порицании физического или юридического лица. Предупреждение выносится в устной форме.",
            "Административный штраф – денежное взыскание в отношении лица, выраженное в определенной сумме.",
            "Отказ от уплаты штрафа или компенсаций пострадавшей стороне расцениваются как нарушение ст. 17.7 Уголовного кодекса Сан-Андреас.",
            "Исключение: Если у гражданина в данный момент нет средств - сотрудник накладывающий штраф должен предложить гражданину проехать к ближайшему отделению банка или банкомату для снятия необходимого кол-ва финансовых средств с последующей оплатой штрафа.",
            "Примечание: Если у гражданина недостаточное количество финансовых средств даже на личном счёте в банке - штраф может быть уменьшен сотрудником накладывающим его, вплоть до смягчения наказания до предупреждения.",
            "Конфискация орудия совершения или предмета административного правонарушения – принудительное безвозмездное обращение в собственность Штата, изъятых из оборота вещей."
        ]
    }
    glava4.zakony.push(zakon)

    zakon := {
        nomer: "4.2",
        stro4ki: ["Срок давности привлечения за административное правонарушение составляет 2 года (( 2 дня )). Срок давности может быть увеличен, если лицо намеренно скрывалось от ответственности или по решению Генерального прокурора."]
    }
    glava4.zakony.push(zakon)

    razdel1.glavy.push(glava4)

    akt.razdely.push(razdel1)

    razdel2_name := "РАЗДЕЛ II ОСНОВНАЯ ЧАСТЬ​"

    razdel2 := {name: razdel2_name, glavy: []}

    glava5_name := "Статья 5. Уклонение от административной ответственности"

    glava5 := {name: glava5_name, zakony: []}

    zakon := {
        nomer: "5.1",
        stro4ki: ["Уклонение от административной ответственности. Намеренные действия, которые направлены правонарушителем на уклонение от штрафа или другой административной ответственности."],
        nakazanie: "штраф $10.000"
    }
    glava5.zakony.push(zakon)

    razdel2.glavy.push(glava5)

    glava6_name := "Статья 6. Административные правонарушения, посягающие на порядок и безопасность."

    glava6 := {name: glava6_name, zakony: []}

    zakon := {
        nomer: "6.1",
        stro4ki: ["Умышленные уничтожение или повреждение государственного имущества, совершенные из хулиганских побуждений, путем поджога, взрыва или иным общеопасным способом."],
        nakazanie: "штраф до $6.000"
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.2",
        stro4ki: ["Нарушение установленного порядка организации либо проведения собрания, митинга, демонстрации, шествия или пикетирования."],
        nakazanie: "штраф до $10.000"
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.3",
        stro4ki: ["Заведомо ложный вызов специализированных служб."],
        nakazanie: "штраф до $5.000"
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.4",
        stro4ki: ["Введение в заблуждение, либо попытка обмана сотрудников государственных служб."],
        nakazanie: "штраф до $5.000"
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.5",
        stro4ki: ["Вмешательство или воспрепятствование гражданским лицом, в какой бы то ни было форме, в процесс задержания, проведения ареста или в процесс разбирательства, осуществляемого Государственным служащим силовой структуры Штата San-Andreas."],
        nakazanie: "штраф до 5.000$"
    }
    glava6.zakony.push(zakon)

    zakon := {
        nomer: "6.6",
        stro4ki: ["Вмешательство или воспрепятствование процессу задержания или непосредственно аресту а также процессу разбирательства, лицом являющимся государственным служащим с использованием своего служебного положения в государственной структуре. Исключения является вмешательство сотрудника Прокуратуры, Адвокатуры на законном основании нарушений процесса задержания, ареста или разбирательств, со стороны государственного служащего проводящего задержание."],
        nakazanie: "штраф до 8.000 $"
    }
    glava6.zakony.push(zakon)

    razdel2.glavy.push(glava6)

    glava7_name := "Статья 7. Административные правонарушения, посягающие на честь, права и имущество."

    glava7 := {name: glava7_name, zakony: []}

    zakon := {
        nomer: "7.1",
        stro4ki: ["Оскорбление, то есть унижение чести и достоинства другого лица, выраженное в неприличной форме."],
        nakazanie: "штраф до 5.000$"
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.2",
        stro4ki: ["Публичное оскорбление гражданина, совершенное единожды в устной или письменной форме."],
        nakazanie: "штраф до 5.000$"
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.3",
        stro4ki: ["Дискриминация, то есть нарушение прав, свобод и законных интересов человека и гражданина в зависимости от его пола, расы, цвета кожи, национальности, языка, происхождения, имущественного, семейного, социального и должностного положения, возраста, места жительства, отношения к религии, убеждений. Принадлежности или непринадлежности к общественным объединениям или каким-либо группам или меньшинствам."],
        nakazanie: "штраф до 5.000$"
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.4",
        stro4ki: ["Нарушение неприкосновенности частной жизни, телефонный терроризм, преследование у места жительства, работы и т.д."],
        nakazanie: "штраф до 3.000$"
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.5",
        stro4ki: ["Умышленное нанесение повреждений чужому имуществу, если данные действия не нанесли значительного ущерба или в зависимости от масштаба нанесенного ущерба."],
        nakazanie: "штраф до 3000$, а также возмещение ущерба потерпевшей стороне по решению суда, если имеется иск."
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.6",
        stro4ki: ["Клевета, соединенная с обвинением лица в совершении преступления."],
        nakazanie: "штраф до $8000, а также возмещение ущерба потерпевшей стороне по решению суда, если имеется иск."
    }
    glava7.zakony.push(zakon)

    zakon := {
        nomer: "7.7",
        stro4ki: ["Клевета, то есть распространение заведомо ложных сведений, порочащих честь и достоинство другого лица или подрывающих его репутацию."],
        nakazanie: "штраф до $8000, а также возмещение ущерба потерпевшей стороне по решению суда, если имеется иск."
    }
    glava7.zakony.push(zakon)

    razdel2.glavy.push(glava7)

    glava8_name := "Статья 8. Административные правонарушения в сфере здравоохранения."

    glava8 := {name: glava8_name, zakony: []}

    zakon := {
        nomer: "8.1",
        stro4ki: [
            "Неквалифицированная медицинская помощь.",
            "Пояснение: Предоставление неквалифицированной медицинской помощи, равно как оказание медицинских услуг без соответствующей лицензии на право их осуществления, не повлекшие за собой серьезного вреда здоровью."
        ],
        nakazanie: "Влечет административный штраф $10.000."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.2",
        stro4ki: [
            "Отсутствие медицинских справок.",
            "Пояснение: Отсутствие у гражданина действующей медицинской справки о “Физическом здоровье” и “Психическом здоровье”, работающим на государство по найму, организацию, частное предприятие, малое предприятие, индивидуальное предприятие, корпораций, перечень иных предприятий описанных в законе о предпринимательской деятельности, а также у государственного служащего, равно как и ее отсутствие."
        ],
        nakazanie: "Влечет наложение административного штрафа в размере до 10 000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.3",
        stro4ki: [
            "Наезд на пешехода.",
            "Пояснение: При нанесении легкой травмы гражданину штата с помощью транспортного средства."
        ],
        nakazanie: "Влечет наложение административного штрафа в размере 2 000$ и $7000 компенсация пострадавшей стороне."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.4",
        stro4ki: ["Невыполнение правил поведения при введении режима повышенной готовности на территории штата San Andreas."],
        nakazanie: "влечет за собой предупреждение или наложение административного штрафа в размере 20000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.5",
        stro4ki: [
            "Отказ от проверки санитарных норм.",
            "Пояснение: Отказ прохождения проверки организации, частного предприятия, малого предприятия, индивидуального предприятия, корпораций, перечень иных предприятий описанных в законе о предпринимательской деятельности."
        ],
        nakazanie: "влечет административный штраф в размере 150 000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.6",
        stro4ki: [
            "Отказ от проведения проверки санитарных норм.",
            "Пояснение: Отказ отдела SES от проведение запланированной проверки."
        ],
        nakazanie: "влечет административный штраф в размере 100 000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.7",
        stro4ki: [
            "Многократный отказ соответствующего отдела EMS от проведения проверки санитарных норм.",
            "Пояснение: Отказ от проведения запланированной проверки отделом SES более 2 раз."
        ],
        nakazanie: "влечет лишение свободы сроком до 2 лет или штраф в размере 200 000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.8",
        stro4ki: [
            "Многократный отказ от прохождения проверки санитарных норм.",
            "Пояснение: Отказ прохождения проверки организации, частного предприятия, малого предприятия, индивидуального предприятия, корпораций, перечень иных предприятий описанных в законе о предпринимательской деятельности более 2 раз."
        ],
        nakazanie: "влечет лишение свободы сроком до 2 лет или штраф в размере 150 000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.9",
        stro4ki: [
            "Неудовлетворительная оценка санитарных норм по итогам проверки.",
            "Примечание: состояние оценивается специальным отделом EMS и Министром здравоохранения."
        ],
        nakazanie: "влечет административный штраф в размере 105 000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.10",
        stro4ki: [
            "Халатное отношение к обеспечению санитарных услуг и безопасности в среде жизнедеятельности человека.",
            "Пояснение: способствие появлению опасных факторов физической, химической, биологической природы, присутствующий в среде жизнедеятельности человека."
        ],
        nakazanie: "влечет административный штраф в размере 100.000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.11",
        stro4ki: [
            "Халатное отношение к проведению санитарных услуг и безопасности в среде жизнедеятельности человека со стороны санитарно-эпидемиологической службы (SES).",
            "Пояснение: безответственное, предвзятое отношение к проведению проведению санитарных услуг, безопасности и санитарно-эпидемиологической экспертизы."
        ],
        nakazanie: "влечет административный штраф в размере 50.000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.12",
        stro4ki: [
            "Уклонение от запланированной проверки санитарных норм.",
            "Пояснение: Уклонение от запланированной проверки санитарных норм, отсутствие состава/директора или вышестоящего руководства в указанное время запланированной проверки."
        ],
        nakazanie: "влечет наложение административного штрафа на организацию в размере 120 000$."
    }
    glava8.zakony.push(zakon)

    zakon := {
        nomer: "8.13",
        stro4ki: [
            "Многократное уклонение от запланированной проверки санитарных норм.",
            "Пояснение: Уклонение от запланированной проверки санитарных норм, отсутствие состава/директора или вышестоящего руководства в указанное время запланированной проверки более 2-х раз."
        ],
        nakazanie: "влечет наложение административного штрафа на организацию в размере 150 000$."
    }
    glava8.zakony.push(zakon)

    razdel2.glavy.push(glava8)

    glava9_name := "Статья 9. Мелкое хулиганство."

    glava9 := {name: glava9_name, zakony: []}
    zakon := {
        nomer: "9",
        stro4ki: [
            "Мелкое хулиганство, то есть нарушение общественного порядка, выражающее явное неуважение к обществу.",
            "Комментарий: Действия которые могут быть расценены хулиганскими (данный список не является исчерпывающим):",
            "Нахождение в общественном месте без верхней или нижней одежды. Под общественным местом подразумеваются места большого скопления людей, а равно государственные учреждения, скверы, парки, прилегающие территории государственных учреждений. Исключение: пляжи.",
            "Нецензурная брань в общественном месте. Под общественным местом подразумеваются места большого скопления людей, а равно государственные учреждения, скверы, парки, пляжи, прилегающие территории государственных учреждений.",
            "Оскорбительное приставание к гражданам.",
            "Нецензурные жесты.",
            "Действия несущие угрозу обществу(размахивание кулаками, ногами и другими орудиями)",
            "Нарушение установленного регламента поведения в здании гос. учреждения.",
            "Драка в общественных местах, если не имелось признаков уголовного преступления.",
            "Потребление никотиновых веществ в общественном месте."
        ],
        nakazanie: "штраф в размере до 10 000$"
    }
    glava9.zakony.push(zakon)
    razdel2.glavy.push(glava9)

    glava10_name := "Статья 10. Стрельба из оружия в не отведенных для этого местах."

    glava10 := {name: glava10_name, zakony: []}
    zakon := {
        nomer: "10",
        stro4ki: ["Стрельба из оружия в не отведенных для этого местах."],
        nakazanie: "штраф в размере до 5 000 $ с конфискацией оружия."
    }
    glava10.zakony.push(zakon)
    razdel2.glavy.push(glava10)

    glava11_name := "Статья 11. Нахождение в общественном месте в состоянии опьянения."

    glava11 := {name: glava11_name, zakony: []}
    zakon := {
        nomer: "11",
        stro4ki: [
            "Нахождение в общественном месте в состоянии опьянения.",
            "Потребление спиртных напитков и наркотических веществ в общественном месте, а также нахождение в общественном месте в состоянии алкогольного и наркотического опьянения"
        ],
        nakazanie: "штраф в размере до 5 000 $ с конфискацией алкогольной и наркотической продукцией."
    }
    glava11.zakony.push(zakon)
    razdel2.glavy.push(glava11)

    glava12_name := "Статья 12. Мошенничество."

    glava12 := {name: glava12_name, zakony: []}
    zakon := {
        nomer: "12",
        stro4ki: [
            "Мошенничество.",
            "Пояснение: Причинение имущественного ущерба собственнику или иному владельцу имущества путем обмана или злоупотреблением доверием при отсутствии признаков уголовного деяния."
        ],
        nakazanie: "Влечет наложения административного штрафа в размере до пятикратной стоимости причиненного ущерба, но не менее 5 000$ в государственный бюджет."
    }
    glava12.zakony.push(zakon)
    razdel2.glavy.push(glava12)

    glava13_name := "Статья 13. Нарушение трудовых отношений, дисциплины труда со стороны работодателя частного предприятия."

    glava13 := {name: glava13_name, zakony: []}
    zakon := {
        nomer: "13",
        stro4ki: [
            "Нарушение трудовых отношений, дисциплины труда со стороны работодателя частного предприятия.",
            "Пояснение: работодатель может понести административный штраф за нарушение Трудового кодекса и пунктов, которые регламентируют обязанности работодателя, дисциплины труда."
        ],
        nakazanie: "приостановление деятельности на один рабочий день, а также штраф 30.000$"
    }
    glava13.zakony.push(zakon)
    razdel2.glavy.push(glava13)

    glava14_name := "Статья 14. Нарушение трудовых отношений, дисциплины труда со стороны работодателя государственного ведомства."

    glava14 := {name: glava14_name, zakony: []}
    zakon := {
        nomer: "14",
        stro4ki: [
            "Нарушение трудовых отношений, дисциплины труда со стороны работодателя государственного ведомства.",
            "Пояснение: работодатель может понести административный штраф за нарушение Трудового кодекса и пунктов, которые регламентируют обязанности работодателя, дисциплины труда."
        ],
        nakazanie: "штраф 30.000$"
    }
    glava14.zakony.push(zakon)
    razdel2.glavy.push(glava14)

    glava15_name := "Статья 15. Нарушение трудовых отношений, дисциплины труда со стороны работника."

    glava15 := {name: glava15_name, zakony: []}
    zakon := {
        nomer: "15",
        stro4ki: [
            "Нарушение трудовых отношений, дисциплины труда со стороны работника.",
            "Пояснение: работник может понести административный штраф за нарушение Трудового кодекса и пунктов, которые регламентируют обязанности работодателя, помимо дисциплинарного взыскания предусмотренного п. п. 5.4 Трудового кодекса, дисциплины труда."
        ],
        nakazanie: "штраф 20.000$"
    }
    glava15.zakony.push(zakon)
    razdel2.glavy.push(glava15)

    glava16_name := "Статья 16. Дискриминация в сфере труда."

    glava16 := {name: glava16_name, zakony: []}
    zakon := {
        nomer: "16",
        stro4ki: [
            "Дискриминация в сфере труда.",
            "Пояснение: действия, направленные на возбуждение ненависти, равно как нарушение трудовых отношений, а также на унижение достоинства человека, либо группы лиц по признакам пола, расы, национальности, языка, происхождения, отношения к религии, а равно принадлежности к какой-либо социальной группе."
        ],
        nakazanie: "штраф 25.000$"
    }
    glava16.zakony.push(zakon)
    razdel2.glavy.push(glava16)

    glava17_name := "Статья 17. Несоответствие правил внутреннего трудового распорядка текущему законодательству."

    glava17 := {name: glava17_name, zakony: []}
    zakon := {
        nomer: "17",
        stro4ki: ["Несоответствие правил внутреннего трудового распорядка текущему законодательству."],
        nakazanie: "штраф 50.000$ с казны организации."
    }
    glava17.zakony.push(zakon)
    razdel2.glavy.push(glava17)
    akt.razdely.push(razdel2)

    return akt
}