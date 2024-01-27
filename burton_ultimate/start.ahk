#SingleInstance

screenResolution := "2K"

#Include "%A_ScriptDir%\include\worker.ahk"
#Include "%A_ScriptDir%\include\alarm.ahk"
#Include "%A_ScriptDir%\include\chat.ahk"
#Include "%A_ScriptDir%\include\dorozhn_kod.ahk"
#Include "%A_ScriptDir%\include\gui.ahk"
#Include "%A_ScriptDir%\include\gui1.ahk"
#Include "%A_ScriptDir%\include\gui2.ahk"
#Include "%A_ScriptDir%\include\law_search_gui.ahk"
#Include "%A_ScriptDir%\include\timer.ahk"
#Include "%A_ScriptDir%\include\ygolov_kod.ahk"

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
    toggle_law_search_gui()
  }

!4::
  {
    show_helper_gui()
  }

!8::
  {
    start_alarm()
  }

!9::
  {
    start_timer()
  }

!0::
  {
    disable_timer()
    disable_alarm()
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
    paste_message_in_chat_and_submit("/b", ">>>> ZwergZ <<<<")
  }

;+F5::
;  {
;    paste_message_in_chat_and_submit("/do", "На форме жетон: [ LSSD | SPD | 2863 ] .")
;  }

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
    paste_message_in_chat_and_submit("/do", "Чемодан со спец. средствами LSPD находится в багажнике.")
    paste_message_in_chat_and_submit("/me", "открыл багажник автомобиля правой рукой и взял чемодан, закрыл багажник")
    paste_message_in_chat_and_submit("/me", "открыл чемодан, достал из него магнитный порошок и обработал им замок автомобиля")
    paste_message_in_chat_and_submit("/try", "обнаружил следы взлома в замке ")
    paste_message_in_chat_and_submit("/me", "достал из чемодана лупу и внимательно осмотрел дверь на следы повреждения замка")
    paste_message_in_chat_and_submit("/try", "нашел следы повреждения замка инородным предметом ")
    paste_message_in_chat_and_submit("/me", "осмотрел с помощью лупы замок на наличие инородных предметов")
    paste_message_in_chat_and_submit("/try", "обнаружил инородные предметы в замке  ")

  }

+F10::
  {
    paste_message_in_chat_and_submit("/b", ">>>> останавливайся или я заливаю за PG <<<<")
  }

+F11::
  {
    paste_message_in_chat_and_submit("/m", "Водитель, остановите ТС и прижмитесь к обочине, при неповиновении мы будем вынуждены открыть огонь")
  }

;!F5::
;  {
;    paste_message_in_chat_and_submit("", "Вы имеете право хранить молчание. Всё, что вы скажете, может быть исп. против Вас.")
;    paste_message_in_chat_and_submit("", "Вы имеете право на один телефонный звонок. Также вы имеете право на адвоката.")
;    paste_message_in_chat_and_submit("", "Если вам необходим адвокат, он будет для Вас запрошен.")
;  }

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

  work()