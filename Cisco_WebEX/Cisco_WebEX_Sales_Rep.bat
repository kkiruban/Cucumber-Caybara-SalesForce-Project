set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Cisco-Webex-Sales-Rep-%_my_datetime%.html
cd /d %~dp0
cucumber features --tags @SalesRep_opportunity,@SalesRep_task,@SalesRep_cases,@SalesRep_Account,@SalesRep_Account_1,@SalesRep_contacts  --expand --format html --out %_filename%  UserRole="salesrepsit"