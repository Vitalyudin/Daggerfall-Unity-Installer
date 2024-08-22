:: Создаём папки под ресурсы проекта
mkdir .\Installer_Files
:: Папки под DFU
mkdir .\Installer_Files\DFU
mkdir .\Installer_Files\DFU\x32
mkdir .\Installer_Files\DFU\x64
:: Сюда идут ресурсы Даггерфолла
mkdir .\Installer_Files\GameFiles
:: Папка под опциональные штуки - пока что только признак портативной установки
mkdir .\Installer_Files\Optional_things
@echo off
  break>".\Installer_Files\Optional_things\Portable.txt"
:: Папки под лаунчер
mkdir .\Installer_Files\Launcher
mkdir .\Installer_Files\Launcher\x32
mkdir .\Installer_Files\Launcher\x64
:: И папка под выходной файл установщика
mkdir .\Installer_Output