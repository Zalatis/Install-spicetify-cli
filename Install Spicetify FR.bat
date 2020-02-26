@echo off
Title Install Spicetify, Script made by Zalati
:menu
cls
echo --------------------
echo -- Menu du Script --
echo --------------------
echo.
echo Que voulez-vous faire ? (Repondez avec le numero)
echo 1 - Installer Spotify
echo 2 - Installer Spicetify
echo 3 - Installer/Update les themes
echo 4 - Re-Appliquer ou changer le theme
echo 5 - Remettre le theme de base de Spotify
echo 6 - Activer/Desactiver le devtool
echo 7 - Bloquer/Debloquer les pubs (version test)
echo 8 - Quitter
echo.
SET /p reponse1="Votre choix : "
If /i "%reponse1%"=="1" GOTO :InstallSpotify
If /i "%reponse1%"=="2" GOTO :InstallSpicetify
If /i "%reponse1%"=="3" GOTO :DownloadThemes
If /i "%reponse1%"=="4" GOTO :ApplyTheme
If /i "%reponse1%"=="5" GOTO :RestoreSpotify
If /i "%reponse1%"=="6" GOTO :DevTool
If /i "%reponse1%"=="7" GOTO :DisableAdsMenu
If /i "%reponse1%"=="8" GOTO :end
ECHO "%reponse1%" n'est pas valide !
GOTO :error1

:: Installe Spotify
:InstallSpotify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://download.scdn.co/SpotifySetup.exe -Destination C:\%HOMEPATH%\Downloads\SpotifySetup.exe"
cls
C:\%HOMEPATH%\Downloads\SpotifySetup.exe /Silent
cls
del "C:\%HOMEPATH%\Downloads\SpotifySetup.exe" /S /F /Q
cls
echo *************************************************
echo *      l'installation de Spotify est fini !     *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO menu

:: Installe Spicetify
:InstallSpicetify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass "Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression"
cls
C:\%HOMEPATH%\spicetify-cli\spicetify.exe
cls
GOTO InstallSpicetifyStep2
::Step2
:InstallSpicetifyStep2
echo *************************************************
echo *   Installation de themes pour Spicetify... ?  *
echo *************************************************
echo Que voulez-vous faire ? (Repondez avec le numero) : 
echo 1 - Installer des themes
echo 2 - Ne pas installer de themes
echo.
SET /p reponse2="Votre choix : "
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
del /Q /S /F "C:\%HOMEPATH%\.spicetify\themes.zip" "C:\%HOMEPATH%\.spicetify\Themes\.gitignore" "C:\%HOMEPATH%\.spicetify\Themes\CODE_OF_CONDUCT.md" "C:\%HOMEPATH%\.spicetify\Themes\LICENSE" "C:\%HOMEPATH%\.spicetify\Themes\README.md"
@RD /S /Q /F C:\%HOMEPATH%\.spicetify\Themes\spicetify-themes-master
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
cls
echo *************************************************
echo *             Profitez de Spotify !             *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO menu

::Ne telecharge pas les themes
:NoDownloadThemes
cls
%SystemRoot%\explorer.exe "C:\%HOMEPATH%\spicetify-cli\Themes\SpicetifyDefault"
echo Faites les modifications de couleurs dans color.ini et les modifications du css dans user.css
echo.
SET /p=Puis appuyez sur la touche Enter pour continuer...
C:\%HOMEPATH%\spicetify-cli\spicetify.exe backup
C:\%HOMEPATH%\spicetify-cli\spicetify.exe apply
C:\%HOMEPATH%\spicetify-cli\spicetify.exe update
cls
echo *************************************************
echo *             Profitez de Spotify !             *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
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
echo *************************************************
echo *             Profitez de Spotify !             *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO menu

::Restaure le theme de base de Spotify
:RestoreSpotify
cls
C:\%HOMEPATH%\spicetify-cli\spicetify.exe restore backup
cls
echo *************************************************
echo *              Spotify, le retour !             *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO menu

::Active ou Desactive le devtool
:DevTool
cls
echo Que voulez-vous faire ? (Repondez avec le numero) : 
echo 1 - Activer le DevTool
echo 2 - Desactiver le DevTool
echo.
SET /p reponse3="Votre choix : "
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
echo *************************************************
echo *      Le DevTool est maintenant actif !        *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO menu

::Desactive le DevTool
:DisableDevTool
cls
C:\%HOMEPATH%\spicetify-cli\spicetify.exe disable-devtool
cls
echo *************************************************
echo *     Le DevTool est maintenant inactif !       *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO menu

::Menu bloqueur de pubs
:DisableAdsMenu
cls
Rem Suppression de l'ancienne version de AdsManager
del "C:\%HOMEPATH%\Downloads\AdsManagerFR.bat" /S /F /Q
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://raw.githubusercontent.com/Zalatis/Install-spicetify-cli/master/AdsManagerFR.bat -Destination C:\%HOMEPATH%\Downloads\AdsManagerFR.bat"
call C:\%HOMEPATH%\Downloads\AdsManagerFR.bat
cls
echo *************************************************
echo *         Execution de AdsManager...            *
echo *************************************************
echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

::Erreur
:error1
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
goto menu

::Erreur
:error2
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO InstallSpicetifyStep2

::Erreur
:error3
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO DevTool

::Ferme le script
:end
exit
