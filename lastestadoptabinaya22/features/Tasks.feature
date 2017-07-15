@cisco @mytasks
Feature:
  In order to validate tasks section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @US-003565 @nalaSalesRep_task_1 @nalaSalesMgr_task_1 @nalaOpsRep_task_1 @nalaOpsMgr_task_1
  Scenario: US-003565 lead task configuration
    Given I click on new button under my task section
    And I select "Task - Lead" from record type of new record
    And I check "Sub Task Type" drop down field is visible and editable
    And I check the sub task type picklist value
    And I check "Product" drop down field is visible and editable
    And I check product picklist values under task information section
    And I check "Lead ID" field is visible and editable
    Then I check whether lead id field accepts text
    And I check "SREV Amount" field is visible and editable
    Then I check srev amount field accepts numeric
    And I check "Cisco Amount" field is visible and editable
    Then I check cisco amount field accepts numeric
    And I should navigate to "Home" tab
    When I click on new button under my task section
    And I select "Task - Lead" from record type of new record
    When I enter value to all the mandatory fields
    Then I click on "Save" button from top row
    And I logout from the current user
    When I login as "sales ops"
    And I click on any existing "Task - Lead" link in my task section
    And I check whether "Sub Task Type" field is visible and read only
    And I check whether "Product" field is visible and read only
    And I check "Lead ID" field is visible and read only
    And I check "SREV Amount" field is visible and read only
    And I check "Cisco Amount" field is visible and read only

  @US-003564 @nalaSalesRep_task_1 @nalaSalesMgr_task_1 @nalaOpsRep_task_1 @nalaOpsMgr_task_1
  Scenario: US-003564 health check task configuration
    Given I click on new button under my task section
    And I select "Task - Health Check" from record type of new record
    And I check "Contact" is visible and editable
    And I check that contact field is a look up field
    And I check "Product" drop down field is visible and editable
    Then I check product picklist values under task information section
    And I check "SREV Health Score" is visible or not
    Then I check srev health score is a numeric field and non editable
    And I check "Cisco Health Score" is visible or not
    Then I check cisco health score is a numeric field and non editable
    And I check "Inhibitors" is visible or not
    Then I check that inhibitors field is a multi select picklist and non editable
    And I check "Desired Outcomes" is visible or not
    Then I whether desired outcomes field is a multi select picklist and non editable
    And I check "Achieved Outcomes" is visible or not
    Then I whether achieved outcomes fiels is a multi select picklist and non editable
    And I check "Features" is visible or not
    Then I whether features is a multi select picklist and non editable
    And I check "At Risk Reason" is visible or not
    Then I check whether at risk reason field is picklist and non editable
    And I check "Customer Sentiment" is visible or not
    Then I check whether customer sentiment field is picklist and non editable
    And I check "SREV Health Status" is visible or not
    Then I whether cisco health staus field is picklist and non editable
    And I check "Health Check #" is visible or not
    Then I check whether health check field is picklist and non editable
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    When I click on any existing "Task-HealthCheck" link
    #    Then I click on "Edit" button from top row
    #    And I check "Qualtrics Link" field is visible
    #    Then I check that qualtrics link is a url type and not editable
    And I should navigate to "Home" tab
    And I click on new button under my task section
    And I select "Task - Health Check" from record type of new record
    And I enter value to all the mandatory fields
    Then I click on "Save" button from top row
    And I logout from the current user
    Then I login as "sales ops"
    When I click on any existing "Task - Health Check" link in my task section
    And I check whether "Product" field is visible and read only
    And I check whether "Contact" field is visible and read only
    And I check "Qualtrics Link" field is visible and read only
    And I check that "SREV Health Score" field is visible and read only
    And I check that "Cisco Health Score" field is visible and read only
    And I check that "Inhibitors" field is visible and read only
    And I check that "Desired Outcomes" field is visible and read only
    And I check that "Achieved Outcomes" field is visible and read only
    And I check that "Features" field is visible and read only
    And I check that "At Risk Reason" field is visible and read only
    And I check that "Customer Sentiment" field is visible and read only
    And I check that "Health Check #" field is visible and read only
    And I logout from the current user
    And I login as "admin"
    When I click on new button under my task section
    Then I select "Task - Health Check" from record type of new record
    And I check product picklist values under task information section
    And I check inhibitors field value
    And I check desired outcomes field value
    And I check achieved outcomes field value
    And I check features field value
    And I check at risk reason field value
    And I check customer sentiment field value
    And I check srev health status field value
    And I check cisco health status field value
    And I check health check field value

  @US-003559_1 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003559 validation rules lead id required
    Given I click on new button under my task section
    And I select "Task - Lead" from record type of new record
    Then I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    When I click on any existing "Task-Lead" link
    #    And I click on "Edit" button from top row
    When I delete lead id value from task details section
    And I select "Completed Successfully" from status picklist field
    Then I click on "Save" button from task page
    And I update lead id with value
    And I update sub task type field
    And I select "Completed Successfully" from status picklist field
    Then I click on "Save" button from top row
    Given I should navigate to "Home" tab
    When I click on new button under my task section
    And I select "Task - Lead" from record type of new record
    Then I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    When I click on any existing "Task-Lead" link
    #    And I click on "Edit" button from top row
    When I update task subtype with a value
    And I select "Completed Successfully" from status picklist field
    Then I click on "Save" button from top row

  @US-003559_2 @nalaAdmin_task_1
  Scenario: US-003559 validation rules lead id required
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    And I enter data to all the mandatory fields except srev health score
    Then I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on any existing "Task-HealthCheck" link
    #    And I click on "Edit" button from top row
    And I select "Completed Successfully" from status picklist field
    Then I click on "Save" button which should fail

  @US-003588 @nalaAdmin_task_1
  Scenario: US-003588 cisco health status picklist
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I check cisco health status picklist value

  @US-003589 @nalaAdmin_task_1
  Scenario: US-003589 health check url
    Given I click on new button under my task section
    And I select "Task - Health Check" from record type of new record
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    And I should navigate to "Home" tab
    When I click on any one of the existing "Task-HealthCheck" link
    And I click on "Create Follow-up CSM Task" button from top row
    And I click on continue button
    Then I click on "Cancel" button from top row
    Then I click on "Edit" button from top row
    And I select "Completed Unsuccessfully" from status picklist field
    Then I click on "Save" button from top row
    And I click on "Create Follow-up CSM Task" button from top row

  @US-003611 @nalaOpsMgr_task_1 @nalaSalesRep_task_1 @nalaSalesMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003611 remove buttons and fields from all task page layouts
    Given I click on new button under my task section
    And I select "Task - Health Check" from record type of new record
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    And I should navigate to "Home" tab
    When I click on any one of the existing "Task-HealthCheck" link
    And I check that "Create Follow-Up Event" button is not available
    And I check that "Create Follow-up CSM Task" button should be available
    And I check that "Play" field is not available under CSM Details section
    And I check that "Play Status" field is not available under CSM Details section
    And I check that "Play Enter Date" field is not available under CSM Details section
    And I check that "Play Exit Date" field is not available under CSM Details section
    And I check that "Success Plan" field is not available under CSM Details section
    Then I check that "Task State" field is available under CSM Details section
    Then I check that "Success Plan Play" field is available under CSM Details section
    Then I check that "Success Plan Display Name" field is available under CSM Details section
    Then I check that "Play Task Count" field is available under CSM Details section

  @US-003563_1 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003563 standard email fax pone task configuration
    Given I click on new button under my task section
    And I select "Task - Standard" from record type of new record
    And I check product field is visible under task information section
    Then I check product picklist values under task information section
    And I check escaltion field is visible or not
    Then I check whether the type of escalation field is checkbox and editable
    And I check status picklist values
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row

  @US-003635 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003635 srev amount field should be required via a validation rule
    Given I click on new button under my task section
    When I select "Task - Lead" from record type of new record
    And I check that "SREV Amount" field is visible under task details section
    And I check that "SREV Amount" field is a mandatory field
    And I enter data to all the mandatory fields
    And I check that valut for srev amount is not populated
    Then I click on "Save" button which should fail

  @US-003637 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003637 health check field on the task record needs to be editble
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    And I check that health check field is editable

  @US-003651 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003651 task phone calls task record type needs to be removed
    Given I click on new button under my task section
    Then I check that task phone calls task record type is removed from the list of tasks

  @US-003617-1 @nalaSalesRep_task2 @nalaSalesMgr_task2 @nalaOpsRep_task2 @nalaOpsMgr_task2
  Scenario: US-003617 Add rule for Task object
    Then I should see content "My Tasks"
    When I click on new button under my task section
    Then I should see the following:
      """
      New Task
      Select Task Record Type
      """
    When I select "Task - Health Check" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I fill mandatory fields to create a new task with record type task health check
    And I click on "Save" button from top row
    #    And I click on home tab
    And I wait for 5 seconds
    And I click on task health check just created
    And I click on "Edit" button from top row
    And I wait for 5 seconds
    And I select "Completed Successfully" from status picklist field
    And I click on Save button from top row

  #    Then I should see content "The following fields cannot be blank: Health Check #"
  #    And I should see content "The following fields cannot be blank: SREV Health Score."
  @US-003618 @nalaSalesRep_task2 @nalaSalesMgr_task2 @nalaOpsRep_task2 @nalaOpsMgr_task2
  Scenario: US-003618 added set play outcome button to all task page layout
    Then I should see content "My Tasks"
    When I click on new button under my task section
    Then I should see the following:
      """
      New Task
      Select Task Record Type
      """
    When I select "Task - Health Check" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I fill mandatory fields to create a new task with record type task health check
    And I click on "Save" button from top row
    And I wait for 5 seconds
    And I click on task health check just created
    Then I should see set play outcome buttton

  @US-003618-l @nalaSalesRep_task2 @nalaSalesMgr_task2 @nalaOpsRep_task2 @nalaOpsMgr_task2
  Scenario: US-003618 added set play outcome button to all task page layouts
    Then I should see content "My Tasks"
    When I click on new button under my task section
    Then I should see the following:
      """
      New Task
      Select Task Record Type
      """
    When I select "Task - Lead" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I fill mandatory fields to create a new task with record type task lead
    And I click on "Save" button from top row
    And I wait for 5 seconds
    And I click on task lead just created
    Then I should see set play outcome buttton

  @US-003618 @nalaSalesRep_task2 @nalaSalesMgr_task2 @nalaOpsRep_task2 @nalaOpsMgr_task2
  Scenario: US-003618 added set play outcome button to all task page layouts
    Then I should see content "My Tasks"
    When I click on new button under my task section
    Then I should see the following:
      """
      New Task
      Select Task Record Type
      """
    When I select "Task - Standard" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I fill mandatory fields to create a new task with record type task standard
    And I click on "Save" button from top row
    And I wait for 5 seconds
    And I click on task standard just created
    Then I should see set play outcome buttton

  #  @US-003618 @nalaSalesRep_task2 @nalaSalesMgr_task2 @nalaOpsRep_task2 @nalaOpsMgr_task2
  #  Scenario: US-003618 added set play outcome button to all task page layouts
  #    Then I should see content "My Tasks"
  #    When I click on new button under my task section
  #    Then I should see the following:
  #      """
  #      New Task
  #      Select Task Record Type
  #      """
  #    When I select "Task - Phone Calls" from record type of new record
  #    Then I should see the following:
  #      """
  #      Task
  #      New Task
  #      """
  #    When I fill mandatory fields to create a new task with record type task phone calls
  #    And I click on "Save" button from top row
  #    And I wait for 5 seconds
  #    And I click on task phone calls just created
  #    Then I should see set play outcome buttton
  @US-003628 @nalaSalesRep_task2 @nalaSalesMgr_task2 @nalaOpsRep_task2 @nalaOpsMgr_task2
  Scenario: US-003618 Created new rule Task Status Completed Custom
    Then I should see content "My Tasks"
    When I click on existing task under my tasks section
    And I click on "Edit" button from top row
    And I wait for 5 seconds
    And I select "Completed Successfully" from status picklist field
    And I click on Save button from top row

  #    Then I should see content "The following fields cannot be blank: Health Check #"
  #    And I should see content "The following fields cannot be blank: SREV Health Score."
  @US-003570_1 @nalaSalesRep_task3 @nalaSalesMgr_task3 @nalaOpsRep_task3 @nalaOpsMgr_task3
  Scenario: US-003570 Task Process Builder
    When I logout from the current user
    And I login as "admin"
    And I create a random account
    And I get account name just created
    And I get the account id that generated
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I should navigate to "Accounts" tab
    When I search and click on just created account
    And I note the value of "SNTC SREV Health Score" field under sntc section
    And I note the value of "SNTC Features" field under sntc section
    And I note the value of "SNTC Cisco Health Score" field under sntc section
    And I note the value of "SNTC At Risk Reason" field under sntc section
    And I note the value of "SNTC Inhibitors" field under sntc section
    And I note the value of "SNTC Customer Sentiment" field under sntc section
    And I note the value of "SNTC Desired Outcomes" field under sntc section
    And I note the value of "SNTC Customer Success Story" field under sntc section
    And I note the value of "SNTC Achieved Outcomes" field under sntc section
    And I note the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "SNTC Cisco Health Status" field under sntc section
    And I note the value of "SNTC SREV Health Status" field under sntc section
    #    When I search and click on just created account
    And I click on new task button under open activities section
    And I select "Task - Health Check" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I select "SNTC" from product field picklist under task information
    And I enter comments and subject under task details
    And I wait for 5 seconds
    And I choose contact name under task information
    And I click on "Save" button from top row
    And I get the task id that generated
    And I logout from the current user
    And I login as "admin"
    And I wait for 5 seconds
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I enter value for "SREV Health Score" field under health check details section
    And I enter value for "Cisco Health Score" field under health check details section
    And I enter value for "Inhibitors" field under health check details section
    And I enter value for "Achieved Outcomes" field under health check details section
    And I enter value for "Desired Outcomes" field under health check details section
    And I enter value for "Features" field under health check details section
    And I enter value for "At Risk Reason" field under health check details section
    And I enter value for "Customer Sentiment" field under health check details section
    And I enter value for "SREV Health Status" field under health check details section
    And I enter value for "Cisco Health Status" field under health check details section
    And I enter value for "Health Check#" field under health check details section
    Then I click on "Save" button from top row
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I wait for 5 seconds
    And I select "Completed Successfully" from status picklist field
    And I click on Save button from top row
    And I wait for 5 seconds
    Then I should see content "Task Detail"
    And I should see content "Task Information"
    When I click on account Name from related to field
    And I review the value of "SNTC SREV Health Score" field under sntc section
    And I review the value of "SNTC Cisco Health Score" field under sntc section
    And I review the value of "SNTC Inhibitors" field under sntc section
    And I review the value of "NTC Achieved Outcomes" field under sntc section
    And I review the value of "SNTC Desired Outcomes" field under sntc section
    And I review the value of "SNTC Features" field under sntc section
    And I review the value of "SNTC At Risk Reason" field under sntc section
    And I review the value of "SNTC Customer Sentiment" field under sntc section
    And I review the value of "SNTC SREV Health Status" field under sntc section
    And I review the value of "SNTC Cisco Health Status" field under sntc section
    And I review the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "NOS SREV Health Score" field under nos section
    And I note the value of "NOS Cisco Health Score" field under nos section
    And I note the value of "NOS Inhibitors" field under nos section
    And I note the value of "NOS Achieved Outcomes" field under nos section
    And I note the value of "NOS Desired Outcomes" field under nos section
    And I note the value of "NOS Features" field under nos section
    And I note the value of "NOS At Risk Reason" field under nos section
    And I note the value of "NOS Customer Sentiment" field under nos section
    And I note the value of "NOS SREV Health Status" field under nos section
    And I note the value of "NOS Cisco Health Status" field under nos section
    And I note the value of "NOS Last Health Status" field under nos section

  @US-003570_2 @nalaSalesRep_task3 @nalaSalesMgr_task3 @nalaOpsRep_task3 @nalaOpsMgr_task3
  Scenario: US-003570 Task Process Builder
    When I logout from the current user
    And I login as "admin"
    And I create a random account
    And I get account name just created
    And I get the account id that generated
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I should navigate to "Accounts" tab
    When I search and click on just created account
    And I note the value of "SNTC SREV Health Score" field under sntc section
    And I note the value of "SNTC Features" field under sntc section
    And I note the value of "SNTC Cisco Health Score" field under sntc section
    And I note the value of "SNTC At Risk Reason" field under sntc section
    And I note the value of "SNTC Inhibitors" field under sntc section
    And I note the value of "SNTC Customer Sentiment" field under sntc section
    And I note the value of "SNTC Desired Outcomes" field under sntc section
    And I note the value of "SNTC Customer Success Story" field under sntc section
    And I note the value of "SNTC Achieved Outcomes" field under sntc section
    And I note the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "SNTC Cisco Health Status" field under sntc section
    And I note the value of "SNTC SREV Health Status" field under sntc section
    #    When I search and click on just created account
    And I click on new task button under open activities section
    And I select "Task - Health Check" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I select "NOS" from product field picklist under task information
    And I enter comments and subject under task details
    And I wait for 5 seconds
    And I choose contact name under task information
    And I click on "Save" button from top row
    And I get the task id that generated
    And I logout from the current user
    And I login as "admin"
    And I wait for 5 seconds
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I enter value for "SREV Health Score" field under health check details section
    And I enter value for "Cisco Health Score" field under health check details section
    And I enter value for "Inhibitors" field under health check details section
    And I enter value for "Achieved Outcomes" field under health check details section
    And I enter value for "Desired Outcomes" field under health check details section
    And I enter value for "Features" field under health check details section
    And I enter value for "At Risk Reason" field under health check details section
    And I enter value for "Customer Sentiment" field under health check details section
    And I enter value for "SREV Health Status" field under health check details section
    And I enter value for "Cisco Health Status" field under health check details section
    And I enter value for "Health Check#" field under health check details section
    Then I click on "Save" button from top row
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I wait for 5 seconds
    And I select "Completed Successfully" from status picklist field
    And I click on Save button from top row
    And I wait for 5 seconds
    Then I should see content "Task Detail"
    And I should see content "Task Information"
    When I click on account Name from related to field
    And I review the value of "SNTC SREV Health Score" field under sntc section
    And I review the value of "SNTC Cisco Health Score" field under sntc section
    And I review the value of "SNTC Inhibitors" field under sntc section
    And I review the value of "NTC Achieved Outcomes" field under sntc section
    And I review the value of "SNTC Desired Outcomes" field under sntc section
    And I review the value of "SNTC Features" field under sntc section
    And I review the value of "SNTC At Risk Reason" field under sntc section
    And I review the value of "SNTC Customer Sentiment" field under sntc section
    And I review the value of "SNTC SREV Health Status" field under sntc section
    And I review the value of "SNTC Cisco Health Status" field under sntc section
    And I review the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "NOS SREV Health Score" field under nos section
    And I note the value of "NOS Cisco Health Score" field under nos section
    And I note the value of "NOS Inhibitors" field under nos section
    And I note the value of "NOS Achieved Outcomes" field under nos section
    And I note the value of "NOS Desired Outcomes" field under nos section
    And I note the value of "NOS Features" field under nos section
    And I note the value of "NOS At Risk Reason" field under nos section
    And I note the value of "NOS Customer Sentiment" field under nos section
    And I note the value of "NOS SREV Health Status" field under nos section
    And I note the value of "NOS Cisco Health Status" field under nos section
    And I note the value of "NOS Last Health Status" field under nos section

  @US-003570_3 @nalaSalesRep_task3 @nalaSalesMgr_task3 @nalaOpsRep_task3 @nalaOpsMgr_task3
  Scenario: US-003570 Task Process Builder
    When I logout from the current user
    And I login as "admin"
    And I create a random account
    And I get account name just created
    And I get the account id that generated
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I should navigate to "Accounts" tab
    When I search and click on just created account
    And I note the value of "SNTC SREV Health Score" field under sntc section
    And I note the value of "SNTC Features" field under sntc section
    And I note the value of "SNTC Cisco Health Score" field under sntc section
    And I note the value of "SNTC At Risk Reason" field under sntc section
    And I note the value of "SNTC Inhibitors" field under sntc section
    And I note the value of "SNTC Customer Sentiment" field under sntc section
    And I note the value of "SNTC Desired Outcomes" field under sntc section
    And I note the value of "SNTC Customer Success Story" field under sntc section
    And I note the value of "SNTC Achieved Outcomes" field under sntc section
    And I note the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "SNTC Cisco Health Status" field under sntc section
    And I note the value of "SNTC SREV Health Status" field under sntc section
    #    When I search and click on just created account
    And I click on new task button under open activities section
    And I select "Task - Health Check" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I select "Collab ELA" from product field picklist under task information
    And I enter comments and subject under task details
    And I wait for 5 seconds
    And I choose contact name under task information
    And I click on "Save" button from top row
    And I get the task id that generated
    And I logout from the current user
    And I login as "admin"
    And I wait for 5 seconds
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I enter value for "SREV Health Score" field under health check details section
    And I enter value for "Cisco Health Score" field under health check details section
    And I enter value for "Inhibitors" field under health check details section
    And I enter value for "Achieved Outcomes" field under health check details section
    And I enter value for "Desired Outcomes" field under health check details section
    And I enter value for "Features" field under health check details section
    And I enter value for "At Risk Reason" field under health check details section
    And I enter value for "Customer Sentiment" field under health check details section
    And I enter value for "SREV Health Status" field under health check details section
    And I enter value for "Cisco Health Status" field under health check details section
    And I enter value for "Health Check#" field under health check details section
    Then I click on "Save" button from top row
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I wait for 5 seconds
    And I select "Completed Successfully" from status picklist field
    And I click on Save button from top row
    And I wait for 5 seconds
    Then I should see content "Task Detail"
    And I should see content "Task Information"
    When I click on account Name from related to field
    And I review the value of "SNTC SREV Health Score" field under sntc section
    And I review the value of "SNTC Cisco Health Score" field under sntc section
    And I review the value of "SNTC Inhibitors" field under sntc section
    And I review the value of "NTC Achieved Outcomes" field under sntc section
    And I review the value of "SNTC Desired Outcomes" field under sntc section
    And I review the value of "SNTC Features" field under sntc section
    And I review the value of "SNTC At Risk Reason" field under sntc section
    And I review the value of "SNTC Customer Sentiment" field under sntc section
    And I review the value of "SNTC SREV Health Status" field under sntc section
    And I review the value of "SNTC Cisco Health Status" field under sntc section
    And I review the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "NOS SREV Health Score" field under nos section
    And I note the value of "NOS Cisco Health Score" field under nos section
    And I note the value of "NOS Inhibitors" field under nos section
    And I note the value of "NOS Achieved Outcomes" field under nos section
    And I note the value of "NOS Desired Outcomes" field under nos section
    And I note the value of "NOS Features" field under nos section
    And I note the value of "NOS At Risk Reason" field under nos section
    And I note the value of "NOS Customer Sentiment" field under nos section
    And I note the value of "NOS SREV Health Status" field under nos section
    And I note the value of "NOS Cisco Health Status" field under nos section
    And I note the value of "NOS Last Health Status" field under nos section

  @US-003570_4 @nalaSalesRep_task3 @nalaSalesMgr_task3 @nalaOpsRep_task3 @nalaOpsMgr_task3
  Scenario: US-003570 Task Process Builder
    When I logout from the current user
    And I login as "admin"
    And I create a random account
    And I get account name just created
    And I get the account id that generated
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I should navigate to "Accounts" tab
    When I search and click on just created account
    And I note the value of "SNTC SREV Health Score" field under sntc section
    And I note the value of "SNTC Features" field under sntc section
    And I note the value of "SNTC Cisco Health Score" field under sntc section
    And I note the value of "SNTC At Risk Reason" field under sntc section
    And I note the value of "SNTC Inhibitors" field under sntc section
    And I note the value of "SNTC Customer Sentiment" field under sntc section
    And I note the value of "SNTC Desired Outcomes" field under sntc section
    And I note the value of "SNTC Customer Success Story" field under sntc section
    And I note the value of "SNTC Achieved Outcomes" field under sntc section
    And I note the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "SNTC Cisco Health Status" field under sntc section
    And I note the value of "SNTC SREV Health Status" field under sntc section
    #    When I search and click on just created account
    And I click on new task button under open activities section
    And I select "Task - Health Check" from record type of new record
    Then I should see the following:
      """
      Task
      New Task
      """
    When I select "AMP" from product field picklist under task information
    And I enter comments and subject under task details
    And I wait for 5 seconds
    And I choose contact name under task information
    And I click on "Save" button from top row
    And I get the task id that generated
    And I logout from the current user
    And I login as "admin"
    And I wait for 5 seconds
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I enter value for "SREV Health Score" field under health check details section
    And I enter value for "Cisco Health Score" field under health check details section
    And I enter value for "Inhibitors" field under health check details section
    And I enter value for "Achieved Outcomes" field under health check details section
    And I enter value for "Desired Outcomes" field under health check details section
    And I enter value for "Features" field under health check details section
    And I enter value for "At Risk Reason" field under health check details section
    And I enter value for "Customer Sentiment" field under health check details section
    And I enter value for "SREV Health Status" field under health check details section
    And I enter value for "Cisco Health Status" field under health check details section
    And I enter value for "Health Check#" field under health check details section
    Then I click on "Save" button from top row
    And I logout from the current user
    Given I should navigate to "Home" tab in saleforce application
    And I visit task id url that generated
    When I click on just created task
    And I wait for 5 seconds
    And I click on "Edit" button from top row
    And I wait for 5 seconds
    And I select "Completed Successfully" from status picklist field
    And I click on Save button from top row
    And I wait for 5 seconds
    Then I should see content "Task Detail"
    And I should see content "Task Information"
    When I click on account Name from related to field
    And I review the value of "SNTC SREV Health Score" field under sntc section
    And I review the value of "SNTC Cisco Health Score" field under sntc section
    And I review the value of "SNTC Inhibitors" field under sntc section
    And I review the value of "NTC Achieved Outcomes" field under sntc section
    And I review the value of "SNTC Desired Outcomes" field under sntc section
    And I review the value of "SNTC Features" field under sntc section
    And I review the value of "SNTC At Risk Reason" field under sntc section
    And I review the value of "SNTC Customer Sentiment" field under sntc section
    And I review the value of "SNTC SREV Health Status" field under sntc section
    And I review the value of "SNTC Cisco Health Status" field under sntc section
    And I review the value of "SNTC Last Health Status" field under sntc section
    And I note the value of "NOS SREV Health Score" field under nos section
    And I note the value of "NOS Cisco Health Score" field under nos section
    And I note the value of "NOS Inhibitors" field under nos section
    And I note the value of "NOS Achieved Outcomes" field under nos section
    And I note the value of "NOS Desired Outcomes" field under nos section
    And I note the value of "NOS Features" field under nos section
    And I note the value of "NOS At Risk Reason" field under nos section
    And I note the value of "NOS Customer Sentiment" field under nos section
    And I note the value of "NOS SREV Health Status" field under nos section
    And I note the value of "NOS Cisco Health Status" field under nos section
    And I note the value of "NOS Last Health Status" field under nos section

  @US-003676 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003676 Add New field Customer Success Story
    Given I click on new button under my task section
    When I wait for 5 seconds
    And I select "Task - Health Check" from record type of new record
    Then I should see customer user story field with read only permission

  @US-003669 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario: US-003669 Removed the following  Task Status In Progress and Waiting on Someone Else
    Given I click on new button under my task section
    When I wait for 5 seconds
    And I select "Task - Standard" from record type of new record
    Then I should verify task status picklist values under task information row

  @US-003679 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1
  Scenario Outline: US-003679 Added Contact field to Task Record Type Standard and Lead task types
    Given I click on new button under my task section
    When I wait for 5 seconds
    And I select "<record_type>" from record type of new record
    Then I should see contact field with read write permission
    And I should see contact field type as lookup

    Examples:
      | record_type     |
      | Task - Standard |
      | Task - Lead     |

  @US-003722 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1 @nalaAdmin_task_1
  Scenario: US-003722 Add new task type task- customer transition
    Given I click on new button under my task section
    When I select "Task- Customer Transition" from record type of new record
    And I check that "Cisco Health Score" is visible and editable
    And I check that "Objective Health Score" is visible and editable
    And I check that "Subjective Health Score" is visible and editable
    And I check that "Transition Direction" is visible and editable
    And I check that "Transition Date" is visible and editable
    And I check that "Partner Name" is visible and editable
    Then I check the transition direction picklist values

    @US-003722_SalesOps @nalaSalesOps_task_1
    Scenario: US-003722 Add new task type task- customer transition
    Given I click on new button under my task section
    And I wait for 5 seconds
    When I select "Task- Customer Transition" from record type of new record
     Then I should see content "Cisco Health Score"
     And I should see content "Objective Health Score"
     And I should see content "Subjective Health Score"
     And I should see content "Transition Direction"
     And I should see content "Transition Date"
     And I should see content "Partner Name"

  @US-003712 @nalaSalesMgr_task_1 @nalaSalesRep_task_1 @nalaOpsMgr_task_1 @nalaOpsRep_task_1 @nalaSalesOps_task_1 @nalaAdmin_task_1
  Scenario: US-003712 The buttons should be removed from all profiles
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    When I should navigate to "Home" tab
    And I click on any one of the existing "Task-HealthCheck" link
    Then I check that "Clone" button is not available
    Then I check that "Delete" button is not available
    Then I check that "Edit" button is not available

