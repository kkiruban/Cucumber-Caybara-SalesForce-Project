set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\schneider-Ops-Rep-%_my_datetime%.html
cd /d %~dp0
REM cucumber features --tags @or-rlt,@All-Users-Opportunity,@opsrep-asset --expand --format html --out %_filename%  UserRole="SchneiderOperationRepSit"
cucumber features --tags @OpsRep_accounts --expand --format html --out %_filename%  UserRole="SchneiderOperationRepSit"