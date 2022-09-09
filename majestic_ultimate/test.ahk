#SingleInstance
#Include  "%A_ScriptDir%\include\run.ahk"
scpriptsRunning := []
scpriptsRunning := run_parallel_script("info_display.ahk", scpriptsRunning)


!1::
{
    send_message_to_parallel_script("info_display.ahk", 1, 1)
}

!R::
{
    Reload
}

!X::
{
    global scpriptsRunning
    quit_all_parallel_scripts(scpriptsRunning)
    ExitApp
}