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

currentDirection := "W"

!1::
rand := 0
while(true) {
    go_around()
    Random, rand, 150000, 300000
    Sleep rand
}
Return

!R::
Reload

go_around() {
    global currentDirection
    if (currentDirection == "W") {
        Send, {w down}
        Sleep 5000
        Send, {w up}
        currentDirection := "S"
    } else {
        Send, {s down}
        Sleep 5000
        Send, {s up}
        currentDirection := "W"
    }
}