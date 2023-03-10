DetectHiddenWindows(true)

currentPrefix := ""

set_prefix(prefix) {
    global currentPrefix
    currentPrefix := prefix
}

run_parallel_script(name, scpriptsRunning, ownTitle := "") {
    global currentPrefix
    Run(A_ScriptDir . currentPrefix . "\run\" . name)
    ;scriptTitle := name . " ahk_class AutoHotkey"
    if (ownTitle != "") {
        Sleep(1000)
        rename_running_script(name, ownTitle)
        name := ownTitle
    }
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

rename_running_script(oldTitle, newTitle) {
    scriptTitle := oldTitle . " ahk_class AutoHotkey"
    WinSetTitle(newTitle , scriptTitle)
}