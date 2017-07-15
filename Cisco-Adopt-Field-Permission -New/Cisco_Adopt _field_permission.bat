set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Cisco-Adopt-field-permission-%_my_datetime%.html
cd /d %~dp0
cucumber features --tags @survey-response-field-permission,@contact-field-permission,@service-contracts-field-permission,@tasks-field-permission,@cases_field_permission --expand --format html --out %_filename%