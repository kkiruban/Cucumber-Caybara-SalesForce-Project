@General_feature
Feature: All scenarios related to General feature

  Background: Login to the Application
    Given I login to the "AtRisk" application
    Then I able to see the logged in to "AtRisk" application


  @US-003816 @Admin_general
  Scenario: General calendar configuration for Schneider
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Fiscal Year" name
    When I click on "Fiscal Year" link
    Then I able to see the "Organization Fiscal Year Edit" page
    And I able to see the "Fiscal Year Start Month" is "January"


  @US-003818 @Admin_general
  Scenario: Updated Business Hours
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Company Profile" link
    Then I able to see the "Business Hours" name
    When I click on "Business Hours" link
    Then I able to see the "Organization Business Hours" page
    When I click on "NALA" link
    Then I able to see "NALA" "Business Hours" details


  @US-003822 @Admin_general
  Scenario: Updated Users tab
    When I click on "Setup" link from user menu
    Then I able to see the "Force.com" home page
    When I click on "Manage Users" link
    Then I able to see the "Users" name
    When I click on "Users" link
    Then I able to see the "Active Users" page
    And I verify users profile
    And I "User Profiles" should match "Users" tab in config guid