#Requires AutoHotkey v2.0
#Include "%A_ScriptDir%\include\ygolov_kod.ahk"

FileEncoding("UTF-8")

yk_raw := FileRead("include\yk_raw.txt")

yk := get_YK()
; akt := {name: akt_name, razdely: []}
; razdel := {name: razdel_name, glavy: []}
; glava := {name: glava_name, zakony: []}
; zakon := {
;   chast: "🟡",
;   nomer: "6.2",
;   tip: "[Р]",
;   stro4ki: ["Умышленное нанесение особо тяжких телесных повреждений (( Нокнутое состояние ))."],
;   nakazanie: "→ От 3 до 5 лет лишения свободы в Федеральной тюрьме."
; }

for razdel in yk.razdely {
  if (InStr(yk_raw, razdel.name) = 0) {
    MsgBox("razdel: " . razdel.name)
  } 
  for glava in razdel.glavy {
    if (InStr(yk_raw, glava.name) = 0) {
      MsgBox("glava: " . glava.name)
    }
    for zakon in glava.zakony {
      for stro4ka in zakon.stro4ki {
        if (InStr(yk_raw, stro4ka) = 0) {
          MsgBox(zakon.nomer . " stro4ka: " . stro4ka)
        }
      }
    }
  }
}

