@Contact
Feature: Contact
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I navigate to "Contacts" tab in salesforce application
#    And I should create new account record "Smoke_test_accounts_cases" as test data
#    And I navigate to "Contacts" tab in salesforce application

  @US-004017_Contact @Admin_Contacts @All_Users_Contacs @Sales_ops
  Scenario: US-004017 Remove all Channel Contact Layout
    And I follow on "New" button
    And I should see "Role" field picklist options
    And I enter value to all the mandatory field over contact edit page
    When I click Save button from top button row
    Then The "Contacts" record should save seccessfully
