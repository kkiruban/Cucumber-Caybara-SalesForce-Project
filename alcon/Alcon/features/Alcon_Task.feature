@Guidance @tasks
Feature:
  In order to validate tasks section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @Tsk-01 @All-Users_Tasks
  Scenario: Tsk-01 create task - email
    Given I click on new button under my task section
    Then I should see content "Select Task Record Type"
    And I select "Task - Email" from record type of new record
    Then I should see content "Task Edit"
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    And I click on new button under my task section
    Then I should see content "Select Task Record Type"

  @Tsk-02 @All-Users_Tasks
  Scenario: Tsk-02 create task - fax
    Given I click on new button under my task section
    Then I should see content "Select Task Record Type"
    And I select "Task - Fax" from record type of new record
    Then I should see content "Task Edit"
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    And I click on new button under my task section
    Then I should see content "Select Task Record Type"

  @Tsk-03 @All-Users_Tasks
  Scenario: Tsk-03 create task - phone calls
    And I click on new button under my task section
    Then I should see content "Select Task Record Type"
    And I select "Task - Phone Calls" from record type of new record
    Then I should see content "Task Edit"
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    And I click on new button under my task section
    Then I should see content "Select Task Record Type"

  @Tsk-04 @All-Users_Tasks
  Scenario: Tsk-04 create task - standard
    Given I click on new button under my task section
    Then I should see content "Select Task Record Type"
    And I select "Task - Standard" from record type of new record
    Then I should see content "Task Edit"
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
