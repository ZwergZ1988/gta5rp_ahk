timerStatus := "DISABLED"
timerGui := Gui()

do_timer_tick() {
  global timerStatus
  global timerGui
  global startTimeStamp
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

    timerGui.Destroy()

    timerGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Timer")
    timerGui.BackColor := "black"

    add_text_to_gui(timerGui, 15, 10, [{text:timeGone, height:20}])

    WinSetTransparent(180, timerGui)
    timerGui.Show("x1780 y930 NoActivate")
  }
  if (timerStatus == "DISABLE") {
    timerGui.Hide()
    timerStatus := "DISABLED"
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

register_workitem(do_timer_tick)