Feature: General
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I navigate to "Home" tab in salesforce application

  @US-004070-Exchange_Rate @US-004066 @Admin_Generals
  Scenario: US-004070 Exchange_Rate
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Manage Currencies"
    #Then I should see given currency code
    And I should see given exchange rate

  @US-004070-Business_Hours @Admin_Generals
  Scenario: @US-004070 Business Hours
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Business Hours"
    And I clicked the link "NALA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"

  @US-004070-Calendar @Admin_Generals
  Scenario: US-004070 Calendar
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Fiscal Year"
    And I should see Fiscal Year Start Month as "January"

  @US-004070-Approval_Process_Rule @Admin_Generals
  Scenario: US-004070 Approval Process Rule
    When I selected "Setup" from user menu
    And I clicked the "Create" link under "App Setup"
    And I clicked the link "Workflow & Approvals"
    And I clicked the link "Approval Processes"
    And I should see "Zenith Approval for No Service" rule under "Inactive Approval Processes" section

  @US-004070_Proactive_Rules @Admin_Generals
  Scenario: US-004070 Proactive Rules
    When I navigate to "Proactive Rules" tab in the application
    And I clicked the link "120 DIA Quotes"
    Then I should see rule "Stage" is "=" to "Not Contacted"
    And I should see rule "Sum of Quote Request" is "=" to "0"
    And I should see rule "Earliest Expiration Date" is "≤" to "Next_N_Days:120"
    And I should see rule "Earliest Expiration Date" is "≥" to "TODAY"
    And I should see rule "Record Type ID" is "=" to "Quote Record Type"
    And I should see rule "Target DIA" is "=" to "100"
    And I should see rule "Case Origin" is "=" to "Proactive"
    And I should see rule "Priority" is "=" to "Normal"
    And I should see rule "Quote Type" is "=" to "1 Year"

  @US-004070_Setup_users @US-004090 @Admin_Generals
  Scenario: US-003999 US-004090 Verify Setup users in SIT, New Permission set name: "SSI Zenith Expand Permission TEMP"
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I clicked the link "Users"
    Then I should verify users
    Then I able to see the "SSI Zenith Expand Permission TEMP" name
    Then I verify the specific users with "SSI Zenith Expand Permission TEMP" permission

  