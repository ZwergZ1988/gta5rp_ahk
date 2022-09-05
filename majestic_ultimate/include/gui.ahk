currentGUIAktion := "DESTROY"
currentGUI := Gui()
gui1 := build_gui_1()
gui2 := build_gui_2()


toggle_gui1() {
    global gui1
    toggle_gui(gui1)
}

toggle_gui2() {
    global gui2
    toggle_gui(gui2)
}

build_gui_1() {
    myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
    myGui.BackColor := "black"

    coordY := 5
    offsetY := add_text_to_gui(myGui, 1710, coordY, [
        {text:"Порядок задержания. (Гл.2 Ст.3)", style: "U"},
        {text:"- наручники"},
        {text:"- пер. мед. пом."},
        {text:"- представиться + опоз. знак"},
        {text:"- дост. в уполн. гос.орг"},
        {text:"  (LSPD, LSCSD, FIB, USSS)"},
        {text:"- до этого статьи и миранду"},
        {text:"- обыск при обвинении"},
        {text:"- в камеру ожид., изолир.помещ."},
        {text:"- дальнейшее расслед. Гл.2 Ст.4 "}
    ])

    coordY := coordY + offsetY + 10
    offsetY := add_text_to_gui(myGui, 1710, coordY, [
        {text:"Расследованиу (Гл.2 Ст.4)", style: "U"},
        {text:"- адвокат"},
        {text:"-- 5 минут на ответ"},
        {text:"-- 10 минут ожидание"},
        {text:"-- 10 мин беседа"},
        {text:"- телефонный звонок"},
        {text:"-- частный адвокат = договор"},
        {text:"-- продолжительность 5 минут"},
        {text:"-- сотрудник рядом"},
        {text:"-- част.адвокат 10 мин. ожид."},
        {text:"- сотрудник гос.орг."},
        {text:"-- руководство и прокурор"},
        {text:"-- 15 минут ожидание"},
        {text:"-- нет прок. и руков. - отпустить"},
        {text:"-- Искл.: тяж. или особо тяж. стат"},
        {text:"- при жалобах прокурор"},
        {text:"-- запись прокурору"},
        {text:"- допрос если нужно"},
        {text:"- принять решение"},
        {text:"-- при гос. - прокурор решает"},
        {text:"- посадить или отпустить"},
        {text:"-- гос. - надо уволить"},
        {text:"-- либо потом уведомить рук-во"}
    ])

    coordY := coordY + offsetY + 10
    offsetY := add_text_to_gui(myGui, 1710, coordY, [
        {text:"Процесс ареста (Гл.3 Ст.1)", style: "U"},
        {text:"- Доставить в КПЗ LSPD/LSCSD/FIB"},
        {text:"- Провести обыск и изъять"},
        {text:"- Собрать данные для Data-Base"},
        {text:"- Поместить в камеру "},
        {text:"- Заполнить Data-Base."}
    ])

    coordY := coordY + offsetY + 10
    offsetY := add_text_to_gui(myGui, 1710, coordY, [
        {text:"Заполнение Data-Base  (Гл.3 Ст.2)", style: "U"},
        {text:"отводится 20 минут"},
        {text:"- Фотография без маски"},
        {text:"- Номер паспорта"},
        {text:"- Имя Фамилия"},
        {text:"- Статьи с указанием кодекса"},
        {text:"- Данные сотрудников (не более 3х)"},
        {text:"-- Имя Фамилия/бейджик/жетон/нашивка"},
        {text:"- Разр. или запр. выход под залог."},
        {text:"- Стажерам запр. заполн. Data-Base."}
    ])

    coordY := coordY + offsetY + 10
    offsetY := add_text_to_gui(myGui, 1710, coordY, [
        {text:"Обыск", style: "U"},
        {text:"- Во время задержания"},
        {text:"- На основании ордера ГП"},
        {text:"- Охран. территории"}
    ])

    coordY := coordY + offsetY + 10
    offsetY := add_text_to_gui(myGui, 1710, coordY, [
        {text:"Личный обыск на месте / машины", style: "U"},
        {text:"- сопротивление при задержании"},
        {text:"- неподчинении законному указанию при задержании"},
        {text:"- попытка бегства"},
        {text:"- насилия или угрозы"},
        {text:"- маска"},
        {text:"- вооружен"},
        {text:"- Служебная собака отдела К9/DSD"}
    ])

    WinSetTransparent(180, myGui)
    return myGui
}

build_gui_2() {
    myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
    myGui.BackColor := "black"

    add_text_to_gui(myGui, 5, 5, [{text:":" . A_ScriptDir, height:10, color: "cBlue"}])

    WinSetTransparent(180, myGui)
    return myGui
}

build_gui_debug(textToShow) {
    myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Debug Okno")
    myGui.BackColor := "black"

    add_text_to_gui(myGui, 5, 5, [{text:textToShow, height:10, color: "cBlue"}])

    WinSetTransparent(180, myGui)
    return myGui
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