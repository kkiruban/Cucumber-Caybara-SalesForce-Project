@Extreme-Network @opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-004168 @All-users-opp
  Scenario: US-004168 Update Opportunity and Opportunity Picklist
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see "F5 Revenue" field with read only permission
    And I should see "Client Sales Stage" field with read and write permission
    And I should see "Forecast" field with read and write permission
    And I should see "MSRP" field with read only permission
    And I should see "Direct/Channel" field with read and write permission
    And I should see "Exisiting PO Number" field with read and write permission
    And I should see "First Contact Date" field with read and write permission
    And I should see "Consolidated" field with read and write permission
    And I should see "Estimated Close Date" field with read and write permission
    And I should see "Product Line" field with read and write permission
    And I should see "SFDC Identifier" field with read and write permission
    And I should see "Existing Contract Number" field with read and write permission
    And I should see "New Contract Number" field with read and write permission
    And I should see "Exisiting PO Number" field with read and write permission
    And I should see "First Contact Date" field with read only permission
    And I should see Client Territory picklist values
    And I should see Client Region picklist values
    And I should see Country picklist values
    And I should see Client sales stage picklist values
    And I should see Forecast picklist values
    And I should see Direct/Channel picklist values
    And I should see business line picklist values
    And I should see Opportunity Type picklist values
    But I should not see "Sales Target" field
    And I should not see "Probability" field
    And I should not see "Opportunity Location" field
    And I should not see "Destination Renewal Opportunnity" field
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row

   @US-004168 @so-opp
  Scenario: US-004168 Update Opportunity and Opportunity Picklist
    When I click on new button
#    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    When I enter data to required fields under new opportunity section for sales ops
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"

 @US-004170 @all-users-rli
  Scenario: US-004170 Update RLI and RLI Picklist
    When I click on new button
    And I select opportunity edit from record type of new record
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    When I click on "New Renewable Line Item" button under renewable line item section
    Then I should see "Existing Product Description" field with read and write permission
    But I should not see "Discount" field
    Then I should see "Actual Quantity" field with read and write permission
    And I should see "Discount Status" field with read and write permission
    And I should see "Previous Line Discount" field with read and write permission
    And I should see "Client System ID" field with read and write permission
    And I should see "Parent Serial Number" field with read and write permission
    And I should see "Renewal Type" field with read and write permission
    And I should see "Contract Line Item" field with read and write permission
    And I should see "Activation Status" field with read and write permission
    And I should see "End of Technical Support" field with read and write permission
    And I should see "Contract Modifier" field with read and write permission
    And I should see "Late Data Received" field with read and write permission
    And I should see Renewal Status picklist values
    And I should see Renewal Type picklist values
    And I should see Discount Status picklist values
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    When I click on renewal opportunity link
#    When I click on renewal opportunity under renewable line item detail section
    Then I should see content "Opportunity Detail"
    When I click on manage renewals button under renewable line item
    Then I should see content "Renewal Relationship"
    When I select any existing product line on the list
#    When I check existinig product in renewal relationship page
    And I click on rebuild opportunity link

 @US-US-004270-rli @all-users-rli-jay
  Scenario: US-004270 Add new field for opportunity Product, RLI and verify in Opportunity

    ## ----------- Create Oppty Product,Renewal Line Item and  Verify the Fields -----------##

    #When I click on new button
    #And I select opportunity edit from record type of new record
    #When I enter data to required fields under new opportunity section
    #And I click on "Save" button from top row
    And I should create new opportunity record MC
    Given I should navigate to "Opportunities" tab in saleforce application MC
    Then I open the existing opportunity MC
    Then I should see content "Opportunity Detail"
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


@US-004255-oppty @All-users-opp-jay
  Scenario: US-004255 Add new field for opportunity Product, RLI and verify in Opportunity

    ## ----------- Create Partner Oppty and Partner RLI and verify Fields -----------##

    #When I click on new button
    #And I select opportunity edit from record type of new record
    #When I enter data to required fields under new opportunity section
    #And I click on "Save" button from top row
    And I should create new opportunity record MC
    Given I should navigate to "Opportunities" tab in saleforce application MC
    Then I open the existing opportunity MC
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
    

@US-004313-oppty @All-users-opp-jay
  Scenario: Verify Client Subregion picklist values

    ## ----------- Client Subregion picklist values should be populated based on Client Region Picklist values----##

    When I click on new button
    And I select opportunity edit from record type of new record
    And I should create new opportunity record MC
    Given I should navigate to "Opportunities" tab in saleforce application MC
    Then I open the existing opportunity MC
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
    And I should see "Forecast Category" field permission editable for all users except salesOPs

























    





    






    






    


 

