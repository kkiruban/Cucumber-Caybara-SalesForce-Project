@cisco-security @opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all Sfunctionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-004050 @om-opp-product @or-opp-product
  Scenario: US-004050 Opportunity Product Page Layout
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I enter data to required fields under new opportunity section
    And I choose a value from sales level one lookup field
    And I choose a value from sales level two lookup field
    And I choose a value from sales level three lookup field
    And I choose a value from sales level four lookup field
    And I choose a value from sales level five lookup field
    And I choose a value from sales level six lookup field
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    When I click on new renewable line item button
    Then I should see content "Renewable Line Item"
    When I fill all mandantory fields to create new renewable line item
    And I click on "Save" button on top button row
    Then I should see content "Renewable Line Item Detail"
    When I click on opportunity link under renewal relationship details
    Then I should see content "Opportunity Detail"
    When I click on Manage Renewals button under Renewable Line Item section
    When I check existinig product in renewal relationship page
    And I click on rebuild opportunity link
    And I should see "Start Date" field with read and write permission
    And I should see "End Date" field with read and write permission
    And I should see "Technology" field with read and write permission
    And I should see "Sub-Technology" field with read and write permission
    And I should see "Product Family / Service Program" field with read and write permission
    And I should see "SFDC Workspace ID" field with read and write permission
    But I should not see "Discount" field

  @US-004050-1 @om-opp-product @or-opp-product
  Scenario: US-004050 Opportunity Product Page Layout
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I enter data to required fields under new opportunity section
    And I choose a value from sales level one lookup field
    And I choose a value from sales level two lookup field
    And I choose a value from sales level three lookup field
    And I choose a value from sales level four lookup field
    And I choose a value from sales level five lookup field
    And I choose a value from sales level six lookup field
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    When I click on new renewable line item button
    Then I should see content "Renewable Line Item"
    When I fill all mandantory fields to create new renewable line item
    And I click on "Save" button on top button row
    Then I should see content "Renewable Line Item Detail"
    When I click on opportunity link under renewal relationship details
    Then I should see content "Opportunity Detail"
    When I click on "Edit" button from top row
    And I select "No Service" from "opp11" field
    And I click on "Save" button from top row
    Then I should see following error:
      """
      Error: Invalid Data.
      Review all error messages below to correct your data.
      All Renewal Relationship records must have a Renewal Status that is not "Open"
      """

  @279078-1
  Scenario: 279078 SalesRep salesOps should not update Previous Price or Renewal Target Multiplier fields
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I Edit on existing RLI
    Then I should see "Renewal Target" field with read only permission
    And I verify adds picklist value in batch type picklist
    When I update previous price or Renewal Target Multiplier fields
    And I click on "Save" button on top button row
    Then I should see following "Error: Invalid Data." error