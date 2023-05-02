#SingleInstance

currentDirection := "W"

!1::
    {
        rand := 0
        while(true) {
            go_around()
            rand := Random(150000, 300000)
            Sleep(rand)
        }
    }

!R::
    {
        Reload
    }

    go_around() {
        global currentDirection
        if (currentDirection == "W") {
            SendInput("{w down}")
            Sleep(5000)
            SendInput("{w up}")
            currentDirection := "S"
        } else {
            SendInput("{s down}")
            Sleep(5000)
            SendInput("{s up}")
            currentDirection := "W"
        }
    }