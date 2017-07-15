set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Extreme-Networks-Sales-Ops-%_my_datetime%.html
cd /d %~dp0
rem cucumber features --tags @so-opp,@all-users-rli,@SalesOps_Assets,@SalesOps_contacts,@SalesOps_cases --expand --format html --out %_filename%  UserRole="SalesOperationSit"
cucumber features --tags @so-opp-pro --expand --format html --out %_filename%  UserRole="SalesOperationSit"
