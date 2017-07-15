set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Cisco-WebEX-Admin-HTML-Report-%_my_datetime%.html
cd /d %~dp0
REM cucumber features --tags @Admin_task,@Admin_general,@Admin_others,@Admin_Account --expand  --format html --out %_filename% UserRole='Admin'
cucumber features --tags @Admin_general --expand  --format html --out %_filename% UserRole='Admin'