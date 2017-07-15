@extreme @opportunity-products
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

@US-004236 @US-004270 @US-004311 @om-opp-pro @or-opp-pro @sm-opp-pro @sr-opp-pro @so-opp-pro
  Scenario: US-004236 Update Opportunity Product
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on existing opportunity product edit button
    And I should see "Opportunity Product ID" field with read only permission for all users
    And I should see "Renewable Line Item ID" field with read only permission for all users
    And I should see "Up-Sell / Cross-Sell" field with read and write permission for OpsManager and OpsRep user
    When I fill discount as "100"
    And I select "Renewal" from "Batch Type" in opportunity product edit page
    And I click on "Save" button from top row
    Then I should see content "Relationship ID"
    And I should see content "Renewable Line Item ID"
    And I should see content "Renewal Product Line ID"
    And I should see content "Existing Serial Number"
    And I should see content "Existing Product"
    And I should see content "Existing End Date"
    And I should see content "Previous Price"