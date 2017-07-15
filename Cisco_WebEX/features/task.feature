@Cisco_WebEx @mytasks
Feature:
  In order to validate accounts section
  As a tester
  I should validate the functionalities as per test case

  @US-003596 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003596 process builder
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I select account name in the related lookup field
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on just created "Task - Health Check" link
    And I click on "Edit" button from top row
    And I select "Completed" from status picklist field
    And I click on "Save" button from top row
    And I click on account name from related to field
    Then I verify health status reason

  @US-003610 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003610 webex health check tasks
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I check that health status reason is available under task details section
    And I enter data to all the mandatory fields
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on new button under my task section
    And I select "Task - Phone Calls" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on new button under my task section
    And I select "Task - Standard" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I click on "Save" button from top row

@US-003627 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003627 need to remove the values  from the status picklist on tasks
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I check that waiting on someone else option is not available in status picklist
    And I check that deferred option is not available in status picklist

@US-003633 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003633 health status reason is required
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I select account name in the related lookup field
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on just created "Task - Health Check" link
    And I click on "Edit" button from top row
    And I select "--None--" from "Health Status Reason" picklist field
    And I select "Completed" from status picklist field
    And I click on "Save" button from task page

@US-003634 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003634 updated buttons on standard task layout and health check task
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I select account name in the related lookup field
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on just created "Task - Health Check" link
    And I check that "Create Follow-Up Event" button is not visible
    And I check that "Create Follow-Up Task" button is not visible
    And I check that "Create Follow-up CSM Task" button should be visible
    And I should navigate to "Home" tab
    Given I click on new button under my task section
    When I select "Task - Standard" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I select account name in the related lookup field
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on just created "Task - Standard" link
    And I check that "Create Follow-Up Event" button is not visible
    And I check that "Create Follow-Up Task" button is not visible
    And I check that "Create Follow-up CSM Task" button should be visible

@US-003597 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003597 Verify health status_reason_required rule
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I select account name in the related lookup field
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on just created "Task - Health Check" link
    And I click on "Edit" button from top row
    And I select "--None--" from "Health Status Reason" picklist field
    And I select "Completed" from status picklist field
    And I click on "Save" button from task page

@US-003646 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003646 Added Set Play Outcome button
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I select account name in the related lookup field
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on just created "Task - Health Check" link
    Then I check that "Set Play Outcome" button should be visible

@US-003647 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003647 Additional Task Status Picklist value
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I enter data to all the mandatory fields
    And I select account name in the related lookup field
    And I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on just created "Task - Health Check" link
    And I click on "Edit" button from top row
    Then I check that completed unsuccessfully option is available in status picklist

 @US-003653 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003653 Removed Email and Fax task record types from all persons
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    Then I check that the picklist value of select task record type

    @US-003706 @SalesRep_task @SalesMgr_task @OpsRep_task @OpsMgr_task @SalesOps_task @Admin_task
  Scenario: US-003706 Need Due Date field required when saving Task
    Given I should navigate to "Home" tab in saleforce application
    Given I click on new button under my task section
    When I select "Task - Health Check" from record type of new record
    Then I should see content "New Task"
    And I enter data in mandatory fields
    Then I should see error message "Error: The following field is required: Due Date"
    When I enter date in "Due Date" field
    And I click on "Save" button from top row