@AtRisk @opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-003825 @om-opp @or-opp @sm-opp @sr-opp
  Scenario: US-003825 Removed Channel sections from Opportunity
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I fill all mandantory fields to create a new opportunity
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    But I should see Partner Opportunity section

  @RLI-01 @om-opp @or-opp @sm-opp @sr-opp
  Scenario: RLI-01 Added Existing Contract Number to Renewable Line Item page layout
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I fill all mandantory fields to create a new opportunity
    And I click on "Save" button from top row
    When I click on "New Renewable Line Item" button under renewable line item section
    And I should see "Existing Contract Number" field with read only permission
    And I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    But I should not see ssi sub result reason field
    Then I should see content "Batch Type"
    And I should see content "Renewal Status"
#    When I double click on batch type field and verify values
#    And I double click on Renewal Status field and verify values

    @Quotes-01 @om-opp @or-opp @sm-opp @sr-opp
    Scenario: Quotes-01 Create new quote
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I wait for 5 seconds
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
#    When I click on add line items button under quote line items section
#    And I select existing product name
#    And I clik on select button
#    And I enter quantity field value
##    And I enter sales price field value
##    And I select value from batch type field
#    And I click on "Save" button under add quote line items to page
#    Then I should see content "Quote Detail"
#    When I click on "Start Sync" button from top row

    @Quotes-02 @om-opp @or-opp @sm-opp @sr-opp
    Scenario: Quotes-02 Create Quote Line Item
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
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
#    And I enter sales price field value
#    And I select value from batch type field
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    When I click on "Start Sync" button from top row