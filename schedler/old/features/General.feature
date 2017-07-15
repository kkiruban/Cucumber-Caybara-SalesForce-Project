@General_feature
Feature: All scenarios related to General feature

  Background: Login to the Application
    Given I login to the "Schneider" application
    Then I able to see the logged in to "Schneider" application


  @US-003809 @Admin_general
  Scenario: General configuration for Schneider
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Manage Currencies" name
    When I click on "Manage Currencies" link
    Then I able to see the "Currency" page
    When I click on "Manage Currencies" button from "Currency" page
    Then I able to see the "Active Currencies" section
    And I user should see "GBP" as based currency
    And "EUR" is listed as the other currency with the exchange rate of "1.180000"


  @US-003812 @Admin_general
  Scenario: Updated Users tab
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Manage Users" link
    Then I able to see the "Users" name
    When I click on "Users" link
    Then I able to see the "Active Users" page
    And I verify users profile
    And I "User Profiles" should match "Users" tab in config guid


  @US-003810 @Admin_general
  Scenario: General calendar configuration for Schneider
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Fiscal Year" name
    When I click on "Fiscal Year" link
    Then I able to see fiscal calendar should shows:
     """
      - Jan-Mar Q1
      - Apr-Jun Q2
      - Jul-Sep Q3
      - Oct-Dec Q4
     """


  @US-003814 @Admin_general
  Scenario: Business Hours EMEA
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Business Hours" name
    When I click on "Business Hours" link
    Then I able to see the "Organization Business Hours" page
    When I click on "EMEA" link
    Then I following "Business Hours" details should be visible:
     """
      Sunday: No Hours
      Monday: 8:00 AM to 5:00 PM
      Tuesday: 8:00 AM to 5:00 PM
      Wednesday: 8:00 AM to 5:00 PM
      Thursday: 8:00 AM to 5:00 PM
      Friday: 8:00 AM to 5:00 PM
      Saturday No Hours
     """