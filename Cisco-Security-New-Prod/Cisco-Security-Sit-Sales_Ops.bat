set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Cisco-Security-Sales-Ops-%_my_datetime%.html
cd /d %~dp0
cucumber features --tags @SalesOps_RLI,@SalesOps_tasks,@so-Quote,@All_Users_account,@AllUser_cases,@All_Users_Contacs  --expand --format html --out %_filename%  UserRole="SalesOperationSit"