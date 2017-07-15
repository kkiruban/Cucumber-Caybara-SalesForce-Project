@Extreme-Network @opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

   @US-004235 @om-opp @or-opp
  Scenario: US-004168 Update Opportunity and Opportunity Picklist
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see "Client Opportunity Name" field with read and write permission for OpsManager and OpsRep user
    And I should see "Client Contract Number" field with read and write permission for OpsManager and OpsRep user
    And I should see "Existing PO Number" field with read and write permission for OpsManager and OpsRep user
    And I should see "Booking Type" field with read and write permission for OpsManager and OpsRep user
    And I should see "Estimated Close Date" field with read and write permission for all except salesops user
    And I should see "Client Sales Stage" field with read and write permission for all users
    And I should see "Booking Type" field with read and write permission for OpsManager and OpsRep user
    And I should see "Partner Account 1" field with read and write permission for OpsManager and OpsRep user
    And I should see "Partner Account 1 Contact" field with read and write permission for OpsManager and OpsRep user
    And I should see "Partner Account 1 Type" field with read and write permission for OpsManager and OpsRep user
    And I should see "Incumbent" field with read and write permission for OpsManager and OpsRep user
    And I should see "Partner Account 2" field with read and write permission for OpsManager and OpsRep user
    And I should see "Partner Account 2 Type" field with read and write permission for OpsManager and OpsRep user
    And I should see "Partner Account 2 Contact" field with read and write permission for OpsManager and OpsRep user
    And I should see Client Territory picklist values
    And I should see Client Region picklist values
    And I should see Client sales stage picklist values
    And I should see Forecast picklist values
    And I should see "Forecast Category" field with read and write permission for OpsManager and OpsRep user
    And I should see Direct/Channel picklist values
    And I should see Booking Type picklist values
    And I should see Opportunity Type picklist values
    And I should see Partner Account 2 Type picklist values
    And I should see Partner Account 1 Type picklist values
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row

   @US-004235 @sr-opp @sm-opp
  Scenario: US-003857 Opportunity Flex and Custom Fields
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    And I click on "Edit" button from top row
    And I select "No Service" from stage field in new opportunity page
    And I click on Save button from top row in new opportunity page
    Then I should see content "Error: Invalid Data."


@US-004255-oppty @All-users-opp
  Scenario: US-004270 Add new field for opportunity Product, RLI and verify in Opportunity

    ## ----------- Create Partner Oppty and Partner RLI and verify Fields -----------##

    When I click on new button
    And I select opportunity edit from record type of new record
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    When I click on the rli "Add New Partner Opportunity" button from "Opportunity Detail" page of RLI
    When I enter data to all mandatory fields under Add Partner Opportunity section
    And I click on "Grant Access" button in partner oppty
    Then I should see content "Partner Opportunity Detail"
    And I click on the Opportunity Name link from Partner Opportunity Detail page
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    And I click on the Opportunity Name link from Partner Opportunity Detail page
    Then I should see content "Opportunity Detail"
    Then I click on the Edit button from Renewable Line Item section of product
    And I save the relationship id value to the variable
    And I click on "Cancel" button from new "Renewable Line Item Edit" page
    Then I click on the Partner Opportunity link from Partner Opportunities section
    When I click on the rli "New Partner Renewable Line Item" button from "Partner Opportunity Detail" page of RLI
    Then I should see content "Partner Renewable Line Item Edit"
    And I fill the Renewal Relationship lookup
    And I click Save button from top button row
    

@US-004313-oppty @All-users-opp
  Scenario: Verify Client Subregion picklist values

    ## ----------- Client Subregion picklist values should be populated based on Client Region Picklist values----##

    When I click on new button
    And I select opportunity edit from record type of new record
    Then I verify Client Region picklist values as Education-K12
    And I verify Client Region picklist values as Named Hospitality
    And I verify Client Region picklist values as Named RetailTransportation and Logistics
    And I verify Client Region picklist values as Strategic Accounts and Segments
    And I verify Client Region picklist values as US Territories
    And I verify Client Region picklist values as LATAM
    And I verify Client Region picklist values as Multivalues1
    And I verify Client Region picklist values as Multivalues2
    And I verify Client Region picklist values as Multivalues3
    And I verify Client Region picklist values as Multivalues4
    And I verify Client Region picklist values as Multivalues5
    And I verify Client Region picklist values as Multivalues6