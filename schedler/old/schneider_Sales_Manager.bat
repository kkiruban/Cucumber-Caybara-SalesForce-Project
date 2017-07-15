set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\schneider-Sales-Manager-%_my_datetime%.html
cd /d %~dp0
REM cucumber features --tags @sm-rlt,@All-Users-Opportunity,@salesmanager-asset --expand --format html --out %_filename%  UserRole='SchneiderSalesManagerSit'
cucumber features --tags @SalesMgr_cases --expand --format html --out %_filename%  UserRole='SchneiderSalesManagerSit'