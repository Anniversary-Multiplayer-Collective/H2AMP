@echo off
setlocal enabledelayedexpansion

rem start time
for /f "tokens=1-3 delims=:." %%a in ("%TIME%") do (
    set /a start=%%a*3600 + %%b*60 + %%c
)

cd Release_x64_Dev
type ..\Halo_2.cmds|tagtool.exe

rem end time
for /f "tokens=1-3 delims=:." %%a in ("%TIME%") do (
    set /a end=%%a*3600 + %%b*60 + %%c
)

set /a elapsed=end-start
set /a minutes=elapsed/60
set /a seconds=elapsed%%60

if %seconds% lss 10 set seconds=0%seconds%

echo Time taken: %minutes%:%seconds%

pause
