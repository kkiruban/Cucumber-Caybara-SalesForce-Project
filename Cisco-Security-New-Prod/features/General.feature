Feature: General
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I navigate to "Home" tab in salesforce application

  @US-003955 @Admin_Generals
  Scenario: US-003955 Base Config, Calendars, Business Hours
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I clicked the link "Manage Currencies"
    And I should see given exchange rate
    And I clicked the link "Business Hours"
    And I should see the link "APAC" over the page
    And I should see the link "EMEA" over the page
    And I should see the link "NALA" over the page
    And I clicked the link "APAC"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I clicked the link "Business Hours"
    And I clicked the link "EMEA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I clicked the link "Business Hours"
    And I clicked the link "NALA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I clicked the link "Fiscal Quarters"

  @US-003962 @Admin_Generals
  Scenario: US-003962 Validate Users setup
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    #And I click "Users" link under "Manage Users"
    And I clicked the link "Users"
    Then I should verify users

  @US-003970 @Admin_Generals
  Scenario: US-003970 Rules - Opportunity & Renewable Line Item
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Opportunities" in setup
    And I click "Validation Rules" in setup
    Then I should see the rule "Competitor_Name_Required" unchecked
    And I should see the rule "Upsell_Product_Required" unchecked
    And I should see the rule "Stage_Closed_Sale" checkbox checked
    When I click "Opportunity Products" in setup
    And I click "Validation Rules" present under "Opportunity Products"
    Then I should see the rule "Competitor_Name_Required" checkbox checked
    And I should see the rule "Upsell_Product_Required" checkbox checked

  @US-003972 @Admin_Generals
  Scenario: US-003972 Rules - Task
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Activities" in setup
    And I click "Task Validation Rules" in setup
    Then I should see the rule "Competitor_Name_Required" unchecked
    And I should see the rule "Upsell_Product_Required" unchecked

  @US-004017_gen @Admin_Generals
  Scenario: US-004017 Add and remove rules - RLI
    When I selected "Setup" from user menu
    And I clicked the "Create" link under "App Setup"
    And I clicked the link "Objects"
    And I clicked the link "Renewable Line Item" object
    Then I should see the rule "Enable Upsell Product Picklist" checkbox checked
    
