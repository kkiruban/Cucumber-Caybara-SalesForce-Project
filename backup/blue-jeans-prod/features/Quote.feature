@blue-jeans @quote
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement


@Quote-001 @admin-quote @om-quote @or-quote @sm-quote @sr-quote
  Scenario: Quote-001 Create new Quotes
    Given I should navigate to opportunity tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I wait for 5 seconds
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    When I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
    And I enter quantity field value
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    When I click on "Start Sync" button from top row