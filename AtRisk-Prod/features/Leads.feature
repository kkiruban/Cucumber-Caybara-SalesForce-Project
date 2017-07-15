@Lead_feature
Feature: All scenarios related to Lead feature

  Background: Login to the Application
    Given I should navigate to Assets tab in saleforce application
    Then I able to see the logged in to "Schneider" application


  @US-003824 @om-leads @or-leads @sm-leads @sr-leads @admin-leads @so-leads
  Scenario: US-003824 Notes & Attachments related list
    When I click on "Leads" from "All Tabs" page
    Then I able to see the "Recent Leads" page
    When I click on the "New" button
    And I fill the all required fields to create a new lead
    And I click on "Save" button from top row
    Then I should see content "Lead Detail"
    And I should see "Notes & Attachments" section