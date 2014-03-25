@echo off
set daysofweek=Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday  
for /F "skip=2 tokens=2-4 delims=," %%A in ('WMIC Path Win32_LocalTime Get DayOfWeek /Format:csv') do set daynumber=%%A  
for /F "tokens=%daynumber% delims=," %%B in ("%daysofweek%") do set day=%%B

if %daynumber% lss 6 (
    set file=workday.txt
) else (
    set file=weekend.txt
)

for /f "delims=," %%g in (%file%) do (
        rem "run command"
        start "" "%%g"
        rem "sleep 1 second"
        ping 1.1.1.1 -n 1 -w 1000 > nul
)
