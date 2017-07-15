set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Extreme-Networks-Sales-Manager-%_my_datetime%.html
cd /d %~dp0
rem cucumber features --tags @all-users-rli,@All-users-opp,@SalesMgr_Assets,@SalesMgr_contacts,@SalesMgr_cases --expand --format html --out %_filename%  UserRole='SalesManagerSit'
cucumber features --tags @sm-rli --expand --format html --out %_filename%  UserRole='SalesManagerSit'