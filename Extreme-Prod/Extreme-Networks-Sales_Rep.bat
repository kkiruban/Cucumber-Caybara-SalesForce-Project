set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Extreme-Networks-Sales-Rep-%_my_datetime%.html
cd /d %~dp0
rem cucumber features --tags @all-users-rli,@All-users-opp,@SalesRep_Assets,@SalesRep_contacts,@SalesRep_cases  --expand --format html --out %_filename%  UserRole="SalesRepSit"
cucumber features --tags @sr-rli --expand --format html --out %_filename%  UserRole="SalesRepSit"
