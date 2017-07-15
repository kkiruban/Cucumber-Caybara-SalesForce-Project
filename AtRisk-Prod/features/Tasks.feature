@Tasks_feature
Feature: All scenarios related to Tasks feature

  Background: Login to the Application
    Given I login to the "Schneider" application
    Then I able to see the logged in to "Schneider" application


  @Tasks-01 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Create new Tasks
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" tasks pickList fields


  @Tasks-01 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Create new Task - Email
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Email" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    Then I able to see the created "Task - Email" successfully


  @Tasks-01 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Create new Task - Fax
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Fax" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    Then I able to see the created "Task - Fax" successfully


  @Tasks-01 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Create new Task - Inbox
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Inbox" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    Then I able to see the created "Task - Inbox" successfully



  @Tasks-01 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Create new Task - Phone Calls
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Phone Calls" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    Then I able to see the created "Task - Phone Calls" successfully


  @Tasks-01 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Create new Task - Standard
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Standard" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    Then I able to see the created "Task - Standard" successfully

