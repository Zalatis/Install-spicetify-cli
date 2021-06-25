@echo off
cls
Title AdsManager, Script made by Zalati
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
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

:DisableAdsMenu
cls
echo *************************************************
echo *                                               *
echo *             AdsManager by Zalati              *
echo *                                               *
echo *************************************************
echo.
echo What do you want to do ?
echo 1 - Disable ads
echo 1 - Reactivate ads
echo.
SET /p reponse4="Your choice : "
If /i "%reponse4%"=="1" GOTO DisableAds
If /i "%reponse4%"=="2" GOTO RestoreAds
ECHO "%reponse4%" is not a valid number !
echo Press any key to return to the menu.
pause > nul
GOTO DisableAdsMenu

:DisableAds
cls
echo *************************************************
echo *                                               *
echo *            Closing Spotify.exe...             *
echo *                                               *
echo *************************************************
tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F
cls
echo *************************************************
echo *                                               *
echo * Back up of the current Windows Hosts file...  *
echo *                                               *
echo *************************************************
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts.backup copy %SystemRoot%\system32\drivers\etc\hosts %SystemRoot%\system32\drivers\etc\hosts.backup
cls
echo *************************************************
echo *                                               *
echo *       Adding domains to the hosts file...     *
echo *                                               *
echo *************************************************
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -command "Start-BitsTransfer -Source https://raw.githubusercontent.com/x0uid/SpotifyAdBlock/master/hosts -Destination %HOMEPATH%\Downloads\SpotifyHosts"
echo.>>"%SystemRoot%\system32\drivers\etc\hosts"
type "%HOMEPATH%\Downloads\SpotifyHosts">>"%SystemRoot%\system32\drivers\etc\hosts"
del /S /F /Q "%HOMEPATH%\Downloads\SpotifyHosts"
cls
echo *************************************************
echo *                                               *
echo *              DNS Cache Renewal ...            *
echo *                                               *
echo *************************************************
ipconfig /flushdns
cls
echo *************************************************
echo *                                               *
echo *           Starting Spotify.exe...             *
echo *                                               *
echo *************************************************
IF NOT EXIST %appdata%\Spotify\Spotify.exe echo Notice: Spotify.exe not found, run it manually.
IF EXIST %appdata%\Spotify\Spotify.exe start %appdata%\Spotify\Spotify.exe
del /S /F /Q "%HOMEPATH%\Downloads\AdsManager.bat"
cls
echo *************************************************
echo *                                               *
echo *        Spotify ads have been blocked          *
echo *                                               *
echo *************************************************
echo.
echo Press any key to close this tab.
pause > nul
cls
exit

:RestoreAds
echo *************************************************
echo *                                               *
echo *            Closing Spotify.exe...             *
echo *                                               *
echo *************************************************
tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F
cls
echo *************************************************
echo *                                               *
echo *          Deleting the hosts file...           *
echo *                                               *
echo *************************************************
del /S /F /Q "%SystemRoot%\system32\drivers\etc\hosts"
cls
echo *************************************************
echo *                                               *
echo *           Restoring the hosts file...         *
echo *                                               *
echo *************************************************
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts copy %SystemRoot%\system32\drivers\etc\hosts.backup %SystemRoot%\system32\drivers\etc\hosts
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts.backup echo # Copyright (c) 1993-2009 Microsoft Corp. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # This is a sample HOSTS file used by Microsoft TCP/IP for Windows. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # This file contains the mappings of IP addresses to host names. Each >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # entry should be kept on an individual line. The IP address should >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # be placed in the first column followed by the corresponding host name. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # The IP address and the host name should be separated by at least one >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # space. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # Additionally, comments (such as these) may be inserted on individual >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # lines or following the machine name denoted by a '#' symbol. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # For example: >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #      102.54.94.97     rhino.acme.com          # source server >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #       38.25.63.10     x.acme.com              # x client host >>"%SystemRoot%\system32\drivers\etc\hosts" & echo # localhost name resolution is handle within DNS itself. >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #       127.0.0.1       localhost >>"%SystemRoot%\system32\drivers\etc\hosts" & echo #       ::1             localhost >>"%SystemRoot%\system32\drivers\etc\hosts"
echo *************************************************
echo *                                               *
echo *       Removing the backup hosts file...       *
echo *                                               *
echo *************************************************
del /S /F /Q "%SystemRoot%\system32\drivers\etc\hosts.backup"
cls
echo *************************************************
echo *                                               *
echo *              DNS Cache Renewal...             *
echo *                                               *
echo *************************************************
ipconfig /flushdns
cls
echo *************************************************
echo *                                               *
echo *           Starting Spotify.exe...             *
echo *                                               *
echo *************************************************
IF NOT EXIST %appdata%\Spotify\Spotify.exe echo Notice: Spotify.exe not found, run it manually.
IF EXIST %appdata%\Spotify\Spotify.exe start %appdata%\Spotify\Spotify.exe
del /S /F /Q "%HOMEPATH%\Downloads\AdsManager.bat"
cls
echo *************************************************
echo *                                               *
echo *              Restoring ads done               *
echo *                                               *
echo *************************************************
echo Press any key to close this tab.
pause > nul
cls
exit