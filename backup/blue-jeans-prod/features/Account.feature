Feature: Account
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I navigate to "Accounts" tab in salesforce application

  @US-004028 @AllUser_Account
  Scenario: US-004028 Account layout, fields, and picklist values update
    When I click "New" button
    And I should see the field "Account Number" in left column
    And I should see the field "Account Number" as text type
    And I should see the field "Account Number" with RW permission except salesops
    And I should see the field "Risk Assessment Overall" in left column
    And I should see the field "Risk Assessment Overall" as type picklist
    And I should see the field "Risk Assessment Overall" with RW permission except salesops
    And I should see "Risk Assessment Overall" field picklist options
    And I should see the field "Reason for Risk Assessment Overall" in left column
    And I should see the field "Reason for Risk Assessment Overall" as text type
    And I should see the field "Reason for Risk Assessment Overall" with RW permission except salesops
    And I should see the field "Overall Risk Status Last Changed" in left column
    And The field "Overall Risk Status Last Changed" should be of date type
    And I should see the field "Overall Risk Status Last Changed" with - Read Only - permission
    And I should see the field "Sales Market" in right column
    And I should see the field "Sales Market" as type picklist
    And I should see the field "Sales Market" with RW permission except salesops
    And I should see "Sales Market" field picklist options
    And I should see the field "Secondary Market" in right column
    And I should see the field "Secondary Market" as type picklist
    And I should see the field "Secondary Market" with RW permission except salesops
    And I should see "Secondary Market" field picklist options
    And I enter value to all the mandatory field over new account page
    When I click Save button from top button row
    Then The "Accounts" record should save seccessfully
    And I should see the field "Account Number" is present under Account Detail section
    And I should see the field "Risk Assessment Overall" is present under Account Detail section
    And I should see the field "Reason for Risk Assessment Overall" is present under Account Detail section
    And I should see the field "Overall Risk Status Last Changed" is present under Account Detail section
    And I should see the field "Sales Market" is present under Account Detail section
    And I should see the field "Secondary Market" is present under Account Detail section



  @US-004097_01 @OpsMgr_Accounts @OpsRep_Accounts @SalesMgr_Accounts @SalesRep_Accounts
  Scenario: US-004097 Added Workflow to populate Overall Risk Status Last Changed field
  When I click on the "Accounts" tab
  Then I able to see the "Recent Accounts" page
  When I click on the "New" button
  Then I able to see the "Account Edit" page
  When I fill the account required fields
  And I click on "Save" button from new "Account Edit" page
  Then I able to see the account created successfully
  When I click on the "Edit" button from "Opportunity Product Detail" page
  When I select the "Risk Assessment Overall" pickList value
  And I click on "Save" button from new "Account Edit" page
  Then I able to see the "Account Detail" page
  And I verify the "Overall Risk Status Last Changed" should be current system date and time


