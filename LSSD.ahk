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
; +F1::                                                         <--- в первой строчке каждого блока указывается сочетание клавиш для запуска этого блока
; paste_message_in_chat_and_submit("/me", "поковырялся в носу") <--- цель каждой функции можно посмотреть в конце этого файла
; paste_message_in_chat_and_submit("/do", "Козява на пальце.")
; Return                                                        <--- после нажатия указанной комбинации блок выполнятся до этой строчки
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
; Полная документация по списку возможных клавиш на сайте AHK: https://www.autohotkey.com/docs/KeyList.htm
;
; Вопросы и предложения: ZwergZ#3560

#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , H
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
#SingleInstance, force
#Warn
;#IfWinActive, ahk_exe GTA5.exe
SendMode Input

currentGUI := 0
build_gui_1()
build_gui_2()

timerStatus := "DISABLED"
build_timer()

!1::
toggle_gui(1)
Return

!2::
toggle_gui(2)
Return

!9::
start_timer()
Return

!0::
disable_timer()
Return

; Менюшка на клавише M появляется в разных местах, поэтому автоматическое прожатие кодов еще не работает
;!F3::
;nazhmi_code0_na_planshete()
;Return

;F1::
; при бинде на F1 будет вылетать в меню рейджа
;Return

+F2::
paste_message_in_chat_and_submit("/b", "откат")
Return

+F3::
paste_message_in_chat_and_submit("/b", "голос сломался, перезагружаю")
Return

+F4::
paste_message_in_chat_and_submit("/b", ">>>>  ZwergZ#3560  <<<<")
Return

+F5::
paste_message_in_chat_and_submit("/do", "На форме жетон: [ LSSD | SPD | 029 ] .")
Return

+F6::
paste_message_in_chat_and_submit("/me", "внимательно осматривает человека напротив")
paste_message_in_chat("/b", "Есть ли какие либо опозновательные знаки у @?")
Return

+F7::
paste_message_in_chat_and_submit("/me", "достал пару резиновых перчаток и надел перчатки на руки")
paste_message_in_chat_and_submit("/me", "начал прохлопывать верхние и нижние слои одежды гражданина напротив")
Return

+F8::
paste_message_in_chat_and_submit("/me", "достал пару резиновых перчаток и надел их на руки")
paste_message_in_chat_and_submit("/me", "легким движением открыл багажник, а затем ознакомился с его содержимым и изучил все труднодоступные места")
Return

!F7::
paste_message_in_chat_and_submit("/do", "У охранника на стойке лежит бланк ареста и ручка.")
paste_message_in_chat_and_submit("/me", "взял бланк ареста, ручку, и заполнил его, после чего положил обратно")
Return

!F8::
paste_message_in_chat_and_submit("/do", "На поясе висит ключ-карта.")
paste_message_in_chat_and_submit("/me", "взял ключ-карту и открыл ей дверь КПЗ")
paste_message_in_chat_and_submit("/me", "завёл в КПЗ задержанного и снял с него наручники")
paste_message_in_chat_and_submit("/me", "закрыл дверь КПЗ и повесил ключ-карту на пояс")
Return

+F9::
paste_message_in_chat_and_submit("/me", "присмотрелся к замку водительской двери автомобиля")
paste_message_in_chat_and_submit("/do", "На машине есть следы взлома.")
paste_message_in_chat_and_submit("/me", "достал планшет и подключил его через провод к сигнализации машины")
paste_message_in_chat_and_submit("/me", "считал данные с системы сигнализации машины на предмет угона")
paste_message_in_chat_and_submit("/do", "Этa машина находится в угоне.")
Return

+F10::
paste_message_in_chat_and_submit("/b", ">>>>  останавливайся или я заливаю за PG  <<<<")
Return

+F11::
paste_message_in_chat_and_submit("/m", "Водитель, остановите ТС и прижмитесь к обочине, при неповиновении мы будем вынуждены открыть огонь")
Return

!R::
Reload

+F12::Pause


; ----------------------------------------------------------------------------------------
;
;          Далее следуют функции, написанные для более удобного создания биндов
;                         Дальше меняем что-то, только если шарим
;
; ----------------------------------------------------------------------------------------

; Переключить раскладку клавиатуры на русскую
swith_to_RU() {
    SendMessage, 0x50,, 0x4190419,, A
    sleep 500
}

; Переключить раскладку клавиатуры на англискую
swith_to_EN() {
    SendMessage, 0x50,, 0x4090409,, A
    sleep 500
}

; Переключить раскладку клавиатуры на немецкую
swith_to_DE() {
    SendMessage, 0x50,, 0x4070407,, A
    sleep 500
}

; Набрать сообщение в чат с заключительным нажатием Enter 
type_message_in_chat_and_submit(chat, message) {
    Sendinput, {t}
    sleep 100
    Sendinput, %chat% %message%{enter}
    sleep 1000
    Return
}

; Набрать сообщение в чат без заключительного нажатия Enter (для возможности дописать чтото самому, например ID гражданина)
type_message_in_chat(chat, message) {
    Sendinput, {t}
    sleep 500
    Sendinput, %chat% %message%
    sleep 500
    Return
}

; Вставить текст (Ctrl + V) с сохранением в буфере обмена того что было там до того
paste(pastetext) {
    temp := ClipboardAll
    Clipboard := pastetext
    Sendinput, ^v
    sleep 50    
    Clipboard := temp
    Return
}

; Вставить текст в час и отправить
paste_message_in_chat_and_submit(chat, message) {
    Sendinput, {t}
    sleep 100
    Sendinput, %chat%{Space}
    paste(message)
    Sendinput, {enter}
    sleep 1000
    Return
}

; Вставить текст (Ctrl + V) в час и не отправлять (для возможности дописать чтото самому, например ID гражданина)
paste_message_in_chat(chat, message) {
    Sendinput, {t}
    sleep 100
    Sendinput, %chat%{Space}
    paste(message)
    sleep 1000
    Return
}

nazhmi_code0_na_planshete() {
    WinGetPos, windowX, windowY, windowW, windowH, ahk_exe GTA5.exe
    windowWhalf := windowW / 2
    windowHhalf := windowH / 2

    Sendinput, m

    Sleep 500

    planshetX := windowWhalf + 100
    planshetY := windowHhalf + 80 ;340
    MouseClick, Left, planshetX, planshetY

    Sleep 500

    code0X := windowWhalf - 285
    code0Y := windowHhalf - 30
    MouseClick, Left, code0X, code0Y

    Sleep 500

    submitCodeX := windowWhalf - 60
    submitCodeY := windowHhalf + 60
    MouseMove, submitCodeX, submitCodeY 
    Return
}

add_text_to_gui(guiID, coordX, coordY, textLines) {
    lineHeight = 16
    offsetY = 0
    for index, guiLine in textLines {
        lineCoordinates := coordY+offsetY
        Gui, %guiID%:Add, Text, x%coordX% y%lineCoordinates% cWhite,
        for index2, guiLineText in guiLine {
            guiLineColor := guiLineText[1]
            guiLineTextText := guiLineText[2]
            guiLineCustomStyle := guiLineText[3]
            if (guiLineCustomStyle == "U") {
                Gui, %guiID%:Font, Underline
            }
            Gui, %guiID%:Add, Text, X+0 %guiLineColor%, %guiLineTextText%
            if (guiLineCustomStyle == "U") {
                Gui, %guiID%:Font, Norm
                Gui, %guiID%:Font, w600
            }
        }
        offsetY := offsetY + lineHeight
    }
    Return offsetY
}

add_law_chapter_to_gui(guiID, coordX, coordY, lawChapter) {
    offsetY := 0

    lawNumberColumnWidth = 60
    lawTextColumnWidth = 600
    
    guiLines := []
    if (StrLen(lawChapter[1]) != 0) {
        guiLines.Push([["cWhite",lawChapter[1], "U"]])
    }    
    if (StrLen(lawChapter[2]) != 0) {
        guiLines.Push([["cWhite",lawChapter[2], "U"]])
    }
    textHeight := add_text_to_gui(guiID, coordX+10, coordY, guiLines)
    offsetY := offsetY + textHeight

    for lawIndex, law in lawChapter[3] {
        offsetX := 0
        startOfLawY := coordY+offsetY
        Switch law[4] {
            Case "Ф":
                lawColor := "cRed"
            Case "Р":
                lawColor := "cGreen"
            Case "ФР":
                lawColor := "cYellow"
            Case "F":
                lawColor := "cBlue"
            Case "FР":
                lawColor := "cAqua"
            Case "А":
                lawColor := "cFuchsia"
            Default:
                lawColor := "cWhite"
        }
        

        if (law[5] == "IMPORTANT") {
            textHeight := add_text_to_gui(guiID, coordX, startOfLawY, [[[lawColor,law[1], "U"]]])
        } else {
            textHeight := add_text_to_gui(guiID, coordX, startOfLawY, [[[lawColor,law[1]]]])
        }
        offsetX := offsetX + lawNumberColumnWidth

        lawTextColumnX := coordX+offsetX
        Gui, 1:Add, Text, cGray x%lawTextColumnX% y%startOfLawY%, ............................................................................................................................................................
        
        for lawLineIndex, lawLine in law[2] {
            textHeight := add_text_to_gui(guiID, coordX+offsetX, coordY+offsetY, [[["cWhite",lawLine]]])
            offsetY := offsetY + textHeight
        }
        offsetX := offsetX + lawTextColumnWidth

        textHeight := add_text_to_gui(guiID, coordX+offsetX, startOfLawY, [[["cWhite",law[3]]]])
    }

    Return offsetY+10
}


toggle_gui(guiIDToShow) {
    global currentGUI
    if (currentGUI != 0) {
        Gui %currentGUI%:Hide
    }
    if (currentGUI != guiIDToShow) {
        Gui, %guiIDToShow%:Show, x0 y0 NoActivate, shpora%guiIDToShow%
        currentGUI := guiIDToShow
    } else {
        currentGUI := 0
    }
}

build_gui_1() {
    Gui, 1:New, +LastFound +AlwaysOnTop -Caption +ToolWindow, shpora1
    CustomColor = EEAA99
    Gui, 1:Color, black
    Gui, 1:Font, s11
    Gui, 1:Font, cWhite
    Gui, 1:Font, w600
    ;Gui, 1:Font,, Verdana
    ;Gui, 1:Font,, Arial
    
    lawPositionX := 0
    lawPositionY := 0

    lc := ["Раздел 3. Преступления против личности"
        ,"Глава 6. Преступления против жизни и здоровья"
        ,[["6.1",["Нанесение телесных повреждений"],"2-4 мес (20 м)", "Р"]
        ,["6.2",["Убийство (Отправление в EMS) **"],"18 лет (3 ч)", "Р"]
        ,["6.3",["Убийство 2-х (Отправление в EMS) ***"],"24 года (4 ч)", "Р"]
        ,["6.4",["Причинение тяжкого вреда по неосторожности"],"4 мес (40 м)", "Р"]
        ,["6.5",["Причинение смерти по неосторожности"],"4 мес (40 м)", "Р"]
        ,["6.6",["Угроза расправой"],"3 мес (30 м)", "Р"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := ["Глава 7. Преступления против свободы"
        ,""
        ,[["7.1",["Похищение человека ***"],"18 Лет (3 ч)", "Ф"]
        ,["7.2",["Клевета в отношении Гос.Служащего"],"до 4 лет (40 м)", "Р","IMPORTANT"]
        ,["7.3",["Клевета, содержащаяся в публичном выступлении *"],"до 4 лет (40 м)", "Р"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := ["Глава 8. Преступления против половой неприкосн. и половой свободы личности"
        ,""
        ,[["8.1",["Изнасилование **"],"12 лет (2 ч)","ФР"]
        ,["8.2",["Изнасилование с причинением тяжкого вреда **"],"24 года (4 ч)","Ф"]
        ,["8.3" ,["Понуждение лица к половому сношению"],"до 4 мес (40 м)","Р"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := [""
        ,"Глава 9. Преступления против конституционных прав и свобод человека и гражданина"
        ,[["9.1",["Незак. собирание или распространение сведений о частной жизни лица"],"до 2 лет (20 м)","Ф"]
        ,["9.2",["Незак. проникновение в жилище"],"до 6 лет (60 м)","ФР"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := ["Раздел 4. Преступления в сфере экономики"
        ,"Глава 10. Преступления против собственности"
        ,[["10.1" ,["Кража свыше $5000. *"],"до 4 лет (40 м)","ФР"]
        ,["10.2",["Мошенничество *"],"до 4 лет (40 м)","FР"]
        ,["10.3",["Грабеж **"],"до 6 лет (60 м)","Р","IMPORTANT"]
        ,["10.4",["Разбой, то есть нападение в целях хищения чужого имущества **"],"до 12 лет (2 ч)","ФР","IMPORTANT"]
        ,["10.5",["Угон Т/C без цели хищения"],"до 4 мес (40 м)", "Р","IMPORTANT"]
        ,["10.5.1",["Угон Т/C c целью хищения"],"до 6 лет (60 м)","ФР"]
        ,["10.6",["Умышленное уничтожение чужого имущества"],"до 4 мес (40 м)","Р"]
        ,["10.7",["Умышл. уничт. или поврежд. чужого имущества (общеопасн. способом) **"],"до 12 лет (2 ч)","Ф"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := [""
        ,"Глава 11. Преступления в сфере экономической деятельности"
        ,[["11.1",["Предпринимательсво без регистрации *"],"6 лет (60 м)","FР"]
        ,["11.6",["Браконьерство в особо крупн. масштабах (>30ти кг при люб.ловле)"],"до 6 лет (60 м)","FР","IMPORTANT"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight


    lc := ["Раздел 5. Преступления против общественной безопасности и общественного порядка"
        ,"Глава 12. Преступления против общественной безопасности"
        ,[["12.1",["Терроризм ***"],"до 30 лет (5 ч)","Ф"]
        ,["12.6",["Злостное хулиганство *"
                    ,"1) Нарушение два или более раз подряд ст. 20.1 без наказания"
                    ,"2) Следующие деяния, совершенные в общественных местах:"
                    ,"2.1) Нецензурные выражения, оскорбительные жесты и провокация конфликтов."
                    ,"2.2) Действия которые могут привести к пожару или взрыву;"
                    ,"2.3) Действия с опасными последствиями для окружающих и самого нарушителя;"
                    ,"2.4) Агитационной деятельности без разрешения руководства учреждения;"
                    ,"2.5) Проход в служ.помещения и на раб.места сотрудников гос. учреждения."
                    ,"2.6) холодное оружие (также спорт.инв. и инстр.) (кроме самообороны)."],"до 12 лет (2 ч)","ФР"]
        ,["12.7",["Незаконное проникновение на закрытые терретории *"],"до 6 лет (60 м)","ФР","IMPORTANT"]
        ,["12.8",["Незаконное хранение оружия или патрон. *"],"до 12 лет (2 ч)","ФР","IMPORTANT"]
        ,["12.10",["Хищение оружия **"],"24 года (4 ч)","Ф"]
        ,["12.10.1",["Хищение оружия со стороны гос.служащего ***"],"24 года (4 ч)","Ф"]
        ,["12.12",["Неприемлемый вид в общ.мест *","  маска, шлем, бег.шорты"],"5000$/2 мес (20 м)","Ф"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := [""
        ,"Глава 13. Преступления против здоровья населения и общественной нравственности"
        ,[["13.1",["Марихуанна свыше 3 грамм. Можно до 8г по закл. врача *"],"до 6 лет (60 м)","ФР","IMPORTANT"]
        ,["13.2",["Марихуанна свыше 10 грамм. **"],"12 лет (2 ч)","Ф"]
        ,["13.2.1",["Марихуанна свыше 35 грамм. ***"],"18 лет (3 ч)","Ф"]
        ,["13.2.2",["SPANK ***"],"24 года (4 ч)","ФР"]
        ,["13.3",["Упаковка таблеток **"],"24 года (4 ч)","ФР"]
        ,["13.3.1",["Анальгетики свыше 5 шт.. (можно до 10 штук с Пометка G) *"],"6 лет (60 м)","ФР"]
        ,["13.4",["Организация проституции."],"до 4 лет (40 м)","Р"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionX := lawPositionX + 780
    lawPositionY := 0 


    lc := ["Раздел 6. Преступления против государственной власти"
        ,"Глава 14. Прест. против основ конституционного строя и безопасности государства"
        ,[["14.3",["Разглашение гос.тайны ***"],"24 года (4 ч)","Ф"]
        ,["14.4",["Экстремизм **"],"до 24 лет (4 ч)","ФР"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight


    lc := [""
        ,"Глава 15. Преступления против власти"
        ,[["15.1",["Превышение должностных полномочий с сущ. нарушеним прав **"],"24 года (4 ч)","Ф"]
        ,["15.1.1",["Злоупотребление должностными полномочиями с сущ. нарушеним прав **"],"12 лет (2 ч)","Ф"]
        ,["15.2",["Умышленное неисполнение зак.приказа начальника *"],"6 лет (60 м)","Ф"]
        ,["15.3",["Самовольное присвоение гражданином полномочий должностного лица. *"],"12 лет (2 ч)","ФР"]
        ,["15.4",["Получение взятки **"],"24 года (4 ч)","ФР"]
        ,["15.4.1",["Вымогательство взятки ***"],"до 12 лет (2 ч)","ФР"]
        ,["15.5",["Дача взятки должностному лицу, лично или через посредника. *"],"до 12 лет (2 ч)","ФР"]
        ,["15.5.1",["Предложение взятки **"],"до 12 лет (2 ч)","ФР"]
        ,["15.6",["Халатность с сущ. нарушеним прав **"],"12 лет (2 ч)","ФР"]
        ,["15.6.1",["Халатность, превышение, злоупотребление *"],"2-4 мес (20-40 м)","ФР"]
        ,["15.7",["Невыполнение постановления  в установленный срок"],"20.000$-75.000$","ФР"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := [""
        ,"Глава 16. Преступления против правосудия"
        ,[["16.14",["Уклонение от расследования, задержания и суда **"],"18 лет (3 ч)","Ф"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := [""
        ,"Глава 17. Преступления против порядка управления"
        ,[["17.1",["Посягательство на жизнь Госника ***"],"24 года (4 ч)","ФР","IMPORTANT"]
        ,["17.2",["Применение насилия, не опасного для жизни или здоровья,"
                    ,"   либо угроза применения насилия в отношении госника *"],"18 лет (3 ч)","ФР"]
        ,["17.3",["Оскорбление госника. *"
                    ,"(негативная оценка личности, внешности, качеств, поведения"
                    ,"в форме противоречащей требованиям общечеловеческой морали."],"4 года(40 м)","Р"]
        ,["17.3.1",["Провок. гос.служащего на дороге путем создания авар.ситуации."],"2 года (20 м)","Р","IMPORTANT"]
        ,["17.3.2",["Провок. гос.служащего путем помехи выполн. им своих служ.обяз. *"],"4 года (40 м)","Р","IMPORTANT"]
        ,["17.4",["Испол. оф.документа, предост. определённые полномочия **"],"12 лет (2 ч)","Ф"]
        ,["17.5",["Неповиновение законному требованию правомочного лица *"],"4 мес (40 м)","ФР","IMPORTANT"]
        ,["17.6",["Отказ от оплаты штрафа *"],"4 мес (40 м)","ФР","IMPORTANT"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight

    lc := ["Административки"
        ,""
        ,[["20.1",["Мелкое хулиганство, то есть нарушение общественного порядка включая:"
                    ,"►Нахождение в общественном месте без верхней одежды;"
                    ,"►Оскорбительное приставание к гражданам;"
                    ,"►Нецензурные жесты;"
                    ,"►Действия несущие угрозу обществу (размахивание кулаками и другими орудиями);"
                    ,"►Драка в общественных местах"
                    ,"►Попрошайничество на территории гос. учреждения или в общ. местах;"
                    ,"►Праздношатание, т.е. пребывание на тер. гос. учреждения"
                    ,"   без определенной цели или без законного повода."],"5 000 $","А"]
        ,["20.2",["Умышленное повреждение чужому имуществу без знач. ущерба"],"1 000 $","А"]
        ,["20.3",["Стрельба без причины в городской черте"],"5 000 $","А"]
        ,["20.5",["Употребление спиртных напитков и нарк. веществ в общественном месте,"
                    ,"    а также нахождение в общественном месте в алк. и нарк. сост."],"4 000 $","А"]
        ,["20.6",["Оскорбление гражданского лица"],"5 000 $","А"]
        ,["21.3",["Воспрепятсвование работе EMS"],"5 000 $","А"]
        ,["21.4",["Умышленное повреждение чужому имуществу"],"3 000 $","А"]
        ,["21.5",["Тайное хищение чужого имущества"],"5 000 $","А"]
        ,["22.1",["Курение в гос. учереждениях"],"3.5 - 5 000 $","А"]
        ,["22.2",["Разведение костров в общественном месте"],"3 - 5 000 $","А"]
        ,["22.3",["Использование колонок в гос. учереждениях"],"3 - 4 000 $","А"]
        ,["23.1",["Браконьерство рыбалка (без лицензии до 30 кг и только на пирсе)"
                    ,"+ по 500$ за 1кг привышения по 4.2.1 закона о рыбалке (?????)"],"3 - 15 000 $","А"]
        ,["23.2",["Браконьерство охота (можно до 15 кг без лицензии)"],"5 - 20 000 $","А"]]]
    lawChapterHeight := add_law_chapter_to_gui(1, lawPositionX,lawPositionY,lc)
    lawPositionY := lawPositionY + lawChapterHeight


    add_text_to_gui(1, 350, 1000, [[["cWhite","Вы имеете право хранить молчание. Всё, что вы скажете, может быть исп. против Вас."]]
                                ,[["cWhite","Вы имеете право на один телефонный звонок. Также вы имеете право на адвоката."]]
                                ,[["cWhite","Если вам необходим адвокат, он будет для Вас запрошен. Вам ясны ваши права?"]]])

    add_text_to_gui(1, 5, 1000, [[["cRed","ФЕДЕРАЛЬНЫЕ"]]
                                ,[["cYellow","ФЕДЕР./РЕГИОНАЛ."]]
                                ,[["cGreen","РЕГИОНАЛЬНЫЕ"]]])
    
    add_text_to_gui(1, 170, 1000, [[["cBlue","ФИНАНСОВЫЕ"]]
                                ,[["cAqua","ФИНАНС./РЕГИОНАЛ."]]
                                ,[["cFuchsia","АДМИНИСТРАТИВНЫЕ"]]])

    add_text_to_gui(1, 1550, 0, [[["cWhite","(Статья 10) Основания на задержание", "U"]]
                                ,[["cWhite","► лицо застиг. в момент сов. прест."]]
                                ,[["cWhite","► на подозр. будут следы прест."]]
                                ,[["cWhite","► фото или видео фиксация"]]
                                ,[["cWhite","► ордер или указ"]]
                                ,[["cWhite","    подпис. Губ., Виц.Губ., ГП, ЗГП"]]
                                ,[["cWhite","    или реш. суда"]]
                                ,[["cWhite","► лицо в маске до уст. личн. + обыск"]]
                                ,[["cWhite",""]]
                                ,[["cWhite","Личн. обыск н  месте", "U"]]
                                ,[["cWhite","► сопротивление, неподчинение"]]
                                ,[["cWhite","► попытка бегства;"]]
                                ,[["cWhite","► насилие или угроза насилия долж. лицу"]]
                                ,[["cWhite","► маску, либо был вооружен"]]
                                ,[["cWhite",""]]
                                ,[["cWhite","Основания на обыск автомобиля", "U"]]
                                ,[["cWhite","► в п.3 ст.23 ПК (сопротивление/неподчинение;"]]
                                ,[["cWhite","  попытка бегства; маска, либо был вооружен;"]]
                                ,[["cWhite","  насилие или угрозу насилия долж. лицу)"]]
                                ,[["cWhite","► ст.4 (неостановка по требованию)"]]
                                ,[["cWhite","► ст.67, 68, 69, 70 ДК (без действующих номеров)"]]
                                ,[["cWhite","► если нет лицензии на рыбалку"]]
                                ,[["cWhite","► если нет лицензии на охоту"]]
                                ,[["cWhite","► СИД, ФИБ, НГ имеют свои полномочия"]]
                                ,[["cWhite","► Исключением при обыске является т/с,"]]
                                ,[["cWhite","  осуществляющее поставку мед./мат."]]
                                ,[["cWhite",""]]
                                ,[["cWhite","Порядок задержания", "U"]]
                                ,[["cWhite","► Наручники"]]
                                ,[["cWhite","► Представиться"]]
                                ,[["cWhite","► Доставить в помещение уполн.органа"]]
                                ,[["cWhite","► До окончания п.3:"]]
                                ,[["cWhite","    разъяснить основания задержания"]]
                                ,[["cWhite","    прочитать правило Миранды"]]
                                ,[["cWhite","► провести обыск"]]
                                ,[["cWhite",""]]
                                ,[["cWhite","Расследование", "U"]]
                                ,[["cWhite","► Адвокат (5мин ответ, 10мин приезд)"]]
                                ,[["cWhite","    (запрос с начала и до конца расследования)"]]
                                ,[["cWhite","► 1 тел. звонок 5мин"]]
                                ,[["cWhite","► гос.сотр. -> руков.+прок. (10мин ожидание)"]]
                                ,[["cWhite","    если руков. не прибыло -> уведомить"]]
                                ,[["cWhite","► Принять решение"]]
                                ,[["cWhite","    (если гос.сотр -> решение принимает прок.)"]]
                                ,[["cWhite","► Посадить или опустить"]]
                                ,[["cWhite",""]]
                                ,[["cWhite","Порядок ареста", "U"]]
                                ,[["cWhite","► Доставить  в место лиш. свободы;"]]
                                ,[["cWhite","► Провести обыск; изъять"]]
                                ,[["cWhite","► Поместить его в тюремную камеру (КПЗ)"]]
                                ,[["cWhite","► Поместить его в следств. изол. (ФТ)"]]
                                ,[["cWhite",""]]
                                ,[["cWhite","ЗОТ LSSD", "U"]]
                                ,[["cWhite","► Губ., Виц.Губ., ГП, ЗГП"]]
                                ,[["cWhite","► Мин.Внут.Безоп."]]
                                ,[["cWhite","► Мэр округа Блейн"]]
                                ,[["cWhite","► друг. Мин.+замы,сов.Губ и В.Губ"]]
                                ,[["cWhite","► CID/NSB ФРБ (для рассл. и зад. лиц)"]]
                                ,[["cWhite","► USMS (при контр. за LSSD)"]]
                                ,[["cWhite","► сотрудники оффиса ГП (при контр. за LSSD)"]]])


    add_text_to_gui(1, 780, 906, [[["cWhite","Неприкос", "U"]]
                                ,[["cWhite","► Губ., Виц.Губ. (+советники), ГП, ЗГП, Спик.Конгр.,"]]
                                ,[["cWhite","► Министры(+их замы), Гл.Колл.Адв., Мэры, Виц.Мэры"]]
                                ,[["cWhite","► Судьи, Дир.Секр.Служ., Дир.Служ.Марш."]]
                                ,[["cWhite","► Помощники ГП (во время исп.служ.об)"]]])

    add_text_to_gui(1, 1190, 906, [[["cWhite","Коды", "U"]]
                                ,[["cWhite","0 сотрудник ранен/убит"]]
                                ,[["cWhite","1 стрельба"]]
                                ,[["cWhite","2 помощь с мигалками"]]
                                ,[["cWhite","3 эвакуация сотр./задерж."]]
                                ,[["cWhite","4 всё хорошо"]]])

    add_text_to_gui(1, 1400, 906, [[["cWhite","Тен-Коды", "U"]]
                                ,[["cWhite","10-0 - Отмена"]]
                                ,[["cWhite","10-3 - Радиотишина"]]
                                ,[["cWhite","10-4 - Принял"]]
                                ,[["cWhite","10-5 - Повторите"]]
                                ,[["cWhite","10-6 - Отказ"]]
                                ,[["cWhite","10-7 - Ожидайте"]]
                                ,[["cWhite","10-20 - Текущее местоположение"]]
                                ,[["cWhite","10-77 - Расчётное время прибытия"]]])

;10-9 - Продолжаю патруль
;10-10 - Закончил патруль
;10-11 - В участке неадекват
;10-12 - В участке посетитель
;10-20 - Текущее местоположение
;10-26 - Провожу задержание
;10-32 - Вижу вооруженного
;10-46 - Провожу обыск
;10-48 - Требуется эвакуация
;10-50 - Веду преследование
;10-55 - Провожу трафик-стоп
;10-60 - Запрос помощи при 10-50
;10-70 - Требуется поддержка
;10-77 - Расчётное время прибытия

    WinSet, TransColor, %CustomColor% 180
}

build_gui_2() {
    Gui, 2:New, +LastFound +AlwaysOnTop -Caption +ToolWindow, shpora2
    CustomColor = EEAA99
    Gui, 2:Color, black
    Gui, 2:Font, s11
    Gui, 2:Font, cWhite
    Gui, 2:Font, w600
    ;Gui, 2:Font,, Verdana
    ;Gui, 2:Font,, Arial

    add_text_to_gui(2, 10, 10, [[["cRed","НЕ БОЛЕЕ 3 ЧАСОВ "],["cWhite","- Нападение на FZ, любые виды поставок, Gun Shop, граффити вар"]]
                               ,[["cRed","НЕ БОЛЕЕ 3 ЧАСОВ "],["cWhite","- Опасные районы"]]
                               ,[["cRed","НЕ БОЛЕЕ 4 ЧАСОВ "],["cWhite","- Рейд"]]
                               ,[["cRed","НЕ БОЛЕЕ 5 ЧАСОВ "],["cWhite","- Захват гос.структур"]]
                               ,[["cRed","НЕ БОЛЕЕ 5 ЧАСОВ "],["cWhite","- По всем остальным классическим ситуациям, где Вы встретились на трассе итд"]]])

    add_text_to_gui(2, 10, 100, [[["cWhite","Срок давности преступлений УК - 20 лет ((90 дней))"]]
                                ,[["cWhite","Кроме: глава 14, статьи: 6.1, 6.3, 8.2, 12.1 - 12.5, 13.2.1, 13.2.2, 15.1, 15.6, 16.2, 17.1"]]])

    WinSet, TransColor, %CustomColor% 180
}

build_timer() {
    global timerStatus
    
    While (true) {
        if (timerStatus == "START") {
            startTimeStamp := 0
            FormatTime, timeBuffer , , HH
            startTimeStamp := startTimeStamp + timeBuffer * 3600
            FormatTime, timeBuffer , , mm
            startTimeStamp := startTimeStamp + timeBuffer * 60
            FormatTime, timeBuffer , , ss
            startTimeStamp := startTimeStamp + timeBuffer
            timerStatus := "STARTED"
        }
        if (timerStatus == "STARTED") {
            Gui, 9:New, +LastFound +AlwaysOnTop -Caption +ToolWindow, timeGui
            Gui, 9:Color, black
            Gui, 9:Font, s16
            Gui, 9:Font, cWhite
            Gui, 9:Font, w600
            ;Gui, 9:Font,, Verdana
            ;Gui, 9:Font,, Arial

            timeStamp := 0
            FormatTime, timeBuffer , , HH
            timeStamp := timeStamp + timeBuffer * 3600
            FormatTime, timeBuffer , , mm
            timeStamp := timeStamp + timeBuffer * 60
            FormatTime, timeBuffer , , ss
            timeStamp := timeStamp + timeBuffer

            secondsGone := timeStamp - startTimeStamp
            hoursGone := Floor(secondsGone / 3600)
            secondsGone := secondsGone - hoursGone * 3600
            minutesGone := Floor(secondsGone / 60)
            secondsGone := secondsGone - minutesGone * 60

            hoursGone := SubStr("0" . hoursGone, -1)
            minutesGone := SubStr("0" . minutesGone, -1)
            secondsGone := SubStr("0" . secondsGone, -1)

            timeGone = %hoursGone%:%minutesGone%:%secondsGone%

            add_text_to_gui(9, 0, 11, [[["cWhite",timeGone]]])

            WinSet, TransColor, FF0000 180
            Gui, 9:Show, x1780 y930 NoActivate, timeGui
        }
        if (timerStatus == "DISABLE") {
            Gui, 9:Destroy
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