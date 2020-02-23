@echo off
Title Install Spicetify, Script made by Zalati
:menu
echo --------------------
echo -- Menu du Script --
echo --------------------
echo.
echo 1 - Installer Spicetify
echo 2 - Installer/Update les themes
echo 3 - Re-Appliquer ou changer le theme
echo 4 - Remettre le theme de base de Spotify
echo 5 - Activer/Desactiver le devtool
echo 6 - Quitter
set /p reponse1="Que voulez vous faire ? (Repondez avec le numero) : "
If /i "%reponse1%"=="1" GOTO :InstallSpicetify
If /i "%reponse1%"=="2" GOTO :DownloadThemes
If /i "%reponse1%"=="3" GOTO :ApplyTheme
If /i "%reponse1%"=="4" GOTO :RestoreSpotify
If /i "%reponse1%"=="5" GOTO :DevTool
If /i "%reponse1%"=="6" GOTO :end
ECHO "%reponse1%" n'est pas valide !
GOTO :error1

:InstallSpicetify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass "Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression"
echo WScript.Sleep(5000) >"%temp%\sleep.vbs"
cscript "%temp%\sleep.vbs"
C:\%HOMEPATH%\spicetify-cli\spicetify.exe
cls
GOTO InstallSpicetifyStep2
:InstallSpicetifyStep2
echo Que voulez-vous faire ? (Repondez avec le numero) : 
echo 1 - Installer des themes
echo 2 - Ne pas installer de themes
SET /p reponse2=""
If /i "%reponse2%"=="" GOTO DownloadThemes
If /i "%reponse2%"=="1" GOTO DownloadThemes
If /i "%reponse2%"=="2" GOTO NoDownloadThemes
ECHO "%reponse2%" n'est pas valide !
GOTO :error2

::Telecharge les themes
:DownloadThemes
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://github.com/morpheusthewhite/spicetify-themes/archive/master.zip -Destination C:\%HOMEPATH%\.spicetify\themes.zip"
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Expand-Archive C:\%HOMEPATH%\.spicetify\themes.zip C:\%HOMEPATH%\.spicetify\Themes"
ECHO Veuillez patienter pendant le telechargement des themes.
robocopy C:\%HOMEPATH%\.spicetify\Themes\spicetify-themes-master C:\%HOMEPATH%\.spicetify\Themes\ *.* /E /XD %HOMEPATH\.spicetify\Themes\ /move
del /Q /S "C:\%HOMEPATH%\.spicetify\themes.zip" "C:\%HOMEPATH%\.spicetify\Themes\.gitignore" "C:\%HOMEPATH%\.spicetify\Themes\CODE_OF_CONDUCT.md" "C:\%HOMEPATH%\.spicetify\Themes\LICENSE" "C:\%HOMEPATH%\.spicetify\Themes\README.md"
@RD /S /Q C:\%HOMEPATH%\.spicetify\Themes\spicetify-themes-master
start https://github.com/morpheusthewhite/spicetify-themes
cls
SET /p whichtheme="Voici tous les themes disponibles, choissisez-en un, et entrez son nom (La casse est prise en compte) : "
IF '%whichtheme%'=='' SET whichtheme = 
IF '%whichtheme%'=='%whichtheme%' SET whichtheme = %whichtheme%
SET whichtheme=%whichtheme%
C:\%HOMEPATH%\spicetify-cli\spicetify.exe config current_theme %whichtheme%
C:\%HOMEPATH%\spicetify-cli\spicetify.exe backup
C:\%HOMEPATH%\spicetify-cli\spicetify.exe apply
C:\%HOMEPATH%\spicetify-cli\spicetify.exe update
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO menu

::Ne telecharge pas les themes
:NoDownloadThemes
cls
%SystemRoot%\explorer.exe "C:\%HOMEPATH%\spicetify-cli\Themes\SpicetifyDefault"
echo Faites les modifications de couleurs dans color.ini et les modifications du css dans user.css
SET /p=Puis appuyez sur la touche Enter pour continuer...
C:\%HOMEPATH%\spicetify-cli\spicetify.exe backup
C:\%HOMEPATH%\spicetify-cli\spicetify.exe apply
C:\%HOMEPATH%\spicetify-cli\spicetify.exe update
cls
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO menu

::Applique le theme choisi
:ApplyTheme
cls
start https://github.com/morpheusthewhite/spicetify-themes
cls
SET /p whichtheme="Voici tous les themes disponibles, choissisez-en un, et entrez son nom (La casse est prise en compte), pour appliquer le theme actuel vous devez juste appuyez sur la touche Enter : "
IF '%whichtheme%'=='' SET whichtheme = 
IF '%whichtheme%'=='%whichtheme%' SET whichtheme = %whichtheme%
SET whichtheme=%whichtheme%
C:\%HOMEPATH%\spicetify-cli\spicetify.exe config current_theme %whichtheme%
cls
C:\%HOMEPATH%\spicetify-cli\spicetify.exe backup
C:\%HOMEPATH%\spicetify-cli\spicetify.exe apply
cls
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO menu

::Restaure le theme de base de Spotify
:RestoreSpotify
cls
C:\%HOMEPATH%\spicetify-cli\spicetify.exe restore backup
cls
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO menu

::Active ou Desactive le devtool
:DevTool
cls
echo Que voulez-vous faire ? (Repondez avec le numero) : 
echo 1 - Activer le DevTool
echo 2 - Desactiver le DevTool
SET /p reponse3=""
If /i "%reponse3%"=="" GOTO EnableDevTool
If /i "%reponse3%"=="1" GOTO EnableDevTool
If /i "%reponse3%"=="2" GOTO DisableDevTool
ECHO "%reponse3%" n'est pas valide !
GOTO :error3

::Active le DevTool
:EnableDevTool
cls
C:\%HOMEPATH%\spicetify-cli\spicetify.exe enable-devtool
cls
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO menu

::Desactive le DevTool
:DisableDevTool
cls
C:\%HOMEPATH%\spicetify-cli\spicetify.exe disable-devtool
cls
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO menu

::Erreur
:error1
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO menu

::Erreur
:error2
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO InstallSpicetifyStep2

::Erreur
:error3
SET /p=Appuyez sur la touche Enter pour retourner au menu...
cls
GOTO DevTool

::Ferme le script
:end
exit
