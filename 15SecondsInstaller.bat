@echo off
REM Datastream 2018, All rights reserved.
REM 15 Seconds ADB Installer Reborn V2.0

Title 15 Seconds ADB Installer V2.0
mode con:cols=80 lines=25

:SetRoot
set root=%cd%
cd %root%\Updater\bin
del CurrentVersion.txt
del UpdateVersion.txt
echo 2.0>>CurrentVersion.txt
echo 1.0.40>>CurrentVersion.txt
echo 11.0.0000.00000>>CurrentVersion.txt
if exist UpdatesInstalled.ds (
    GOTO UpdatesInstalled
) else (
    GOTO :UpdateCheck
)

:Splashscreen
TITLE 15 Seconds ADB Installer Reborn V2.0
color 97
cls
echo.�����������������������������������������������������������������������������ͻ
echo.�"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""�
echo.�"                                                                           "�
echo.�"                                                                           "�
echo.�"                                                                           "�
echo �"         ____  ____  _____  ____  ____  _____  ____  _____ ____  _         "�
echo �"        /  _ \/  _ \/__ __\/  _ \/ ___\/__ __\/  __\/  __//  _ \/ \__/|    "�
echo �"        | | \|| / \|  / \  | / \||    \  / \  |  \/||  \  | / \|| |\/||    "�
echo �"        | |_/|| |-||  | |  | |-||\___ |  | |  |    /|  /_ | |-||| |  ||    "�
echo �"        \____/\_/ \|  \_/  \_/ \|\____/  \_/  \_/\_\\____\\_/ \|\_/  \|    "�
echo �"                                                                           "�
echo.�"                                                                           "�
echo �"                   _     _  _      _  _____  _____ ____                    "�
echo �"                  / \   / \/ \__/|/ \/__ __\/  __//  _ \                   "�
echo �"                  | |   | || |\/||| |  / \  |  \  | | \|                   "�
echo �"                  | |_/\| || |  ||| |  | |  |  /_ | |_/|                   "�
echo �"                  \____/\_/\_/  \|\_/  \_/  \____\\____/                   "�
echo �"                                                                           "�
echo �"                                                                           "�
echo �"                                                                           "�
echo �"                                                                           "�
echo �"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""�
echo.�����������������������������������������������������������������������������ͼ
TIMEOUT /T 3 >nul

:MainMenu
cd %root%
mode con:cols=80 lines=25
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                        15 Seconds ADB Installer V2.0                        �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                   Welcome to the 15 seconds ADB installer!                  �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.� Installer Version: 2.0                                                      �
echo.�                                                                             �
echo.� Adb/Fastboot Version: 1.0.40                                                �
echo.�                                                                             �
echo.� Google Drivers Version: 11.0.0000.00000                                     �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 70 20 97 "Exit" 1 20 97 "XDA Forum" 35 20 97 "Next >" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL% EQU 1 exit
IF %ERRORLEVEL% EQU 2 GOTO XDA
IF %ERRORLEVEL% EQU 3 GOTO InstallADB

:XDA
start "" "https://forum.xda-developers.com/android/software-hacking/tool-15-adb-installer-reborn-v1-0-adb-t3854109"
GOTO MainMenu

:InstallADB
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                           15 Seconds ADB Installer                          �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                                                                             �
echo.�                         Install ADB system-wide?                            �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�    If you would like to install ADB for all users, choose yes.              �
echo.�                                                                             �
echo.�    If you would like to install ADB for you only, choose no.                �
echo.�                                                                             �
echo.�    If you would like to skip installing ADB, choose skip.                   �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%\Buttons
Call Button 72 20 97 "No" 1 20 97 "Yes" 35 20 97 "Skip" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL%==2 GOTO AddSytemWide
IF %ERRORLEVEL%==1 GOTO AddUserOnly
IF %ERRORLEVEL%==3 GOTO SkipADB

:AddSytemWide
cd C:\
if exist adb rd /s /q adb
MKDIR adb
cd %root%\adb
XCOPY /q /c /i "%root%\adb\*.*" "%SYSTEMDRIVE%\adb" >nul
TIMEOUT /T 1 >nul
SETX PATH "%PATH%;%SYSTEMDRIVE%\adb" /m >temp.ds
del temp.ds
set ADB=System-Wide.
GOTO InstallDrivers

:AddUserOnly
cd C:\Users\%USERNAME%\
if exist adb rd /s /q adb
mkdir adb
XCOPY /q /c /i "%root%\adb\*.*" "C:\Users\%USERNAME%\adb" >nul
TIMEOUT /T 1 >nul
SETX PATH "%PATH%;C:\Users\%USERNAME%\adb" /m >temp.ds
del temp.ds
set ADB=User Only.
GOTO InstallDrivers

:SkipADB
set ADB=Skipped.
GOTO InstallDrivers

:InstallDrivers
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                           15 Seconds ADB Installer                          �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                                                                             �
echo.�                          Install Google Drivers?                            �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�    If you do not install Google Drivers you will have to download the       �
echo.�                                                                             �
echo.�    drivers for your device from the device's manufature website. It is      �
echo.�                                                                             �
echo.�    recommended that you install Google Drivers for your device.             �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 72 20 97 "No" 1 20 97 "Yes" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL% EQU 1 GOTO NoDrivers
IF %ERRORLEVEL% EQU 2 GOTO GetOSType

:GetOSType
IF EXIST "C:\Program Files (x86)" (
GOTO Install64
) ELSE (
GOTO Install32
)

:Install32
cd %root%\driver
start /wait "" "DPInst_x86.exe"
set GoogleDrivers=Installed (x32)
GOTO Done

:Install64
cd %root%\driver
start /wait "" "DPInst_x64.exe"
set GoogleDrivers=Installed (x64)
GOTO Done

:NoDrivers
set GoogleDrivers=Not Installed.
GOTO Done

:Done
cls
color 97
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                           15 Seconds ADB Installer                          �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                                                                             �
echo.�                         Here is what we accomplished:                       �
echo.�                                                                             �
echo.�                  ����������������������������������������ͻ                 �
echo.�                  �                                        �                 �
echo.�                  �  ADB/Fastboot:                         �                 �
echo.�                  �                                        �                 �
echo.�                  ����������������������������������������ͼ                 �
echo.�                  ����������������������������������������ͻ                 �
echo.�                  �                                        �                 �
echo.�                  �  Google Drivers:                       �                 �
echo.�                  �                                        �                 �
echo.�                  ����������������������������������������ͼ                 �
echo.�����������������������������������������������������������������������������ͺ
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 39 15 97 "%GoogleDrivers%" 40 10 97 "%ADB%" 1 20 97 "About" 70 20 97 "Done" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL% EQU 1 GOTO InstallDrivers
IF %ERRORLEVEL% EQU 2 GOTO InstallADB
IF %ERRORLEVEL% EQU 3 GOTO About
IF %ERRORLEVEL% EQU 4 exit



:UpdateCheck
REM Datastream 2018, All rights reserved.
REM 15 Seconds ADB Installer Updater V2.0

cd %root%\Toast
Toast.exe  -t "15 Seconds ADB Installer Reborn" -m "Checking for updates on the server." -p "%root%\Toast\Icon.png"

cd %root%\Updater\bin
(
  Set /p InstallerCurrent=
  Set /p ADBCurrent=
  Set /p DriversCurrent=
) <CurrentVersion.txt
Del CurrentVersion.txt

wget.exe -O UpdateVersion.txt --no-check-certificate "https://drive.google.com/uc?export=download&id=15E-3UmShGcHGB1CEtzpw_hdhdOgy6z6e"
(
  Set /p InstallerUpdate=
  Set /p ADBUpdate=
  Set /p DriversUpdate=
) <UpdateVersion.txt
del UpdateVersion
if %InstallerUpdate% GTR %InstallerCurrent% GOTO UpdatesFound
if %ADBUpdate% GTR %ADBCurrent% GOTO UpdatesFound
if %DriversUpdate% GTR %DriversCurrent% GOTO UpdatesFound
GOTO NoUpdates

:UpdatesFound
mode con:cols=90 lines=37
cd %root%\Toast
Toast.exe  -t "15 Seconds ADB Installer Reborn" -m "Updates were found." -p "%root%\Toast\Icon.png"
cd %root%\Updater\bin
cls
echo.
echo.                                        Updates
echo. 
echo.������������������������������������������������������������������������������������������
echo.
echo  Installer:
echo.
echo  The Current Version of the installer is: %InstallerCurrent%, and the update version on the server is: %InstallerUpdate%.
echo.
echo.������������������������������������������������������������������������������������������
echo.
echo  ADB/Fastboot:
echo.
echo  The current version of ADB/Fastboot is: %ADBCurrent%, and the update found on the server is: %ADBUpdate%.
echo.
echo.������������������������������������������������������������������������������������������
echo.
echo  Google Drivers:
echo.
echo  The current version of Google Drivers is: %DriversCurrent%, and the update found on the server is: %DriversUpdate%.
echo.
echo.������������������������������������������������������������������������������������������
echo.
echo  Update Tasks:
echo.
if %InstallerUpdate% GTR %InstallerCurrent% echo  Installer will be updated from %InstallerCurrent% to %InstallerUpdate%.
echo.
if %ADBUpdate% GTR %ADBCurrent% echo  ADB will be updated from %ADBCurrent% to %ADBUpdate%.
echo.
if %DriversUpdate% GTR %DriversCurrent% echo  Drivers will be updated from %DriversCurrent% to %DriversUpdate%.
echo.������������������������������������������������������������������������������������������
echo.
echo                              Press "any" key to begin updating.
pause >nul

if %InstallerUpdate% GTR %InstallerCurrent% GOTO InstallUpdatetoInstaller
set Installer=No Update.
GOTO CheckADB

:InstallUpdatetoInstaller
set Installer=Version %InstallerUpdate% found.
wget.exe -O "15 Seconds ADB Installer.bat" --no-check-certificate "https://drive.google.com/uc?export=download&id=11X1LfZQPJtnqEWT7bUc2rOi1Qswg4MC_"
MOVE "15 Seconds ADB Installer.bat" "%root%"
GOTO CheckADB

:CheckADB
if %ADBUpdate% GTR %ADBCurrent% GOTO InstallUpdatetoADB
set ADB=No Update.
GOTO CheckDrivers


:InstallUpdatetoADB
set ADB=Version %ADBUpdate% found.
wget.exe -O "ADBUpdate.exe" --no-check-certificate "https://drive.google.com/uc?export=download&id=1YLJd8GTH2Y2dL08CWG0WVP9edRJ6Hnue"
start /wait "" "ADBUpdate.exe"
DEL ADBUpdate.exe
GOTO CheckDrivers


:CheckDrivers
if %DriversUpdate% GTR %DriversCurrent% GOTO InstallUpdatetoDrivers
set Drivers=No Update.
GOTO Cleanup

:InstallUpdatetoDrivers
set Drivers=Version %DriversUpdate% found.
wget.exe -O "DriversUpdate.exe" --no-check-certificate "https://drive.google.com/uc?export=download&id=14tzTesX7why643dcKH-7SEymwWlwaitc"
start /wait "" "DriversUpdate.exe"
DEL DriversUpdate.exe
GOTO Cleanup

:Cleanup
cd %root%\Updater\bin
echo UpdatesInstalled>UpdatesInstalled.ds
cd %root%\Toast
Toast.exe  -t "15 Seconds ADB Installer Reborn" -m "Updates have been downloaded and installed. The program will now close and reopen to apply the updates." -p "%root%\Toast\Icon.png"
cd %root%
start "" "15 Seconds ADB Installer.bat" & exit


:NoUpdates
cd %root%\Toast
Toast.exe  -t "15 Seconds ADB Installer Reborn" -m "No updates were found. You have the latest Driver, Installer, and Fastboot/ADB installed." -p "%root%\Toast\Icon.png"
TIMEOUT /T 3 >nul
cd %root%\Updater\bin\
Del UpdateVersion.txt >nul
del CurrentVersion.txt >nul
GOTO :Splashscreen


:UpdatesInstalled
cd %root%\Toast
Toast.exe  -t "15 Seconds ADB Installer Reborn" -m "Updates were successfully applied, you are now up to date." -p "%root%\Toast\Icon.png"
cd %root%\Updater\bin
del UpdatesInstalled.ds
cd %root%
GOTO Splashscreen

:About
color 97
cls
echo.�����������������������������������������������������������������������������ͻ
echo.�                                                                             �
echo.�                       15 Seconds ADB Installer Reborn                       �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�  Version 2.0 (Beta)                                                         �
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�  License Key: AN9U-BETA-0168-02 (Expires: N/A)                              �
echo.�                                                                             �
echo.�                                                                             �
echo.�  This work is protected by copywrite law and international treaties.        �
echo.�  Unauthorized reproduction or distribution of the program, or any portion   �
echo.�  of it, may result in severe civil and criminal penalties, and will be      �
echo.�  prosecuted to the maximum extent possible under law. You have been warned. �
echo.�                                                                             �
echo.�  Build Date: 12/8/2018 @3:44PM                                              �
echo.�����������������������������������������������������������������������������͹
echo.�                                                                             �
echo.�                                                                             �
echo.�                                                                             �
echo.�����������������������������������������������������������������������������ͼ
cd %root%
cd Buttons
Call Button 69 20 97 "Close" 1 7 97 "Licensed To: %USERNAME% (Personal License)" X _Box _hover
GetInput /M %_Box% /H 70
IF %ERRORLEVEL% EQU 1 exit
IF %ERRORLEVEL% EQU 2 GOTO About
exit

