@btc @testdata
Feature:
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test case

  @create_opportunity
  Scenario: create new opportunity
    Given I should navigate to "Opportunities" tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    When I fill required values for mandantory fields to create a new opportunity
    And I wait for 2 seconds
    And I click on "Save" button on top button row
    And I wait for 2 seconds
    Then I should see content "Opportunity Detail"

  @create_opportunityassets
  Scenario: create new opportunityassets
    When I follow on "New" button
    Then I create new opportunity asset by entering all the mandatory fields
    And I click on "Save" button from top row

  @create_quote
  Scenario: create new opportunityassets
    And I click on New Quote button
    When I enter data to all mandatory field to create quote
    And I enter value "GBP" in currency field
    And I click on "Save" button from top row
