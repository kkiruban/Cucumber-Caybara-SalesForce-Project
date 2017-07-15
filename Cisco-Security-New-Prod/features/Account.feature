@Account
Feature: Account

  Background:
    Given I navigate to "Accounts" tab in salesforce application

  @US-003963 @Admin_Account @All_Users_account @Sales_ops
  Scenario: US-003963 Account
    When I follow on "New" button
    Then I should see the field "Dedicated Account" is present under "Account Information" section
    And I should see the field "Dedicated Account" as checkbox type
    And I should see the field "Dedicated Account" in the right column
    And I should see the field Partner Type editable for ops role only
    And I should see the field "Account Number" is present under "Account Information" section
    And I should see the field "Account Number" with RW permission except salesops
    And I should see the field "Credit Hold" is present under "Account Information" section
    And I should see the field "Credit Hold" as checkbox type
    And I should see the field "Credit Hold" with RW permission except salesops
    And I should see "Sales Center" field picklist options
    And I enter value to all the mandatory field
    When I click Save button from top button row
    Then The "Account" record should save seccessfully
    
    
