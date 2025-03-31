@echo off
cls
Title Install Spicetify, Script made by Zalati
:language
cls
echo  ************************************************************
echo  *                                                          *
echo  *      Chose your language º Choisissez votre langue       *
echo  *                                                          *
echo  ************************************************************
echo.
echo 1 - English
echo 2 - Fran‡ais
echo.
SET /p selectedlanguage="Your choiceºVotre choix : "
If /i "%selectedlanguage%"=="1" goto menu
If /i "%selectedlanguage%"=="2" goto menu
echo.
echo "%selectedlanguage%" is not a valid numberºn'est pas un num‚ro valide !
echo Press any key to return to the menuºAppuyez sur une touche pour retourner au menu.
pause > nul
cls
goto language

:menu
cls
if exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    %LOCALAPPDATA%\spicetify\spicetify.exe -v > %LOCALAPPDATA%\spicetify\version.txt
    SET /p current=<%LOCALAPPDATA%\spicetify\version.txt
) else (
	SET current=None
)
if "%current%"=="None" (
	If /i "%selectedlanguage%"=="1" echo Spicetify is not installed yet
    If /i "%selectedlanguage%"=="2" echo Spicetify n'est pas encore install‚
) else (
	If /i "%selectedlanguage%"=="1" echo Your actual version of Spicetify : v%current%
	If /i "%selectedlanguage%"=="2" echo Votre version actuelle de Spicetify : v%current%
)
if "%latest%"=="" (
	for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repositories/159981830/releases/latest ^| find "tag_name"') do (
	set latest=%%B)
)
set latest=%latest:",=%
set latest=%latest:"v=%
if %current%==%latest% (
	If /i "%selectedlanguage%"=="1" echo You are in the latest version of Spicetify
	If /i "%selectedlanguage%"=="2" echo Vous ˆtes dans la derniŠre version de Spicetify
) else (
	If %current%=="None" (
		If /i "%selectedlanguage%"=="1" echo Use "2" to install Spicetify
		If /i "%selectedlanguage%"=="2" echo Utilisez "2" pour installer Spicetify
	) else (
	If /i "%selectedlanguage%"=="1" echo A new version of Spicetify is available
	If /i "%selectedlanguage%"=="2" echo Une nouvelle version de Spicetify est disponnible
	)
)
echo.
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *                       Script Menu                        *
If /i "%selectedlanguage%"=="2" echo  *                      Menu du script                      *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo What do you want to do ?
If /i "%selectedlanguage%"=="1" echo 1 - Install Spotify
If /i "%selectedlanguage%"=="1" echo 2 - Install Spicetify
If /i "%selectedlanguage%"=="1" echo 3 - Update Spicetify
If /i "%selectedlanguage%"=="1" echo 4 - Install Spicetify Marketplace
If /i "%selectedlanguage%"=="1" echo 5 - Activate an extension
If /i "%selectedlanguage%"=="1" echo 6 - Activate a custom application
If /i "%selectedlanguage%"=="1" echo 7 - Put back the Spotify base theme
If /i "%selectedlanguage%"=="1" echo 8 - Enable Devtool
If /i "%selectedlanguage%"=="1" echo 9 - Change language
If /i "%selectedlanguage%"=="1" echo 99 - Quit
If /i "%selectedlanguage%"=="2" echo Que voulez-vous faire ?
If /i "%selectedlanguage%"=="2" echo 1 - Installer Spotify
If /i "%selectedlanguage%"=="2" echo 2 - Installer Spicetify
If /i "%selectedlanguage%"=="2" echo 3 - Mettre … jour Spicetify
If /i "%selectedlanguage%"=="2" echo 4 - Installer le Marketplace Spicetify
If /i "%selectedlanguage%"=="2" echo 5 - Activer une extension
If /i "%selectedlanguage%"=="2" echo 6 - Activer une application custom
If /i "%selectedlanguage%"=="2" echo 7 - Remettre le thŠme de base de Spotify
If /i "%selectedlanguage%"=="2" echo 8 - Activer le devtool
If /i "%selectedlanguage%"=="2" echo 9 - Changer de langue
If /i "%selectedlanguage%"=="2" echo 99 - Quitter
echo.
If /i "%selectedlanguage%"=="1" SET /p reponse1="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p reponse1="Votre choix : "
If /i "%reponse1%"=="1" goto InstallSpotify
If /i "%reponse1%"=="2" goto InstallSpicetify
If /i "%reponse1%"=="3" goto UpdateSpicetify
If /i "%reponse1%"=="4" goto InstallMarketplace
If /i "%reponse1%"=="5" goto ActivateExtension
If /i "%reponse1%"=="6" goto ActivateCustomApp
If /i "%reponse1%"=="7" goto RestoreSpotify
If /i "%reponse1%"=="8" goto EnableDevTool
If /i "%reponse1%"=="9" goto language
If /i "%reponse1%"=="99" exit
echo.
If /i "%selectedlanguage%"=="1" echo "%reponse1%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%reponse1%" n'est pas un num‚ro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:SpicetifyNotInstalled
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *       Install Spicetify before using this feature        *
If /i "%selectedlanguage%"=="2" echo  * Installez Spicetify avant d'utilis‚ cette fonctionnalit‚ *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:InstallSpotify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://download.scdn.co/SpotifySetup.exe -Destination C:%HOMEPATH%\Downloads\SpotifySetup.exe"
cls
C:%HOMEPATH%\Downloads\SpotifySetup.exe /Silent
cls
del /S /F /Q "C:%HOMEPATH%\Downloads\SpotifySetup.exe"
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *        The installation of Spotify is finished !         *
If /i "%selectedlanguage%"=="2" echo  *           L'installation de Spotify est fini !           *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:InstallSpicetify
cls
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass "Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression"
cls
%LOCALAPPDATA%\spicetify\spicetify.exe backup apply
goto QInstallMarketplace

:QInstallMarketplace
cls
if not exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    goto SpicetifyNotInstalled
)
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *           Want to install the marketplace... ?           *
If /i "%selectedlanguage%"=="2" echo  *        Voulez-vous installer le marketplace... ?         *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo 1 - Yes
If /i "%selectedlanguage%"=="1" echo 2 - No
If /i "%selectedlanguage%"=="2" echo 1 - Oui
If /i "%selectedlanguage%"=="2" echo 2 - Non
echo.
If /i "%selectedlanguage%"=="1" SET /p reponse2="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p reponse2="Votre choix : "
If /i "%reponse2%"=="1" goto InstallMarketplace				
If /i "%reponse2%"=="2" goto menu
echo.
If /i "%selectedlanguage%"=="1" echo "%reponse2%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%reponse2%" n'est pas un num‚ro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto QInstallMarketplace

:InstallMarketplace
cls
if not exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    goto SpicetifyNotInstalled
)
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass "Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/Zalatis/my-tools/main/SpicetifyMarketplace.ps1" | Invoke-Expression"
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *            The marketplace is now installed !            *
If /i "%selectedlanguage%"=="2" echo  *         Le marketplace est maintenant install‚ !         *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:UpdateSpicetify
cls
if not exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    goto SpicetifyNotInstalled
)
%LOCALAPPDATA%\spicetify\spicetify.exe upgrade
%LOCALAPPDATA%\spicetify\spicetify.exe restore backup apply
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *          The Update of Spicetify is finished !           *
If /i "%selectedlanguage%"=="2" echo  *          La mise … jour de Spicetify est fini !          *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:ActivateExtension
cls
if not exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    goto SpicetifyNotInstalled
)
SET "extensionchoice="
SET "extensionname="
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *                   Activate a extension                   *
If /i "%selectedlanguage%"=="2" echo  *                   Activer une extension                  *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Which one do you want to activate?
If /i "%selectedlanguage%"=="2" echo Laquelle voulez-vous activer ?
echo 1 - Auto Skip Explicit
echo 2 - Auto Skip Videos
echo 3 - Bookmark
echo 4 - Full App Display
echo 5 - Keyboard Shortcut
echo 6 - Loppy Loop
echo 7 - OBS Now Playing
echo 8 - Popup Lyrics
echo 9 - Shuffle+
echo 10 - Trashbin
echo 11 - Web Now Playing
If /i "%selectedlanguage%"=="1" echo 99 - Back
If /i "%selectedlanguage%"=="2" echo 99 - Retour
echo.
If /i "%selectedlanguage%"=="1" SET /p extensionchoice="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p extensionchoice="Votre choix : "
If %extensionchoice% NEQ 1 If %extensionchoice% NEQ 2 If %extensionchoice% NEQ 3 If %extensionchoice% NEQ 4 If %extensionchoice% NEQ 5 If %extensionchoice% NEQ 6 If %extensionchoice% NEQ 7 If %extensionchoice% NEQ 8 If %extensionchoice% NEQ 9 If %extensionchoice% NEQ 10 If %extensionchoice% NEQ 11 If %extensionchoice% NEQ 99 goto ErrorExtension
If /i "%extensionchoice%"=="1" SET extensionname=autoSkipExplicit.js
If /i "%extensionchoice%"=="2" SET extensionname=autoSkipVideo.js
If /i "%extensionchoice%"=="3" SET extensionname=bookmark.js
If /i "%extensionchoice%"=="4" SET extensionname=fullAppDisplay.js
If /i "%extensionchoice%"=="5" SET extensionname=keyboardShortcut.js
If /i "%extensionchoice%"=="6" SET extensionname=loopyLoop.js
If /i "%extensionchoice%"=="7" (
	if exist %LOCALAPPDATA%\spicetify\Extensions\obsnowplaying.js (
		del /S /F /Q %LOCALAPPDATA%\spicetify\Extensions\obsnowplaying.js
	)
	cls
	If /i "%selectedlanguage%"=="1" echo Currently downloading the extension obsnowplaying.js
	If /i "%selectedlanguage%"=="2" echo T‚l‚chargement en cours de l'extension obsnowplaying.js
	%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://zalati.fr/download/obsnowplaying.js -Destination %LOCALAPPDATA%\spicetify\Extensions\obsnowplaying.js"
	SET extensionname=obsnowplaying.js
)
If /i "%extensionchoice%"=="8" SET extensionname=popupLyrics.js
If /i "%extensionchoice%"=="9" SET extensionname=shuffle+.js
If /i "%extensionchoice%"=="10" SET extensionname=trashbin.js
If /i "%extensionchoice%"=="11" SET extensionname=webnowplaying.js
If /i "%extensionchoice%"=="99" goto menu
cls
%LOCALAPPDATA%\spicetify\spicetify.exe config extensions %extensionname%
%LOCALAPPDATA%\spicetify\spicetify.exe apply
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *               The extension is now active                *
If /i "%selectedlanguage%"=="2" echo  *            L'extension est maintenant activ‚             *
echo  *                                                          *
echo  ************************************************************
If /i "%selectedlanguage%"=="1" echo Extension activated : %extensionname%
If /i "%selectedlanguage%"=="2" echo Extension activ‚ : %extensionname%
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:ErrorExtension
If /i "%selectedlanguage%"=="1" echo "%extensionchoice%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%extensionchoice%" n'est pas un num‚ro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto ActivateExtension

:ActivateCustomApp
cls
if not exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    goto SpicetifyNotInstalled
)
SET "appchoice="
SET "appname="
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *                   Activate a custom app                  *
If /i "%selectedlanguage%"=="2" echo  *              Activer une application custom              *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Which one do you want to activate?
If /i "%selectedlanguage%"=="2" echo Laquelle voulez-vous activer ?
echo 1 - Reddit
echo 2 - New Releases
echo 3 - Lyrics Plus
If /i "%selectedlanguage%"=="1" echo 99 - Back
If /i "%selectedlanguage%"=="2" echo 99 - Retour
echo.
If /i "%selectedlanguage%"=="1" SET /p appchoice="Your choice : "
If /i "%selectedlanguage%"=="2" SET /p appchoice="Votre choix : "
If %appchoice% NEQ 1 If %appchoice% NEQ 2 If %appchoice% NEQ 3 If %appchoice% NEQ 99 goto ErrorCustomApp
If /i "%appchoice%"=="1" SET appname=reddit
If /i "%appchoice%"=="2" SET appname=new-releases
If /i "%appchoice%"=="3" SET appname=lyrics-plus
If /i "%appchoice%"=="99" goto menu
%LOCALAPPDATA%\spicetify\spicetify.exe config custom_apps %appname%
%LOCALAPPDATA%\spicetify\spicetify.exe apply
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *             The custom app is now active                 *
If /i "%selectedlanguage%"=="2" echo  *       L'application custom est maintenant activ‚         *
echo  *                                                          *
echo  ************************************************************
If /i "%selectedlanguage%"=="1" echo  Custom app activated : %appname%
If /i "%selectedlanguage%"=="2" echo Application custom activ‚ : %appname%
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:EnableDevTool
cls
if not exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    goto SpicetifyNotInstalled
)
%LOCALAPPDATA%\spicetify\spicetify.exe enable-devtools
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *                DevTool is now active !                   *
If /i "%selectedlanguage%"=="2" echo  *           Le DevTool est maintenant actif !              *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu

:ErrorCustomApp
If /i "%selectedlanguage%"=="1" echo "%appchoice%" is not a valid number !
If /i "%selectedlanguage%"=="2" echo "%appchoice%" n'est pas un num‚ro valide !
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto ActivateCustomApp

:RestoreSpotify
cls
if not exist %LOCALAPPDATA%\spicetify\spicetify.exe (
    goto SpicetifyNotInstalled
)
%LOCALAPPDATA%\spicetify\spicetify.exe restore backup
cls
echo  ************************************************************
echo  *                                                          *
If /i "%selectedlanguage%"=="1" echo  *                   Spotify, the return  !                 *
If /i "%selectedlanguage%"=="2" echo  *                   Spotify, le retour !                   *
echo  *                                                          *
echo  ************************************************************
echo.
If /i "%selectedlanguage%"=="1" echo Press any key to return to the menu.
If /i "%selectedlanguage%"=="2" echo Appuyez sur une touche pour retourner au menu.
pause > nul
goto menu
