#Include  "%A_ScriptDir%\include\config.ahk"

CoordMode("Mouse", "Screen")

maskInvPosX := config_read("SWAP", "maskInvPosX")
maskInvPosY := config_read("SWAP", "maskInvPosY")
maskCharPosX := config_read("SWAP", "maskCharPosX")
maskCharPosY := config_read("SWAP", "maskCharPosY")
armorInvPosX := config_read("SWAP", "armorInvPosX")
armorInvPosY := config_read("SWAP", "armorInvPosY")
smgInvPosX := config_read("SWAP", "smgInvPosX")
smgInvPosY := config_read("SWAP", "smgInvPosY")
saigaInvPosX := config_read("SWAP", "saigaInvPosX")
saigaInvPosY := config_read("SWAP", "saigaInvPosY")
carabineInvPosX := config_read("SWAP", "carabineInvPosX")
carabineInvPosY := config_read("SWAP", "carabineInvPosY")
weaponSlotPosX := config_read("SWAP", "weaponSlotPosX")
weaponSlotPosY := config_read("SWAP", "weaponSlotPosY")
nadetOffsetX := config_read("SWAP", "nadetOffsetX")
nadetOffsetY := config_read("SWAP", "nadetOffsetY")

take_smg() {
  Send("{Tab}")
  Sleep(300)
  global maskInvPosX
  global maskInvPosY
  press_pos_xy(maskInvPosX, maskInvPosY)
  Sleep(100)
  global armorInvPosX
  global armorInvPosY
  press_pos_xy(armorInvPosX, armorInvPosY)
  Sleep(100)
  global smgInvPosX
  global smgInvPosY
  press_pos_xy(smgInvPosX, smgInvPosY)
  Sleep(100)
  Send("{Tab}")
}

take_saiga() {
  Send("{Tab}")
  Sleep(300)
  global maskInvPosX
  global maskInvPosY
  press_pos_xy(maskInvPosX, maskInvPosY)
  Sleep(100)
  global armorInvPosX
  global armorInvPosY
  press_pos_xy(armorInvPosX, armorInvPosY)
  Sleep(100)
  global saigaInvPosX
  global saigaInvPosY
  press_pos_xy(saigaInvPosX, saigaInvPosY)
  Sleep(100)
  Send("{Tab}")
}

take_carabine() {
  Send("{Tab}")
  Sleep(300)
  global maskInvPosX
  global maskInvPosY
  press_pos_xy(maskInvPosX, maskInvPosY)
  Sleep(100)
  global armorInvPosX
  global armorInvPosY
  press_pos_xy(armorInvPosX, armorInvPosY)
  Sleep(100)
  global carabineInvPosX
  global carabineInvPosY
  press_pos_xy(carabineInvPosX, carabineInvPosY)
  Sleep(100)
  Send("{Tab}")
}

swap_all() {
  Send("{Tab}")
  Sleep(300)
  global maskCharPosX
  global maskCharPosY
  press_pos_xy(maskCharPosX, maskCharPosY)
  Sleep(100)
  global armorInvPosX
  global armorInvPosY
  press_pos_xy(armorInvPosX, armorInvPosY)
  Sleep(100)
  global weaponSlotPosX
  global weaponSlotPosY
  press_pos_xy(weaponSlotPosX, weaponSlotPosY)
  Sleep(100)
  Send("{Tab}")
}

press_pos_xy(x, y) {
  global nadetOffsetX
  global nadetOffsetY
  
  MouseClick("Right", x, y)
  Sleep(100)
  MouseClick("Left", x+nadetOffsetX, y+nadetOffsetY)
}