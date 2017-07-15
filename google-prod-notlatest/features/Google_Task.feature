@google @mytasks
Feature:
  In order to validate tasks section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @US-003698 @All-Users-task
  Scenario: US-003698 task types by persona
    Given I click on new button under my task section
    When I check that the picklist value of record type of new record
    And I select "Task - Email" from record type of new record
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    And I click on new button under my task section
    And I select "Task - Phone Calls" from record type of new record
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row
    And I should navigate to "Home" tab
    And I click on new button under my task section
    And I select "Task - Standard" from record type of new record
    And I enter data to all the mandatory fields
    Then I click on "Save" button from top row