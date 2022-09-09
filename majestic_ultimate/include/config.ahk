configFile := "config.ini"

set_config_prafix(prafix) {
    global configFile

    configFile := prafix . configFile
}

config_read(section, key) {
    global configFile
    value := IniRead(configFile, section, key)
    return value
}

config_write(section, key, value) {
    global configFile
    IniWrite(value, configFile, section, key)
}