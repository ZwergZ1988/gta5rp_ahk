#SingleInstance
#Include  "%A_ScriptDir%\..\include\run.ahk"
#Include  "%A_ScriptDir%\..\include\rybalka_func.ahk"
#Include  "%A_ScriptDir%\..\include\gui.ahk"

;send_message_to_parallel_script("info_display.ahk", 1, 0)
CoordMode("Pixel", "Screen")

runMode := 0

set_prefix("\..")
scpriptsRunning := []
scpriptsRunning := run_parallel_script("rybalka_watcher.ahk", scpriptsRunning, "rybalka1")

xStart := 901
yStart := 225
xEnd := 942
yEnd := 270

rect := draw_rectangle(xStart, yStart, xEnd-xStart, yEnd-yStart)
Sleep(500)
rect.Destroy()
Sleep(500)
rect := draw_rectangle(xStart, yStart, xEnd-xStart, yEnd-yStart)
Sleep(500)
rect.Destroy()
Sleep(500)
rect := draw_rectangle(xStart, yStart, xEnd-xStart, yEnd-yStart)
Sleep(500)
rect.Destroy()

send_message_to_parallel_script("rybalka1", 1, xStart)
send_message_to_parallel_script("rybalka1", 2, yStart)
send_message_to_parallel_script("rybalka1", 3, xEnd)
send_message_to_parallel_script("rybalka1", 4, yEnd)
send_message_to_parallel_script("rybalka1", 5, 1)

while (true) {
  Sleep(1000)
}