@extreme @RLI
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-004239 @om-rli @or-rli
  Scenario: US-004170 Update RLI and RLI Picklist
    When I click on new button
    And I select opportunity edit from record type of new record
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    When I click on "New Renewable Line Item" button under renewable line item section
    Then I should see "Previous Local Currency" field with read and write permission
    Then I should see "Previous Local Currency Amount" field with read and write permission
    And I should see "Previous Local Currency Code" field with read and write permission
    And I should see Renewal Status picklist values
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    When I click on renewal opportunity link
    Then I should see content "Opportunity Detail"
    When I click on manage renewals button under renewable line item
    Then I should see content "Renewal Relationship"
    When I select any existing product line on the list
    And I click on rebuild opportunity link

   @US-US-004270-rli @all-users-rli
  Scenario: US-004270 Add new field for opportunity Product, RLI and verify in Opportunity

    ## ----------- Create Oppty Product,Renewal Line Item and  Verify the Fields -----------##

    When I click on new button
    And I select opportunity edit from record type of new record
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    When I click on "New Renewable Line Item" button under renewable line item section
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    When I click on the "Renewal Opportunity" link from "Renewable Line Item Detail" page
    Then I should see content "Opportunity Detail"
    Then I click on the Edit button from Renewable Line Item section of product
    Then I should see content "Renewable Line Item Edit"
    And I should see the field "Renewable Line Item ID" with RW permission only for ops role
    And I should see the field "Renewal Product Line ID" with RW permission only for ops role
    And I click on "Cancel" button from new "Renewable Line Item Edit" page
    Then I should see content "Opportunity Detail"
    When I click on the rli "Manage Renewals" button from "Opportunity Detail" page of RLI
    And I select the "Renewal Relationship" product field
    And I click on renewal relationship "Rebuild Opportunity" button
    And I should see content "Opportunity Detail"
    And I verify the Opportunity Product Line is added to "Products" related list
    And I click on the Opportunity Product Line in "Products" related list
    And I should see content "Opportunity Product Detail"
    When I click on the "Edit" button from "Opportunity Product Detail" page of RLI
    And I should see the field "Opportunity Product ID" with RW permission only for ops role
    And I should see the field "Up-Sell / Cross-Sell" with RW permission only for ops role
    And I should see the field "Renewable Line Item ID" with RW permission only for ops role
    And I should see "Up-Sell / Cross-Sell" field picklist options
    And I fill Renewable Line Item ID as "Renew-test123"
    And I select "Upsell" from "Up-Sell / Cross-Sell" picklist
    And I select "Renewal" from "Batch Type" picklist
    And I click Save button from top button row
    Then I should see content "Opportunity Detail"

    @US-004239 @sm-rli @sr-rli @so-rli
  Scenario: US-004239 Update RLI and RLI Picklist
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    Then I should see "Previous Local Currency" field with read and write permission
    Then I should see "Previous Local Currency Amount" field with read and write permission
    And I should see "Previous Local Currency Code" field with read and write permission
    And I should see Renewal Status picklist values
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    When I click on renewal opportunity link
    Then I should see content "Opportunity Detail"
    When I click on manage renewals button under renewable line item
    Then I should see content "Renewal Relationship"
    When I select any existing product line on the list
#    And I click on rebuild opportunity link