alarmStatus := "DISABLED"
seconds := 0
alarmGui := Gui()

do_alarm_tick() {
  global alarmGui
  global alarmStatus
  global seconds
  global startAlarmStamp

  if (alarmStatus == "START") {
    startAlarmStamp := 0
    timeBuffer := FormatTime(, "HH")
    startAlarmStamp := startAlarmStamp + timeBuffer * 3600
    timeBuffer := FormatTime(, "mm")
    startAlarmStamp := startAlarmStamp + timeBuffer * 60
    timeBuffer := FormatTime(, "ss")
    startAlarmStamp := startAlarmStamp + timeBuffer
    alarmStatus := "STARTED"
  }
  if (alarmStatus == "STARTED") {
    timeStamp := 0
    timeBuffer := FormatTime(, "HH")
    timeStamp := timeStamp + timeBuffer * 3600
    timeBuffer := FormatTime(, "mm")
    timeStamp := timeStamp + timeBuffer * 60
    timeBuffer := FormatTime(, "ss")
    timeStamp := timeStamp + timeBuffer

    secondsRemaining := seconds - (timeStamp - startAlarmStamp)

    if (secondsRemaining <= 0) {
      secondsRemaining := seconds
      alarmStatus := "ALARM"
    }

    hoursRemaining := Floor(secondsRemaining / 3600)
    secondsRemaining := secondsRemaining - hoursRemaining * 3600
    minutesRemaining := Floor(secondsRemaining / 60)
    secondsRemaining := secondsRemaining - minutesRemaining * 60

    hoursRemaining := SubStr("0" . hoursRemaining, -2)
    minutesRemaining := SubStr("0" . minutesRemaining, -2)
    secondsRemaining := SubStr("0" . secondsRemaining, -2)

    timeRemaining := hoursRemaining . ":" . minutesRemaining . ":" . secondsRemaining

    alarmGui.Destroy()

    alarmGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
    if (alarmStatus == "ALARM") {
      alarmGui.BackColor := "red"
    } else {
      alarmGui.BackColor := "black"
    }

    add_text_to_gui(alarmGui, 15, 10, [{text:timeRemaining, height:20}])

    WinSetTransparent(180, alarmGui)
    alarmGui.Show("x1780 y930 NoActivate")
    if (alarmStatus == "ALARM") {
      SoundPlay(A_WinDir "\Media\Alarm01.wav", "WAIT")
      alarmStatus := "DISABLE"
    }
  }
  if (alarmStatus == "DISABLE") {
    alarmGui.Hide()
    alarmStatus := "DISABLED"
  }
}

start_alarm() {
  global alarmStatus
  global seconds

  inputObj := InputBox("На сколько минут поставить будильник?", "W300 H90")

  if (inputObj.Result != "OK" or inputObj.Value == "" or inputObj.Value == " " or not IsInteger(inputObj.Value)) {
    alarmStatus := "DISABLE"
  } else {
    seconds := inputObj.Value * 60

    alarmStatus := "START"
  }
}

disable_alarm() {
  global alarmStatus
  alarmStatus := "DISABLE"
  seconds := 0
}

register_workitem(do_alarm_tick)