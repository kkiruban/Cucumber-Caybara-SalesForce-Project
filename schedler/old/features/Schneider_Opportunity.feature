@Schneider-opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-003806 @All-Users-Opportunity
  Scenario: US-003806 verifying new fields to the Opportunity page layout
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see Business Line picklist values
    And I should see Client Sales Stage picklist values
    And I should see Client Territory picklist values
    And I should see boop converted value text field
    And I should see boop status picklist field
    And I should see boop created date field
    And I should see "First Quote Delivered Date" field with read only permission
    When I select "Not Contacted" from stage picklist
    And I should see nsight Reason picklist field
    And I should see nsight reason picklist field with read and write permission
    And I should see Agreement Number field
    And I should see Agreement Name field
    And I should see Existing PO Number field
    And I should see New Contract Number field
    And I should see "Forecasting Status" field with read only permission
    And I should see "Quoting Status" field with read only permission
    And I should see "Contacted Status" field with read only permission
    And I enter data to required fields under new opportunity section
    And I click on "Save" button from top row

  @US-003807 @om-rlt @or-rlt @sm-rlt @sr-rlt
  Scenario: US-003807 Add new fields to the Opportunity page layout
    When I search existing opportunity and click
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

  #    Then I should see content "Opportunity Detail"
  #    And I should see content "Products (Standard Price Book)"
  @US-003808 @om-rlt @or-rlt @sm-rlt @sr-rlt
  Scenario: US-003808 Renewable Line Item
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    And I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see batch type field
    And I should see batch type picklist values

  @US-003876 @om-rlt @or-rlt @sm-rlt @sr-rlt
  Scenario: US-003876 Update Batch Type picklist
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    And I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see batch type field
    And I should see Break fix option in batch type field

  @US-003837 @om-rlt @or-rlt @sm-rlt @sr-rlt
  Scenario: US-003837 Add SSI Result Reason to page layout
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    And I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see SSI Result Reason field
    And I should see SSI Result Reason picklist values
    When I select "Open" from ssi result reason picklist
    And I click on "Save" button from top row
    And I click on "Edit" button from top row
    And I fill previous price as "500"
    And I click on "Save" button from top row
    Then I should see content "Renewable Line Item Detail"
    When I click on Renewal Opportunity
    Then I should see content "Opportunity Detail"

  @US-003868-opp @All-Users-Opportunity
  Scenario: US-003868 Default value
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should verify Lead Source field with default value
    And I should verify Client Region field with default value
    And I should verify Country field with default value
    And I should verify Engagement Type field with default value
    And I should verify Opportunity Type field with default value
    And I should verify SSI Threatre field with default value

  @US-003867 @All-Users-Opportunity
  Scenario: US-003867 Add new field Solutions Provider to Opportunity page layout.
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see Solution Provider field

  @US-003907 @All-Users-Opportunity
  Scenario: US-003907 Default value
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should verify Opportunity Currency field with default value

  @US-003904 @All-Users-Opportunity
  Scenario: US-003904 verify Client Sales Stage field
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see Client Sales Stage field under insight reason field