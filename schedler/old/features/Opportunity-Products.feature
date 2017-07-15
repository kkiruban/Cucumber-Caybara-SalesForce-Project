@Schneider-opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-003908 @All-Users-Opportunity
  Scenario: US-003908 verifying new fields to the Opportunity page layout
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    When I click on renewal opportunity under renewable line item detail section
    Then I should see content "Opportunity Detail"
    When I click on manage renewals button under renewable line item
    Then I should see content "Renewal Relationship"
    When I check existinig product in renewal relationship page
    And I click on rebuild opportunity link
    And I click on edit button on opportunity product
#    Then I should see content "Renewable Line Item Edit"
    Then I should see Local Currency Code field with default value as "GBP"
    And I should see Upsell Cross sell field
    And I should verify Upsell Cross sell field picklist values
    And I click on "Save" button from top row