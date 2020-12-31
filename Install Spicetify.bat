@echo off
chcp 65001
cls
Title Install Spicetify, Script made by Zalati
:language
cls
echo *************************************************
echo *                                               *
echo * Chose your language ‖ Choisissez votre langue *
echo *                                               *
echo *************************************************
echo.
echo 1 - English
echo 2 - Français
echo.
SET /p selectedlanguage="Your choice‖Votre choix : "
If /i "%selectedlanguage%"=="1" goto :menu
If /i "%selectedlanguage%"=="2" goto :menu
echo.
echo "%selectedlanguage%" is not a valid number‖n'est pas un numéro valide !
echo Press any key to return to the menu‖Appuyez sur une touche pour retourner au menu.
pause > nul
cls
goto language

:menu
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *                  Script Menu                  *
If /i "%selectedlanguage%"=="2" echo *                 Menu du script                *
echo *                                               *
echo *************************************************
echo.
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Install Spotify
If /i "%selectedlanguage%"=="1" echo 2 - Install Spicetify
If /i "%selectedlanguage%"=="1" echo 3 - Install/Update themes
If /i "%selectedlanguage%"=="1" echo 4 - Apply again or change the theme
If /i "%selectedlanguage%"=="1" echo 5 - Put back the Spotify base theme
If /i "%selectedlanguage%"=="1" echo 6 - Toggle Devtool
If /i "%selectedlanguage%"=="1" echo 7 - Toggle ads (test version)
If /i "%selectedlanguage%"=="1" echo 8 - Change language
If /i "%selectedlanguage%"=="1" echo 9 - Quit
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ?
If /i "%selectedlanguage%"=="2" echo 1 - Installer Spotify
If /i "%selectedlanguage%"=="2" echo 2 - Installer Spicetify
If /i "%selectedlanguage%"=="2" echo 3 - Installer/Update les thèmes
If /i "%selectedlanguage%"=="2" echo 4 - Re-Appliquer ou changer le thème
If /i "%selectedlanguage%"=="2" echo 5 - Remettre le thème de base de Spotify
If /i "%selectedlanguage%"=="2" echo 6 - Activer/Désactiver le devtool
If /i "%selectedlanguage%"=="2" echo 7 - Bloquer/Débloquer les pubs (version test)
If /i "%selectedlanguage%"=="2" echo 8 - Changer de langue
If /i "%selectedlanguage%"=="2" echo 9 - Quitter
echo.
If /i "%selectedlanguage%"=="1" SET /p reponse1="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p reponse1="Votre choix : "
If /i "%reponse1%"=="1" goto :InstallSpotify
If /i "%reponse1%"=="2" goto :InstallSpicetify
If /i "%reponse1%"=="3" goto :DownloadThemes
If /i "%reponse1%"=="4" goto :ApplyTheme
If /i "%reponse1%"=="5" goto :RestoreSpotify
If /i "%reponse1%"=="6" goto :DevTool
If /i "%reponse1%"=="7" goto :DisableAdsMenu
If /i "%reponse1%"=="8" goto :language
If /i "%reponse1%"=="9" exit
echo.
If /i "%selectedlanguage%"=="1" echo "%reponse1%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%reponse1%" n'est pas un numéro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:InstallSpotify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://download.scdn.co/SpotifySetup.exe -Destination %HOMEPATH%\Downloads\SpotifySetup.exe"
cls
%HOMEPATH%\Downloads\SpotifySetup.exe /Silent
cls
del /S /F /Q "%HOMEPATH%\Downloads\SpotifySetup.exe"
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *   The installation of Spotify is finished!    *
If /i "%selectedlanguage%"=="2" echo *      L'installation de Spotify est fini !     *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:InstallSpicetify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass "Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression"
cls
%HOMEPATH%\spicetify-cli\spicetify.exe
cls
goto InstallSpicetifyStep2

:InstallSpicetifyStep2
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *      Installing themes for Spicetify... ?     *
If /i "%selectedlanguage%"=="2" echo *   Installation de themes pour Spicetify... ?  *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Install themes
If /i "%selectedlanguage%"=="1" echo 2 - Do not install themes
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ? 
If /i "%selectedlanguage%"=="2" echo 1 - Installer des thèmes
If /i "%selectedlanguage%"=="2" echo 2 - Ne pas installer de thèmes
echo.
If /i "%selectedlanguage%"=="1" SET /p reponse2="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p reponse2="Votre choix : "
If /i "%reponse2%"=="1" goto DownloadThemes
If /i "%reponse2%"=="2" goto NoDownloadThemes
echo.
If /i "%selectedlanguage%"=="1" echo "%reponse2%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%reponse2%" n'est pas un numéro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto InstallSpicetifyStep2

:DownloadThemes
cls
If /i "%selectedlanguage%"=="1" ECHO Please wait while downloading themes.
If /i "%selectedlanguage%"=="2" ECHO Veuillez patienter pendant le téléchargement des thèmes.
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://github.com/morpheusthewhite/spicetify-themes/archive/master.zip -Destination %HOMEPATH%\.spicetify\themes.zip"
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Expand-Archive %HOMEPATH%\.spicetify\themes.zip %HOMEPATH%\.spicetify\Themes"
robocopy %HOMEPATH%\.spicetify\Themes\spicetify-themes-master %HOMEPATH%\.spicetify\Themes\ *.* /E /XD %HOMEPATH\.spicetify\Themes\ /move
del /S /F /Q "%HOMEPATH%\.spicetify\themes.zip" "%HOMEPATH%\.spicetify\.gitignore" "%HOMEPATH%\.spicetify\CODE_OF_CONDUCT.md" "%HOMEPATH%\.spicetify\LICENSE"
@RD /S /Q "%HOMEPATH%\.spicetify\Themes\.github"
start https://github.com/morpheusthewhite/spicetify-themes
cls
If /i "%selectedlanguage%"=="1" SET /p whichtheme="Here are all the available themes, choose one, and enter its name (Case sensitive) : "
If /i "%selectedlanguage%"=="2" SET /p whichtheme="Voici tous les themes disponibles, choisissez-en un, et entrez son nom (La casse est prise en compte) : "
IF '%whichtheme%'=='' SET whichtheme = 
IF '%whichtheme%'=='%whichtheme%' SET whichtheme = %whichtheme%
SET whichtheme=%whichtheme%
%HOMEPATH%\spicetify-cli\spicetify.exe config current_theme %whichtheme%
%HOMEPATH%\spicetify-cli\spicetify.exe backup
%HOMEPATH%\spicetify-cli\spicetify.exe apply
%HOMEPATH%\spicetify-cli\spicetify.exe update
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *                Enjoy Spotify !                *
If /i "%selectedlanguage%"=="2" echo *             Profitez de Spotify !             *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:NoDownloadThemes
cls
%SystemRoot%\explorer.exe "%HOMEPATH%\spicetify-cli\Themes\SpicetifyDefault"
If /i "%selectedlanguage%"=="1" echo Make the color modifications in color.ini and the css modifications in user.css
If /i "%selectedlanguage%"=="2" echo Faites les modifications de couleurs dans color.ini et les modifications du css dans user.css
echo.
If /i "%selectedlanguage%"=="1" SET /p=Then press the Enter key to continue ...
If /i "%selectedlanguage%"=="2" SET /p=Puis appuyez sur la touche Enter pour continuer...
%HOMEPATH%\spicetify-cli\spicetify.exe backup
%HOMEPATH%\spicetify-cli\spicetify.exe apply
%HOMEPATH%\spicetify-cli\spicetify.exe update
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *                Enjoy Spotify !                *
If /i "%selectedlanguage%"=="2" echo *             Profitez de Spotify !             *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:ApplyTheme
cls
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Reapply current theme
If /i "%selectedlanguage%"=="1" echo 2 - Apply a new theme
If /i "%selectedlanguage%"=="1" echo 3 - Back
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ?
If /i "%selectedlanguage%"=="2" echo 1 - Re-Appliquer à nouveau le thème actuel
If /i "%selectedlanguage%"=="2" echo 2 - Appliquer un nouveau thème
If /i "%selectedlanguage%"=="2" echo 3 - Retour
echo.
SET /p applythemechoice="Votre choix : "
If /i "%applythemechoice%"=="1" goto :Reapply
If /i "%applythemechoice%"=="2" goto :ApplyNTheme
If /i "%applythemechoice%"=="3" goto :menu
If /i "%selectedlanguage%"=="1" ECHO "%applythemechoice%" is not a valid number !
If /i "%selectedlanguage%"=="2" ECHO "%applythemechoice%" n'est pas un numéro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto ApplyTheme

:Reapply
cls
%HOMEPATH%\spicetify-cli\spicetify.exe backup
%HOMEPATH%\spicetify-cli\spicetify.exe apply
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *                Enjoy Spotify !                *
If /i "%selectedlanguage%"=="2" echo *             Profitez de Spotify !             *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
GOTO menu

:ApplyNTheme
start https://github.com/morpheusthewhite/spicetify-themes
cls
If /i "%selectedlanguage%"=="1" SET /p whichtheme="Here are all the available themes, choose one, and enter its name (Case sensitive) : pour appliquer le theme actuel vous devez juste appuyez sur la touche Enter : "
If /i "%selectedlanguage%"=="2" SET /p whichtheme="Voici tous les themes disponibles, choisissez-en un, et entrez son nom (La casse est prise en compte), pour appliquer le theme actuel vous devez juste appuyez sur la touche Enter : "
IF '%whichtheme%'=='' SET whichtheme = 
IF '%whichtheme%'=='%whichtheme%' SET whichtheme = %whichtheme%
SET whichtheme=%whichtheme%
%HOMEPATH%\spicetify-cli\spicetify.exe config current_theme %whichtheme%
cls
%HOMEPATH%\spicetify-cli\spicetify.exe backup
%HOMEPATH%\spicetify-cli\spicetify.exe apply
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *                Enjoy Spotify !                *
If /i "%selectedlanguage%"=="2" echo *             Profitez de Spotify !             *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
GOTO menu

:RestoreSpotify
cls
%HOMEPATH%\spicetify-cli\spicetify.exe restore backup
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *              Spotify, the return !            *
If /i "%selectedlanguage%"=="2" echo *              Spotify, le retour !             *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
GOTO menu

:DevTool
cls
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Activate DevTool
If /i "%selectedlanguage%"=="1" echo 2 - Disable DevTool
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ?
If /i "%selectedlanguage%"=="2" echo 1 - Activer le DevTool
If /i "%selectedlanguage%"=="2" echo 2 - Desactiver le DevTool
echo.
SET /p reponse3="Votre choix : "
If /i "%reponse3%"=="1" GOTO EnableDevTool
If /i "%reponse3%"=="2" GOTO DisableDevTool
If /i "%selectedlanguage%"=="1" ECHO "%reponse3%" is not a valid number !
If /i "%selectedlanguage%"=="2" ECHO "%reponse3%" n'est pas un numéro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
GOTO DevTool

:EnableDevTool
cls
%HOMEPATH%\spicetify-cli\spicetify.exe enable-devtool
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *           DevTool is now active !             *
If /i "%selectedlanguage%"=="2" echo *      Le DevTool est maintenant actif !        *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
GOTO menu

:DisableDevTool
cls
%HOMEPATH%\spicetify-cli\spicetify.exe disable-devtool
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *          DevTool is now inactive !            *
If /i "%selectedlanguage%"=="2" echo *     Le DevTool est maintenant inactif !       *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
GOTO menu

:DisableAdsMenu
cls
del /S /F /Q "%HOMEPATH%\Downloads\AdsManager.bat"
cls
If /i "%selectedlanguage%"=="1" %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://zalati.fr/tools/AdsManagerEN.bat -Destination %HOMEPATH%\Downloads\AdsManager.bat"
If /i "%selectedlanguage%"=="2" %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://zalati.fr/tools/AdsManagerFR.bat -Destination %HOMEPATH%\Downloads\AdsManager.bat"
call %HOMEPATH%\Downloads\AdsManager.bat
Title Install Spicetify, Script made by Zalati
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *           Launching AdsManager...             *
If /i "%selectedlanguage%"=="2" echo *         Lancement de AdsManager...            *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu