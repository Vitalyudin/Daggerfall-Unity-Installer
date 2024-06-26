﻿#define DFUName "Daggerfall Unity"                               
#define DFUVersion "1.1.1"           
#define DFUPublisher "Gavin 'Interkarma' Clayton; Bethesda Softworks"
#define DFUExeName "DaggerfallUnityLauncher.exe"     
#define DFUUninstaller "unins000.exe"    
#define DFUUninstallerName "Удалить"
#define DFUCopyrights "Gavin 'Interkarma' Clayton; Bethesda Softworks" 
#define DFUInstallerFilesDir ".\Installer_Files"
#define DFUInstallerBuildDir ".\Installer_Output"

[Setup]
AppId={{здесь должен быть GUID приложения}
AppName={#DFUName}
AppVersion={#DFUversion}
VersionInfoVersion={#DFUVersion}
AppVerName={#DFUName} {#DFUversion}
AppPublisher={#DFUpublisher}
AppCopyright= {#DFUCopyrights}
DefaultDirName={code:GetProgramFiles}\{#DFUName} 
DefaultGroupName={#DFUName}
AllowNoIcons=1
OutputDir={#DFUInstallerBuildDir}
OutputBaseFilename={#DFUName} {#DFUversion} Setup
SetupIconFile={#DFUInstallerFilesDir}\DAGGER.ICO
Compression=lzma/max 
SolidCompression=1
ShowComponentSizes=1
UseSetupLdr=1
AllowCancelDuringInstall=1
CreateUninstallRegKey=0
PrivilegesRequired=Admin
DisableProgramGroupPage=yes
Output=1
Uninstallable=not WizardIsTaskSelected('portable_file')

[Code]
// Получаем путь непосредственно к Program files без приписки (x86) для DefaultDirName
function GetProgramFiles(Param: string): string;
begin
  if IsWin64 then Result := ExpandConstant('{pf64}')
    else Result := ExpandConstant('{pf32}')
end;

[Languages]
// Выбираем языки установщика
//Name: "en"; MessagesFile: "compiler:Default.isl"    // Английский пока не нужен, и не знаю, понадобится ли
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"

[CustomMessages]
//en.DFUUninstallerName=Uninstall
ru.DFUUninstallerName=Удалить
ru.CreateStartMenuIcons=Создать ярлыки в меню Пуск
ru.PortableOption=Портативная установка: использовать папку игры вместо AppData для хранения игровых данных и не создавать деинсталлятор
ru.CreateDesktopIcon=Добавить ярлык на рабочий стол

// Постим ярлыки в Пуск
[Icons]
Name: "{group}\{#DFUName} Launcher"; Filename: "{app}\{#DFUExeName}"; Tasks: start_menu_folder
Name: "{group}\{cm:DFUUninstallerName}"; Filename: "{app}\{#DFUUninstaller}"; Tasks: start_menu_folder; Check: "not WizardIsTaskSelected('portable_file')"
Name: "{commondesktop}\{#DFUName}"; Filename: "{app}\{#DFUExeName}"; Tasks: desktopicon

[InstallDelete]
Type: filesandordirs; Name: {group}\*;

// Собираем файлы лаунчера, DFU и мануала
[Files]  
// x64                                                               
Source: "{#DFUInstallerFilesDir}\launcher\x64\DaggerfallUnityLauncher.exe"; DestDir: "{app}\"; Flags: ignoreversion; Check: IsWin64;
Source: "{#DFUInstallerFilesDir}\DFU\x64\*"; Excludes: "*StreamingAssets\GameFiles\readme.txt"; DestDir: "{app}\DaggerfallUnity\"; Flags: ignoreversion recursesubdirs createallsubdirs;   Check: IsWin64;                
// x32                                                           
Source: "{#DFUInstallerFilesDir}\launcher\x32\DaggerfallUnityLauncher.exe"; DestDir: "{app}\"; Flags: ignoreversion; Check: "not IsWin64";
Source: "{#DFUInstallerFilesDir}\DFU\x32\*"; Excludes: "*StreamingAssets\GameFiles\readme.txt"; DestDir: "{app}\DaggerfallUnity\"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: "not IsWin64";             
// Не зависящие от разрядности ОС
Source: "{#DFUInstallerFilesDir}\GameFiles\*"; DestDir: "{app}\DaggerfallUnity\DaggerfallUnity_Data\StreamingAssets\GameFiles\"; Flags: ignoreversion recursesubdirs createallsubdirs 
// Файл для портативной	 установки
Source: "{#DFUInstallerFilesDir}\Optional_things\Portable.txt"; DestDir: "{app}\DaggerfallUnity"; Flags: ignoreversion; Tasks: portable_file  

// Создаём необходимые для работы игры пустые папки сейвов
[Dirs]
Name: "{app}\DaggerfallUnity\DaggerfallUnity_Data\StreamingAssets\GameFiles\SAVE0"; 
Name: "{app}\DaggerfallUnity\DaggerfallUnity_Data\StreamingAssets\GameFiles\SAVE1\"; 
Name: "{app}\DaggerfallUnity\DaggerfallUnity_Data\StreamingAssets\GameFiles\SAVE2\"; 
Name: "{app}\DaggerfallUnity\DaggerfallUnity_Data\StreamingAssets\GameFiles\SAVE3\"; 
Name: "{app}\DaggerfallUnity\DaggerfallUnity_Data\StreamingAssets\GameFiles\SAVE4\"; 
Name: "{app}\DaggerfallUnity\DaggerfallUnity_Data\StreamingAssets\GameFiles\SAVE5\"; 

// Даём чекбокс на создание ярлыков, по умолчанию не отмечен
[Tasks]
Name: "start_menu_folder"; Description: "{cm:CreateStartMenuIcons}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
// Даём чекбокс для портативной установки
Name: "portable_file"; Description: "{cm:PortableOption}";  Flags: unchecked

// Даём чекбокс на запуск по окончании установки
[Run]
Filename: "{app}\{#DFUExeName}"; Description: "{cm:LaunchProgram,{#StringChange('Daggerfall Unity Launcher', '&', '&&')}}"; Flags: shellexec postinstall skipifsilent
