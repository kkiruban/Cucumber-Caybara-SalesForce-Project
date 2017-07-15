@ge
Feature:
  In order to validate Opportunity assets field
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Accounts" tab in saleforce application

@US-003405 @account-all-users
  Scenario: Verify Site ID field permission
     When I select "All Accounts" from view picklist
     And I select first account from "All Accounts" collection
     Then I should see the field "Site ID" under "Account Detail" section
     When I click on "Edit" button on top button row
     Then I should see the field "Site ID" with R-Only permission

@US-003406 @account-sales-ops @account-sales-mgr @account-sales-associate @account-ops-mgr
  Scenario: Verify SVC Area field permission
     When I select "All Accounts" from view picklist
     And I select first account from "All Accounts" collection
     Then I should see the field "SVC Area" under "Account Detail" section
     When I click on "Edit" button on top button row
     And I verified the field "SVC Area" as text field
     And I verified the field "SVC Area" max lenght is "120"
     Then I should see "SVC Area" text field with RW permission

@US-003406_1 @account-sales-rep @account-data-services
  Scenario: Verify SVC Area field permission
     When I select "All Accounts" from view picklist
     And I select first account from "All Accounts" collection
     Then I should see the field "SVC Area" under "Account Detail" section
     When I click on "Edit" button on top button row
     Then I should see the field "SVC Area" with R-Only permission

@US-003447 @account-all-users
  Scenario: Verify Industry drop down option
     When I follow the "New" button
     Then I should see "Industry" field picklist options

@US-003518 @account-all-users
  Scenario: Verify address fields over account detail page
     When I follow the "New" button
     Then I should see "Billing Address" text field with RW permission
     Then I should see "Billing Address 2" text field with RW permission
     Then I should see "Billing City" text field with RW permission
     Then I should see "Billing State" text field with RW permission
     Then I should see "Billing Zip" text field with RW permission

  @US-003424 @opp-all-users
  Scenario: US-003424 Validate Account Currency field picklist values
    Given I should navigate to "Accounts" tab in saleforce application
    When I select "All Accounts" from view picklist
    And I open any existing account name from the list under all accounts section
    And I click on "Edit" button from top row
    Then I should see content "Account Edit"
    And I should verify account currency field picklist values under account information row
