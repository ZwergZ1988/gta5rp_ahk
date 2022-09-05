#SingleInstance
#Include  "%A_ScriptDir%\include\gui.ahk"
#Include  "%A_ScriptDir%\include\text.ahk"
#Include  "%A_ScriptDir%\include\run.ahk"
#Include  "%A_ScriptDir%\include\helper.ahk"

scpriptsRunning := []
scpriptsRunning := run_parallel_script("timer.ahk", scpriptsRunning)
scpriptsRunning := run_parallel_script("info_display.ahk", scpriptsRunning)


!1::
{
    toggle_gui1()
}

!2::
{
    toggle_gui2()
}

!3::
{
    send_message_to_parallel_script("info_display.ahk", 0, 2)
}

!4::
{
    show_helper_gui()
}

!9::
{
    send_message_to_parallel_script("timer.ahk", 0, 1)
}

!0::
{
    send_message_to_parallel_script("timer.ahk", 0, 2)
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