set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Alcon-OpsManager-HTML-Report-%_my_datetime%.html
cd /d %~dp0@create_data
#cucumber features --tags @CreateData,@All-Users_Tasks,@All-Users_Contacts,@All-Users_Leads,@All-Users_Cases,@All-Users_Accounts,@All-Users_Opportunity --expand  --format html --out %_filename% UserRole='opsmgrsit'
cucumber features --tags @All-Users_Opportunity --expand  --format html --out %_filename% UserRole='opsmgrsit'
#cucumber features --tags @All-Users_Cases,@Admin_general,@All-Users_Accounts --expand  --format html --out %_filename% UserRole='opsmgrsit'