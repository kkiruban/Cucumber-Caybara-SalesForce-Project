Feature: Contact
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I navigate to "Contacts" tab in salesforce application
#    And I should create new account record "Smoke_test_accounts_cases" as test data
    And I navigate to "Contacts" tab in salesforce application

  @US-004072 @US-004097 @AllUsers_contacts
  Scenario: US-004072 US-004097 Contact layout, fields update, Update Contact pickList: Role(rename) & Type (Removed strike through)
    When I click "New" button
    Then I able to see the "Contact Edit" page
    And I able to see the "Role" pickList field
    And I able to see the "Role" PickList values
    And I verify the contact "Type" pickList
    And I verify the "Type" PickList values
    And I enter value to all the mandatory field over contact edit page
    When I click Save button from top button row
    Then The "Contacts" record should save seccessfully

  