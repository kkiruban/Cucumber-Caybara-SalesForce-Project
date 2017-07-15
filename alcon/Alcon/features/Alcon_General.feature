@PKI @general
Feature: General
  In order to validate general test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

 @Gen-01 @Admin_general
  Scenario: Gen-01 Verify Multi Currency
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Manage Currencies" link
    And I should see content "Active Currencies"
    Then I check the available currency code


  @Gen-02 @Admin_general
  Scenario: Gen-02 verify business hours
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Business Hours" link
    And I click on "NALA" link   
    Then I verify nala time zone and Business Hours

  @Gen-03 @Admin_general_1
  Scenario: Gen-03 Validate Users setup
    Given I click on username in the top right corner then select setup
    When I expand "Manage Users" from administration setup
    And I click "Users" link
    Then I should verify users


