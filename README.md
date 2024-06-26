Скрипт [**Inno Setup**](https://github.com/jrsoftware/issrc) для сборки установщика [Daggerfall Unity](https://github.com/Interkarma/daggerfall-unity/).

С прицелом на удобство работы и некую портативность используются относительные пути. \
Батник [Create_structure.bat](Create_structure.bat) создаёт в месте использования структуру каталогов, рабочую среду, если можно так выразиться, которую я использовал для сборки инсталлятора:
+ **Installer_Files**
  - **DFU** - сюда складываются билды Daggerfall Unity согласно разрядности
      -	**x32**
      - **x64**
  - **GameFiles** - сюда кладутся игровые ресурсы оригинала (папка "arena2"). Взять их можно из дистрибутива игры из Steam или GOG, либо просто скачать архивом [отсюда](https://drive.google.com/uc?export=download&id=0B0i8ZocaUWLGWHc1WlF3dHNUNTQ) или [отсюда](https://www.mediafire.com/file/gb6h80jxyufeubo/DaggerfallGameFiles.zip/file). Папки SAVE0-5 не нужны, т. к.  они создаются установщиком, а не упаковываются в него изначально.
  - **Optional_things** 
    - **Portable.txt** - предварительно созданный файл, использующийся для определения портативности установки. При его наличии DFU использует папку установки для хранения игровых данных вместо AppData.
  - **Launcher** - сюда помещается лаунчер, собранный или скачанный из [этого проекта](https://github.com/Vitalyudin/Launcher-for-DFU-Installer)
    - **x32**
    - **x64**
+ **Installer_Output** служит для вывода готового установщика после компиляции в Inno Setup.

В сборе установщик опубликован на [TESAll](https://tesall.club/files/modi-dlya-drugikh-igr/10820-daggerfall-unity-installer).
