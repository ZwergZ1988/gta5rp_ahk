DetectHiddenWindows(true)

run_parallel_script(name, scpriptsRunning) {
    Run(A_ScriptDir . "\run\" . name)
    scriptTitle := name . " ahk_class AutoHotkey"
    scpriptsRunning.push(name)
    return scpriptsRunning
}

quit_all_parallel_scripts(scpriptsRunning) {
    for (scpriptRunning in scpriptsRunning) {
        scriptTitle := scpriptRunning . " ahk_class AutoHotkey"
        PostMessage(0x0012, 0, 0, , scpriptRunning)
    }
}

send_message_to_parallel_script(name, wParm, lParam) {
    scriptTitle := name . " ahk_class AutoHotkey"
    PostMessage(0x0400, wParm, lParam, , scriptTitle)
}