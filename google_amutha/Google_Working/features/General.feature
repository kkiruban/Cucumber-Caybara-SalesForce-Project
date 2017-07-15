Feature: Accounts
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @US-003686 @Admin_Account
  Scenario: US-003686 Base Configuration
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I click "Manage Currencies" link under "Company Profile"
    Then I should see Currency Code "JPY"
    And I should see Currency Code "USD"
    And I should see Currency Code "GBP"
    And I should see Currency Code "EUR"

  @US-003688_0123 @Admin_Account
  Scenario: US-003688 Added Tokyo timezone to Business Hours tab
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "APAC (TOK)"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "APAC (SIN/KL)"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "NALA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "EMEA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"

  @US-003690_0123 @Admin_Account
  Scenario: US-003690 Disabled Rule:  SSI_ZTH__Stage_Closed_Sale
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Opportunities" link under "Customize"
    And I click "Validation Rules" link under "Opportunities"
    Then I should see "Stage_Closed_Sale" active checkbox unchecked

  @US-003692 @Admin_Account
  Scenario: US-003692 Updated Users tab to align users
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I click "Users" link under "Manage Users"
    Then I should verify users
