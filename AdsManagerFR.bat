@echo off
Title AdsManager, Script made by Zalati
REM  --> Verification des permissions admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> Si error flag, pas les droits admins.
if '%errorlevel%' NEQ '0' (
    echo Demande des droits administrateur en cours...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
:menu
cls
::Menu bloqueur de pubs
:DisableAdsMenu
cls
echo Que voulez-vous faire ? (Repondez avec le numero) : 
echo 1 - Desactiver les pubs
echo 2 - Reactiver les pubs
echo.
SET /p reponse4="Votre choix : "
If /i "%reponse4%"=="1" GOTO DisableAds
If /i "%reponse4%"=="2" GOTO RestoreAds
ECHO "%reponse4%" n'est pas valide !
GOTO :error4

:DisableAds
cls
echo *************************************************
echo *         Fermeture de Spotify.exe...           *
echo *************************************************
tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F
cls
echo *************************************************
echo * Back up du fichier Windows Hosts en cours...  *
echo *************************************************
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts.backup copy %SystemRoot%\system32\drivers\etc\hosts %SystemRoot%\system32\drivers\etc\hosts.backup
cls
echo *************************************************
echo *     Ajout des domaines au fichier host...     *
echo *************************************************
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://raw.githubusercontent.com/x0uid/SpotifyAdBlock/master/hosts -Destination C:\%HOMEPATH%\Downloads\SpotifyHosts"
echo.>>"%SystemRoot%\system32\drivers\etc\hosts"
type "C:\%HOMEPATH%\Downloads\SpotifyHosts">>"%SystemRoot%\system32\drivers\etc\hosts"
cls
echo *************************************************
echo *        Renouvellement du Cache DNS ...        *
echo *************************************************
ipconfig /flushdns
cls
echo *************************************************
echo *         Lancement de Spotify.exe...           *
echo *************************************************
IF NOT EXIST %appdata%\Spotify\Spotify.exe echo Notice: Spotify.exe introuvable, lancez le manuellement.
IF EXIST %appdata%\Spotify\Spotify.exe start %appdata%\Spotify\Spotify.exe
del "C:\%HOMEPATH%\Downloads\AdsManagerFR.bat" /S /F /Q
cls
echo *************************************************
echo *                                               *
echo *      Les pubs Spotify ont ete bloques         *
echo *                                               *
echo *************************************************
echo.
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
goto menu

:RestoreAds
echo *************************************************
echo *         Fermeture de Spotify.exe...           *
echo *************************************************
tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F
cls
echo *************************************************
echo *        Suppresion du fichier hosts...         *
echo *************************************************
del "%SystemRoot%\system32\drivers\etc\hosts" /S /F /Q
cls
echo *************************************************
echo *        Restauration du fichier hosts...       *
echo *************************************************
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts copy %SystemRoot%\system32\drivers\etc\hosts.backup %SystemRoot%\system32\drivers\etc\hosts
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts.backup echo # Copyright (c) 1993-2009 Microsoft Corp. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # This is a sample HOSTS file used by Microsoft TCP/IP for Windows. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # This file contains the mappings of IP addresses to host names. Each >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # entry should be kept on an individual line. The IP address should >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # be placed in the first column followed by the corresponding host name. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # The IP address and the host name should be separated by at least one >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # space. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # Additionally, comments (such as these) may be inserted on individual >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # lines or following the machine name denoted by a '#' symbol. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # For example: >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #      102.54.94.97     rhino.acme.com          # source server >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #       38.25.63.10     x.acme.com              # x client host >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # localhost name resolution is handle within DNS itself. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #       127.0.0.1       localhost >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #       ::1             localhost >>"%SystemRoot%\system32\drivers\etc\hosts"
echo *************************************************
echo *     Suppresion du fichier backup hosts...     *
echo *************************************************
del "%SystemRoot%\system32\drivers\etc\hosts.backup" /S /F /Q
cls
echo *************************************************
echo *        Renouvellement du Cache DNS ...        *
echo *************************************************
ipconfig /flushdns
cls
echo *************************************************
echo *         Lancement de Spotify.exe...           *
echo *************************************************
IF NOT EXIST %appdata%\Spotify\Spotify.exe echo Notice: Spotify.exe introuvable, lancez le manuellement.
IF EXIST %appdata%\Spotify\Spotify.exe start %appdata%\Spotify\Spotify.exe
del "C:\%HOMEPATH%\Downloads\AdsManagerFR.bat" /S /F /Q
cls
echo *************************************************
echo *                                               *
echo *          Restauration des pubs fini           *
echo *                                               *
echo *************************************************
echo Appuyez sur une touche pour fermer cet onglet.
pause > nul
cls
exit

::Erreur
:error4
echo Appuyez sur une touche pour retourner au menu.
pause > nul
cls
GOTO DisableAdsMenu
