Feature: General
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I navigate to "Home" tab in salesforce application

  @US-004224 @Admin_Generals
  Scenario: US-004224 Validate Users setting
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Manage Currencies"
    And I clicked the button "Manage Currencies" over the page
    And I should see given currency with "Exchange Rate" data

  @US-004228 @Admin_Generals
  Scenario: US-004228 Business Hours
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Business Hours"
    And I clicked the link "NALA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Tuesday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Wednesday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Thursday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Friday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I clicked the link "Business Hours"
    And I clicked the link "APAC"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Tuesday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Wednesday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Thursday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Friday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I clicked the link "Business Hours"
    And I clicked the link "EMEA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Tuesday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Wednesday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Thursday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Friday" as "8:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"

  @US-004226 @Admin_Generals
  Scenario: US-004226 Fiscal Year
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Fiscal Year"
    Then I should see Fiscal Year Start Month as "July"
    And I should see "The starting month" radio button checked

  @US-004231 @Admin_Generals
  Scenario: US-004231Manage users
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I clicked the link "Users"
    Then I should verify users

  @US-004230 @Admin_Generals
  Scenario: US-004230 Custom validation rule
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Opportunities" in setup
    And I clicked the link "Validation Rules"
    Then I should see the rule "Estimated_Close_Date_Required" checkbox checked

  @US-004229 @Admin_Generals
  Scenario: US-004229 NS_HA Custom Settings
    When I selected "Setup" from user menu
    And I clicked the "Develop" link under "App Setup"
    And I clicked the link "Custom Settings"
    And I click "Manage" next to "HA/NS"
    Then I should see the checkbox "House Account Approval" checked
    And I should see the checkbox "No Service Approval" checked
    And I should see the field "House Account Renewal Amount" is showing data as "USD -0.01"
    And I should see the field "No Service Renewal Amount" is showing data as "USD -0.01"

  @US-004235 @Admin_Generals
  Scenario: US-004235 Turn on TRACKINGS
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Opportunities" in setup
    And I clicked the link "Fields"
    Then I should see Track History checkbox check for "Amount"
    And I should see Track History checkbox check for "SSI_ZTH__Client_Sales_Stage__c"
    And I should see Track History checkbox check for "CloseDate"
    And I should see Track History checkbox check for "SSI_ZTH__Commit_Level__c"
    And I should see Track History checkbox check for "ServiceSource1__REN_Earliest_Expiration_Date__c"
    And I should see Track History checkbox check for "ServiceSource1__REN_EQ__c"
    And I should see Track History checkbox check for "ServiceSource1__REN_Expiration_Quarter_Year__c"
    And I should see Track History checkbox check for "SSI_ZTH__First_Contact_Date__c"
    And I should see Track History checkbox check for "SSI_ZTH__First_Quote_Completed_Date__c"
    And I should see Track History checkbox check for "SSI_ZTH__First_Quote_Date__c"
    And I should see Track History checkbox check for "Local_Amount__c"
    And I should see Track History checkbox check for "SSI_ZTH__Local_Renewal_Target__c"
    And I should see Track History checkbox check for "SSI_ZTH__Ops_Stage__c"
    And I should see Track History checkbox check for "StageName"
    And I should see Track History checkbox check for "SyncedQuoteId"
    And I should see Track History checkbox check for "SSI_ZTH__Opportunity_Picklist_1__c"
    And I should see Track History checkbox check for "Estimated_Close_Date__c"

@US-004316 @Admin_Generals
  Scenario: US-004316 Verify Active and Inactive users
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I clicked the link "Users"
    Then I verify that "Basobas, Jason" is available and an active user on click of "B"
    Then I verify that "Limpahan, Gerald" is available and an active user on click of "L"
    Then I verify that "Pelayo, Jan Rigel" is available and an active user on click of "P"
    Then I verify that "Villones , Ferdinand" is available and an active user on click of "V"
 