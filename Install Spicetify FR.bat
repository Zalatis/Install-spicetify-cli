@echo off
Title Install Spicetify, Script made by Zalati
:start
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass "Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression"
spicetify
%SystemRoot%\explorer.exe "%HOMEPATH%\spicetify-cli\Themes\SpicetifyDefault"
SET /p choice=Voulez-vous installer quelques themes? Oui ou Non, (par défaut: Oui): 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='O' GOTO oui
IF '%choice%'=='Oui' GOTO oui
IF '%choice%'=='Y' GOTO oui
IF '%choice%'=='y' GOTO oui
IF '%choice%'=='yes' GOTO oui
IF '%choice%'=='Yes' GOTO oui
IF '%choice%'=='N' GOTO non
IF '%choice%'=='n' GOTO non
IF '%choice%'=='no' GOTO non
IF '%choice%'=='non' GOTO non
ECHO "%choice%" n'est pas valide !
ECHO.

:non
cls
echo Faites les modifications de couleurs dans color.ini et les modifications du css dans user.css
set /p=Puis appuyez sur la touche Enter pour continuer...
spicetify update
spicetify backup apply enable-devtool

:oui
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://github.com/morpheusthewhite/spicetify-themes/archive/master.zip -Destination %HOMEPATH%\.spicetify\themes.zip"
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Expand-Archive %HOMEPATH%\.spicetify\themes.zip %HOMEPATH%\.spicetify\Themes"
robocopy %HOMEPATH%\.spicetify\Themes\spicetify-themes-master %HOMEPATH%\.spicetify\Themes\ *;* /E /XD %HOMEPATH\.spicetify\Themes\ /move
del /Q /S "%HOMEPATH%\.spicetify\themes.zip" "%HOMEPATH%\.spicetify\Themes\.gitignore" "%HOMEPATH%\.spicetify\Themes\CODE_OF_CONDUCT.md" "%HOMEPATH%\.spicetify\Themes\LICENSE" "%HOMEPATH%\.spicetify\Themes\README.md"
cls
echo Faites les modifications de couleurs dans color.ini et les modifications du css dans user.css
set /p=Puis appuyez sur la touche Enter pour continuer...
spicetify update
spicetify backup apply enable-devtool
exit