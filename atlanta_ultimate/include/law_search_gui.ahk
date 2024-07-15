toggle_law_search_gui() {
  global currentGUI
  global currentGUIAktion

  if (currentGUIAktion == "DESTROY") {
    currentGUI.Destroy()
    currentGUIAktion := "DESTROYED"
  }

  if (currentGUIAktion == "HIDE") {
    currentGUI.Hide()
    currentGUIAktion := "HIDDEN"
  }

  if (currentGUIAktion != "DESTROYED") {
    currentGUI := build_law_search_gui()
    currentGUIAktion := "DESTROY"
  } else {
    currentGUIAktion := "BEGIN"
  }
}

build_law_search_gui() {
  akty := Map()
  akty["1YK"] := get_YK()
  akty["2DK"] := get_DK()

  inputObj := InputBox("Введите слово или номер статьи для поиска по УК и АК", "Поиск по УК и АК", "W360 H90")

  if (inputObj.Result != "OK" or inputObj.Value == "" or inputObj.Value == " ") {
    return Gui()
  }

  searchText := inputObj.Value

  if (IsInteger(StrReplace(searchText, "ю"))) {
    searchText := StrReplace(searchText, "ю", ".")
  }

  if (IsInteger(StrReplace(searchText, "-"))) {
    searchText := StrReplace(searchText, "-", ".")
  }

  if (IsInteger(StrReplace(searchText, "?"))) {
    searchText := StrReplace(searchText, "?", ".")
  }

  if (IsInteger(StrReplace(searchText, ">"))) {
    searchText := StrReplace(searchText, ">", ".")
  }

  foundAkty := Map()

  for aktKey, akt in akty {
    foundAkty[aktKey] := {name: akt.name, zakony: []}
    for razdel in akt.razdely {
      for glava in razdel.glavy {
        for zakon in glava.zakony {
          for stro4ka in zakon.stro4ki {
            if (InStr(zakon.nomer, searchText, "Locale") or InStr(stro4ka, searchText, "Locale")) {
              foundAkty[aktKey].zakony.push({razdel: razdel.name, glava: glava.name, zakon: zakon})
              break
            }
          }
        }
      }
    }
  }

  myGui := Gui("+LastFound +AlwaysOnTop -Caption +ToolWindow", "Found Zakon")
  myGui.BackColor := "black"

  offsetY := 0
  for aktKey, foundAkt in foundAkty {
    if (foundAkt.zakony.Length > 0) {
      newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundAkt.name, height:10, color: "cWhite", style: "U"}])
      offsetY := offsetY + newOffset
      for foundZakon in foundAkt.zakony {
        newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.razdel, height:10, color: "cBlue"}])
        offsetY := offsetY + newOffset

        newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.glava, height:10, color: "cAqua"}])
        offsetY := offsetY + newOffset

        zakonColor := "cWhite"

        newOffset := add_text_to_gui(myGui, 5, offsetY, [{text:foundZakon.zakon.nomer, height:10, color: zakonColor}])

        if (foundZakon.zakon.HasOwnProp("tip")) {
          newOffset := add_text_to_gui(myGui, 5, offsetY + 15, [{text:foundZakon.zakon.tip, height:10, color: zakonColor}])
        }

        for stro4ka in foundZakon.zakon.stro4ki {
          newOffset := add_text_to_gui(myGui, 100, offsetY, [{text:stro4ka, height:10}])
          offsetY := offsetY + newOffset
        }

        if (foundZakon.zakon.HasOwnProp("prioritet")) {
          newOffset := add_text_to_gui(myGui, 100, offsetY, [{text:foundZakon.zakon.prioritet, height:10, color: "cRed"}])
          offsetY := offsetY + newOffset
        }

        if (foundZakon.zakon.HasOwnProp("nakazanie")) {
          newOffset := add_text_to_gui(myGui, 100, offsetY, [{text:foundZakon.zakon.nakazanie, height:10, color: "cRed"}])
          offsetY := offsetY + newOffset
        }

        offsetY := offsetY + 5
      }
    }
  }

  WinSetTransparent(180, myGui)
  myGui.Show("x0 y0 NoActivate")
  return myGui
}