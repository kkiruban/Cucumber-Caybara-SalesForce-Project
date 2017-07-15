Feature: Quote

  Background:
    #Given I should create second new product record "smoke-test-prod-2" to test multi currency
    #And I should create new account record "Smoke_test_accounts_MC" as test data MC
    Given I should navigate to opportunity tab in saleforce application

  @US-004237 @All_Users_Quote
  Scenario: US-004237 Update Quote  and Quote  Picklist    
    And I should create new opportunity record MC
    Given I should navigate to "Opportunities" tab in saleforce application MC
    Then I open the existing opportunity MC
    And I clicked the button "New Quote" over the page MC
    And I should see the field "Local Currency Code" is present under "Financial and Coverage Details" section MC
    And I should see the field "Local Currency Code" in left column
    And I should see the field "Local Currency Code" with RW permission except salesops
    And I should see "Local Currency Code" field picklist options
    And I should see the field "Local Currency Code" is present under "Renewal Relationship" section
    And I enter data in all the mandatory field over quote detail page to create new quote    
    When I click Save button from top button row MC
    Then The "Quote" record should save seccessfully MC
    And I click Edit button from top button row
    Then I should see the field Local Currency with Read Only permission
    And I should see the field "Local Currency" is present under "Renewal Relationship" section
    When I click Save button from top button row MC
    Then The "Quote" record should save seccessfully MC
    And I click "Add Line Item" button MC
    And I select existing product MC
    And I saved the product by entering quantity and sales price MC
    Then I should see the new product over quote detail page under quote line item section MC
    And I open the quote line item just created MC
    When I click quote name from quote name field MC
    When I clicked on Start Sync button over the page MC
    And I click on "Sync" button MC
    And I click on "Done" button MC
    
  @US-US-004270 @All_Users_Quote
  Scenario: US-US-004270 Add new field for Quote Line Item page layout   
    And I should create new opportunity record MC
    Given I should navigate to "Opportunities" tab in saleforce application MC
    Then I open the existing opportunity MC
    And I clicked the button "New Quote" over the page MC
    And I enter data in all the mandatory field over quote detail page to create new quote    
    When I click Save button from top button row MC
    Then The "Quote" record should save seccessfully MC
    And I click "Add Line Item" button MC
    And I select existing product MC
    And I saved the product by entering quantity and sales price MC
    Then I should see the new product over quote detail page under quote line item section MC
    And I open the quote line item just created MC
    And I click Edit button from top button row
    And I should see the field "Up-Sell / Cross-Sell" is present under "Quote Line Item Information" section MC
    And I should see the field "Up-Sell / Cross-Sell" with RW permission only for ops role
    And I should see "Up-Sell / Cross-Sell" field picklist options
    
@US-smoketest01-rbp @All_Users_Quote
  Scenario: US-US-004270 Roll bacl Partner information on to Quote

  #-------- Create Oppty and Related Line item and then create Partner Oppty and verify the partner related information is rolled to quote -------#

    When I click on new button
    And I select opportunity edit from record type of new record
    When I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    When I click on "New Renewable Line Item" button under renewable line item section
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    And I click on the Opportunity Name link from Partner Opportunity Detail page
    Then I should see content "Opportunity Detail"
    When I click on the rli "Add New Partner Opportunity" button from "Opportunity Detail" page of RLI
    When I enter data to all mandatory fields under Add Partner Opportunity section
    And I click on "Grant Access" button in partner oppty
    Then I should see content "Partner Opportunity Detail"
    And I click on the Opportunity Name link from Partner Opportunity Detail page
    Then I should see content "Opportunity Detail"
    When I click on the Edit button from Quotes Related list
    Then I should see content "Partner Information"
    And I should see Partneroppty name as opptyname





   


    


