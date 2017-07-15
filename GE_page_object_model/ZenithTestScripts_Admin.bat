rem Get date time to set in filename
set "param1=%1"
rem set "param2=%2"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
rem if "!param2!"=="" ( set tagname=@SuccessPlanFeature ) else (set tagname=%param2%)
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
rem set filename for results file
set _filename=Result\GE_Admin_%_my_datetime%.html
rem set _errfilename=temp\result%_my_datetime%.html

rem navigage to the directory where the batch file and scripts exists
cd /d %~dp0
cucumber features --tags @opp-all-users,@quotes-all-users,@asset-all-users,@account-all-users,@case-all-users,@contact-all-users --format html --out %_filename%  UserRole='adminsit'
