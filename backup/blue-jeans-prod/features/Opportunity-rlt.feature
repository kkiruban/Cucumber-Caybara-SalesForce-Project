@blue-jeans @opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-004137 @US-004182 @om-opp @or-opp
  Scenario: US-004137 verifying new fields to the Opportunity page layout
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see "Renewal Term" field with read and write permission
    And I should see "Initial Term" field with read and write permission
    And I should see "ARR" field with read and write permission
    And I should see "Service Activation Date" field with read and write permission
    And I should see "Current Term" field with read and write permission
    And I should see "Subscription Name" field with read and write permission
    And I should see "MRR" field with read and write permission
    And I should see Client Territory picklist values
    And I should see SSI Theatre picklist values
    And I should see Client Region picklist values
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row

  @US-004139 @admin-rlt @om-rlt @or-rlt @sm-rlt @sr-rlt
  Scenario: US-003807 Add new fields to the Opportunity page layout
    When I click on new button
    And I select opportunity edit from record type of new record
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    When I click on "New Renewable Line Item" button under renewable line item section
    Then I should see "Discount" field with read and write permission
    And I should see "Licenses" field with read and write permission
    And I should see "UOM" field with read and write permission
    And I should see "Type" field with read and write permission
    And I should see "Period" field with read and write permission
    And I should see "Model" field with read and write permission
    And I should see Model picklist values
    And I should see period picklist values
    And I should see Type picklist values
    And I should see UOM picklist values
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    When I click on renewal opportunity under renewable line item detail section
    Then I should see content "Opportunity Detail"
    When I click on manage renewals button under renewable line item
    Then I should see content "Renewal Relationship"
    When I check existinig product in renewal relationship page
    And I click on rebuild opportunity link

   @US-004138 @US-004182 @om-rlt @or-rlt @sm-rlt @sr-rlt
  Scenario: US-004138 SMB Opportunity Product
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    And I should see Licenses field or coloumn under product related list
    And I should see "BJN Discount" field or coloumn under Renewable Line Items related list
#    But I should not see "Quantity" field or coloumn under product related list
    When I click on existing opportunity product edit button
    Then I should see "Discount" field with read and write permission
    When I fill discount as "100"
#    And I click on "Save" button from top row