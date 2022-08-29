neededColor := "0xc14f4f"

berserkMode := "OFF"
mazafaka := "UP"

podrubay() ; подрубай тригер


;*~$x::
!1:: ; Alt + 1
{
    global berserkMode
    
    if (berserkMode == "ON") {
        berserkMode := "OFF"
    } else {
        berserkMode := "ON"
    }
}


podrubay() {
    global berserkMode
    global mazafaka

    while (true) {
        if (berserkMode := "ON") { ; Если включен берсерк -> делай код
            currentColor := PixelGetColor(960, 540)
            if (currentColor == neededColor) { ; если тип в перекрестии -> врубай мазафаку
                if (mazafaka == "UP") { ; если мазафака вверху -> зажми мазафаку
                    MouseClick("Left", , , , , "D", )
                    mazafaka := "DOWN"
                }
            } else { ; если типа в перекрестии нет -> вырубай мазафаку
                if (mazafaka == "DOWN") { ; если мазафака внизу -> отпусти мазафаку
                    MouseClick("Left", , , , , "U", )
                    mazafaka := "UP"
                }
            }
        }
        Sleep(1)
    }
}