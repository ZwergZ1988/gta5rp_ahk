; Переключить раскладку клавиатуры на русскую
swith_to_RU() {
  SendMessage(0x50,, 0x4190419,, "A")
  sleep 500
}

; Переключить раскладку клавиатуры на англискую
swith_to_EN() {
  SendMessage(0x50,, 0x4090409,, "A")
  sleep 500
}

; Переключить раскладку клавиатуры на немецкую
swith_to_DE() {
  SendMessage(0x50,, 0x4070407,, "A")
  sleep 500
}

; Набрать сообщение в чат с заключительным нажатием Enter
type_message_in_chat_and_submit(chat, message) {
  SendInput("{t}")
  sleep 100
  SendInput(chat . " " . message . "{enter}")
  sleep 1000
  Return
}

; Набрать сообщение в чат без заключительного нажатия Enter (для возможности дописать чтото самому, например ID гражданина)
type_message_in_chat(chat, message) {
  SendInput("{t}")
  sleep 500
  SendInput(chat . " " . message)
  sleep 500
  Return
}

; Вставить текст (Ctrl + V) с сохранением в буфере обмена того что было там до того
paste(pastetext) {
  temp := ClipboardAll()
  A_Clipboard := pastetext
  SendInput("^v")
  sleep 500
  A_Clipboard := temp
  Return
}

; Вставить текст в час и отправить
paste_message_in_chat_and_submit(chat, message) {
  SendInput("{t}")
  sleep 100
  if (chat == "") {
    SendInput("{BACKSPACE}")
    sleep 100
    SendInput("{BACKSPACE}")
    sleep 100
    SendInput("{BACKSPACE}")
    sleep 100
    SendInput("{BACKSPACE}")
    sleep 100
  } else {
    SendInput(chat . "{Space}")
    sleep 1000
  }
  paste(message)
  SendInput("{enter}")
  sleep 1000
  Return
}

; Вставить текст (Ctrl + V) в час и не отправлять (для возможности дописать чтото самому, например ID гражданина)
paste_message_in_chat(chat, message) {
  SendInput("{t}")
  sleep 100
  SendInput(chat . "{Space}")
  paste(message)
  sleep 1000
  Return
}