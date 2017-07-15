@Alcon @general
Feature: General
  In order to validate general test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @Gen-01 @Admin_general
  Scenario: Gen01 verify business hours
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Business Hours" link
    And I click on "NALA" link
    Then I verify nala time zone and Business Hours

  @Gen-02 @Admin_general
  Scenario: Gen02 Validate Users setup
    Given I click on username in the top right corner then select setup
    When I expand "Manage Users" from administration setup
    And I click "Users" link
    Then I should see content "All Users"
    