@echo off
cls
Title Install Spicetify, Script made by Zalati
:language
cls
echo *************************************************
echo *                                               *
echo * Chose your language � Choisissez votre langue *
echo *                                               *
echo *************************************************
echo.
echo 1 - English
echo 2 - Fran�ais
echo.
SET /p selectedlanguage="Your choice�Votre choix : "
If /i "%selectedlanguage%"=="1" goto :menu
If /i "%selectedlanguage%"=="2" goto :menu
echo.
echo "%selectedlanguage%" is not a valid number�n'est pas un num�ro valide !
echo Press any key to return to the menu�Appuyez sur une touche pour retourner au menu.
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
If /i "%selectedlanguage%"=="1" echo 1 - Install Spotify (latest version)
If /i "%selectedlanguage%"=="1" echo 2 - Install Spicetify
If /i "%selectedlanguage%"=="1" echo 3 - Install/Update themes
If /i "%selectedlanguage%"=="1" echo 4 - Apply again or change the theme
If /i "%selectedlanguage%"=="1" echo 5 - Put back the Spotify base theme
If /i "%selectedlanguage%"=="1" echo 6 - Toggle Devtool
If /i "%selectedlanguage%"=="1" echo 7 - Toggle ads (test version)
If /i "%selectedlanguage%"=="1" echo 8 - Change language
If /i "%selectedlanguage%"=="1" echo 99 - Quit
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ?
If /i "%selectedlanguage%"=="2" echo 1 - Installer Spotify (derni�re version)
If /i "%selectedlanguage%"=="2" echo 2 - Installer Spicetify
If /i "%selectedlanguage%"=="2" echo 3 - Installer/Update les th�mes
If /i "%selectedlanguage%"=="2" echo 4 - Re-Appliquer ou changer le th�me
If /i "%selectedlanguage%"=="2" echo 5 - Remettre le th�me de base de Spotify
If /i "%selectedlanguage%"=="2" echo 6 - Activer/D�sactiver le devtool
If /i "%selectedlanguage%"=="2" echo 7 - Bloquer/D�bloquer les pubs (version test)
If /i "%selectedlanguage%"=="2" echo 8 - Changer de langue
If /i "%selectedlanguage%"=="2" echo 99 - Quitter
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
If /i "%reponse1%"=="99" exit
echo.
If /i "%selectedlanguage%"=="1" echo "%reponse1%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%reponse1%" n'est pas un num�ro valide !
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
goto :menu

:InstallSpicetify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass "Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression"
cls
%HOMEPATH%\spicetify-cli\spicetify.exe
cls
goto :QDownloadThemes

:QDownloadThemes
cls
echo *************************************************
echo *                                               *
If /i "%selectedlanguage%"=="1" echo *      Installing themes for Spicetify... ?     *
If /i "%selectedlanguage%"=="2" echo *   Installation de th�mes pour Spicetify... ?  *
echo *                                               *
echo *************************************************
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Install themes
If /i "%selectedlanguage%"=="1" echo 2 - Do not install themes
If /i "%selectedlanguage%"=="1" echo 3 - Back
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ? 
If /i "%selectedlanguage%"=="2" echo 1 - Installer des th�mes
If /i "%selectedlanguage%"=="2" echo 2 - Ne pas installer de th�mes
If /i "%selectedlanguage%"=="2" echo 3 - Retour
echo.
If /i "%selectedlanguage%"=="1" SET /p reponse2="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p reponse2="Votre choix : "
If /i "%reponse2%"=="1" goto :DownloadThemes
If /i "%reponse2%"=="2" goto :NoDownloadThemes
If /i "%reponse2%"=="3" goto :menu
echo.
If /i "%selectedlanguage%"=="1" echo "%reponse2%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%reponse2%" n'est pas un num�ro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto :QDownloadThemes

:DownloadThemes
cls
If /i "%selectedlanguage%"=="1" ECHO Please wait while downloading themes.
If /i "%selectedlanguage%"=="2" ECHO Veuillez patienter pendant le t�l�chargement des th�mes.
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://github.com/morpheusthewhite/spicetify-themes/archive/refs/heads/master.zip -Destination %HOMEPATH%\.spicetify\themes.zip"
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Expand-Archive %HOMEPATH%\.spicetify\themes.zip %HOMEPATH%\.spicetify\Themes"
robocopy %HOMEPATH%\.spicetify\Themes\spicetify-themes-master %HOMEPATH%\.spicetify\Themes\ *.* /E /XD %HOMEPATH\.spicetify\Themes\ /move
del /S /F /Q "%HOMEPATH%\.spicetify\themes.zip" "%HOMEPATH%\.spicetify\.gitignore" "%HOMEPATH%\.spicetify\CODE_OF_CONDUCT.md" "%HOMEPATH%\.spicetify\LICENSE"
@RD /S /Q "%HOMEPATH%\.spicetify\Themes\.github"
goto :ApplyNTheme

:NoDownloadThemes
cls
%SystemRoot%\explorer.exe "%HOMEPATH%\spicetify-cli\Themes\SpicetifyDefault"
If /i "%selectedlanguage%"=="1" echo Make the color modifications in color.ini and the css modifications in user.css
If /i "%selectedlanguage%"=="2" echo Faites les modifications de couleurs dans color.ini et les modifications du css dans user.css
echo.
If /i "%selectedlanguage%"=="1" SET /p=Then press a key to continue ...
If /i "%selectedlanguage%"=="2" SET /p=Puis appuyez sur une touche pour continuer...
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
goto :menu

:ApplyTheme
cls
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Reapply current theme
If /i "%selectedlanguage%"=="1" echo 2 - Apply a new theme
If /i "%selectedlanguage%"=="1" echo 3 - Back
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ?
If /i "%selectedlanguage%"=="2" echo 1 - Re-Appliquer � nouveau le th�me actuel
If /i "%selectedlanguage%"=="2" echo 2 - Appliquer un nouveau th�me
If /i "%selectedlanguage%"=="2" echo 3 - Retour
echo.
SET /p applythemechoice="Votre choix : "
If /i "%applythemechoice%"=="1" goto :Reapply
If /i "%applythemechoice%"=="2" goto :ApplyNTheme
If /i "%applythemechoice%"=="3" goto :menu
If /i "%selectedlanguage%"=="1" ECHO "%applythemechoice%" is not a valid number !
If /i "%selectedlanguage%"=="2" ECHO "%applythemechoice%" n'est pas un num�ro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto :ApplyTheme

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
goto :menu

:ApplyNTheme
start https://github.com/morpheusthewhite/spicetify-themes/blob/master/THEMES.md
goto ApplyNTheme2

:ApplyNTheme2
cls
If /i "%selectedlanguage%"=="1" echo Here are all the available themes, make your choice (Case sensitive)
If /i "%selectedlanguage%"=="2" echo Voici tous les th�mes disponibles, faites votre choix (La casse est prise en compte)
echo.
If /i "%selectedlanguage%"=="1" echo Your selection : 
If /i "%selectedlanguage%"=="1" If /i "%whichtheme%"=="" (echo Parent theme : None) else (echo Parent theme : %whichtheme%)
If /i "%selectedlanguage%"=="1" If /i "%childrentheme%"=="" (echo Children theme : None) else (echo Children theme : %childrentheme%)
If /i "%selectedlanguage%"=="2" echo Votre s�lection : 
If /i "%selectedlanguage%"=="2" If /i "%whichtheme%"=="" (echo Th�me parent : Aucun) else (echo Theme parent : %whichtheme%)
If /i "%selectedlanguage%"=="2" If /i "%childrentheme%"=="" (echo Th�me enfant : Aucun) else (echo Theme enfant : %childrentheme%)

echo.
If /i "%selectedlanguage%"=="1" SET /p whichtheme="Enter the desired parent theme: "
If /i "%selectedlanguage%"=="2" SET /p whichtheme="Saisissez le th�me parent souhait�: "
cls

If /i "%selectedlanguage%"=="1" echo Here are all the available themes, make your choice (Case sensitive)
If /i "%selectedlanguage%"=="2" echo Voici tous les th�mes disponibles, faites votre choix (La casse est prise en compte)
echo.
If /i "%selectedlanguage%"=="1" echo Your selection : 
If /i "%selectedlanguage%"=="1" If /i "%whichtheme%"=="" (echo Parent theme : None) else (echo Parent theme : %whichtheme%)
If /i "%selectedlanguage%"=="1" If /i "%childrentheme%"=="" (echo Children theme : None) else (echo Children theme : %childrentheme%)
If /i "%selectedlanguage%"=="2" echo Votre s�lection : 
If /i "%selectedlanguage%"=="2" If /i "%whichtheme%"=="" (echo Th�me parent : Aucun) else (echo Theme parent : %whichtheme%)
If /i "%selectedlanguage%"=="2" If /i "%childrentheme%"=="" (echo Th�me enfant : Aucun) else (echo Theme enfant : %childrentheme%)
echo.
If /i "%selectedlanguage%"=="1" SET /p childrentheme="Enter the desired children theme: "
If /i "%selectedlanguage%"=="2" SET /p childrentheme="Saisissez le th�me enfant souhait�: "
cls

If /i "%selectedlanguage%"=="1" echo Here are all the available themes, make your choice (Case sensitive)
If /i "%selectedlanguage%"=="2" echo Voici tous les th�mes disponibles, faites votre choix (La casse est prise en compte)
echo.
If /i "%selectedlanguage%"=="1" echo Your selection : 
If /i "%selectedlanguage%"=="1" If /i "%whichtheme%"=="" (echo Parent theme : None) else (echo Parent theme : %whichtheme%)
If /i "%selectedlanguage%"=="1" If /i "%childrentheme%"=="" (echo Children theme : None) else (echo Children theme : %childrentheme%)
If /i "%selectedlanguage%"=="2" echo Votre s�lection : 
If /i "%selectedlanguage%"=="2" If /i "%whichtheme%"=="" (echo Th�me parent : Aucun) else (echo Theme parent : %whichtheme%)
If /i "%selectedlanguage%"=="2" If /i "%childrentheme%"=="" (echo Th�me enfant : Aucun) else (echo Theme enfant : %childrentheme%)

echo.
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Confirm your choice
If /i "%selectedlanguage%"=="1" echo 2 - Change your s�lection
If /i "%selectedlanguage%"=="1" echo 3 - Back
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ? 
If /i "%selectedlanguage%"=="2" echo 1 - Confirmer votre choix
If /i "%selectedlanguage%"=="2" echo 2 - Changer de s�lection
If /i "%selectedlanguage%"=="2" echo 3 - Retour
echo.
If /i "%selectedlanguage%"=="1" SET /p applytheme="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p applytheme="Votre choix : "
If /i "%applytheme%"=="1" goto :ConfirmSelection
If /i "%applytheme%"=="2" goto :ApplyNTheme2
If /i "%applytheme%"=="3" goto :menu

:ConfirmSelection
If /i "%childrentheme%"=="" (%HOMEPATH%\spicetify-cli\spicetify.exe config current_theme %whichtheme%) else (%HOMEPATH%\spicetify-cli\spicetify.exe config current_theme %whichtheme% color_scheme %childrentheme%)
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
goto :menu


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
goto :menu

:DevTool
cls
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Activate DevTool
If /i "%selectedlanguage%"=="1" echo 2 - Disable DevTool
If /i "%selectedlanguage%"=="1" echo 2 - Back
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ?
If /i "%selectedlanguage%"=="2" echo 1 - Activer le DevTool
If /i "%selectedlanguage%"=="2" echo 2 - D�sactiver le DevTool
If /i "%selectedlanguage%"=="2" echo 3 - Retour
echo.
SET /p reponse3="Votre choix : "
If /i "%reponse3%"=="1" goto :EnableDevTool
If /i "%reponse3%"=="2" goto :DisableDevTool
If /i "%reponse3%"=="3" goto :menu
If /i "%selectedlanguage%"=="1" ECHO "%reponse3%" is not a valid number !
If /i "%selectedlanguage%"=="2" ECHO "%reponse3%" n'est pas un num�ro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto :DevTool

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
goto :menu

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
goto :menu

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
goto :menu