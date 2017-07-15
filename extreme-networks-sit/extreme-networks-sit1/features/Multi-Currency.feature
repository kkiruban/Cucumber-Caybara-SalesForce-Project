Feature: Multi Currency

  Background:
    And I should create new product record "smoke-test-prod-1" to test multi currency
    And I should create second new product record "smoke-test-prod-2" to test multi currency

  #And I should create new account record "Smoke_test_accounts_MC" as test data MC
  @multi-currency1 @All_Users_Multi_Currency
  Scenario: US-003963 Account
    Given I get "EUR" currency value from "Manage Currencies" tab from the application MC

  @multi-currency @All_Users_Multi_Currency
  Scenario: US-003963 Account
    Given I get "EUR" currency value from "Manage Currencies" tab from the application MC
    And I should create new opportunity record MC
    Given I should navigate to "Opportunities" tab in saleforce application MC
    Then I open the existing opportunity MC
    When I clicked the button "New Renewable Line Item" over the page MC
    Then I should see the field "Previous Local Currency Amount" over the page MC
    And I should see the field "Previous Local Currency Code" over the page MC
    And I enter data in all the required fields over Renewable Line Item page MC
    And I enter EUR capture value in Previous Local Currency Amount MC
    And I select "EUR" from "Previous Local Currency Code" picklist MC
    And I click save button over RLI page MC
    Then The "RLI" record should save seccessfully MC
    And I should see "1.05" in "Previous Local Currency Amount" field MC
    And I should see "EUR" in "Previous Local Currency Code" field MC
    #And I should see "EUR 100" in "Currency" field
    And I should see "USD 1.00" in "Previous Price" field MC
    And I should see "USD 1.00" in "Renewal Target" field MC
    When I click Renewal Opportunity link MC
    Then I should see Renewal Target column value as "USD 1.00" under RLI section MC
    When I click "Manage Renewals" button MC
    #Then I should see content "Renewal Relationship" MC
    And I should select the existing product MC
    And I click the link "Rebuild Opportunity" MC
    And I should see the product added in products related section MC
    When I click the newly added product under product section MC
    Then I should see the field "Local Currency Amount" over the page MC
    And I should see "EUR" in "Local Currency Code" field MC
    Then I should see the field "Local Currency" over the page MC
    And I should see "EUR 1.05" in "Local Currency" field MC
    When I click Renewal Opportunity link MC
    Then I should see the "Sales Price" column in "Products (Standard Price Book)" section MC
    And I should see the "Total Price" column in "Products (Standard Price Book)" section MC
    And I should see Total Price as "USD 1.00" under Products section MC
    When I should navigate to "Opportunities" tab in saleforce application MC
    Then I open the existing opportunity MC
    And I clicked the button "New Quote" over the page MC
    And I should see the field "Local Currency Code" is present under "Financial and Coverage Details" section MC
    And I enter data in quote detail page to create new quote MC
    And I select "EUR" from "Local Currency Code" dropdown MC
    When I click Save button from top button row MC
    Then The "Quote" record should save seccessfully MC
    Then I should see the field "Local Currency" over the page MC
    And I should see "EUR 1.05" in "Local Currency" field MC
    And I click "Add Line Item" button MC
    And I select existing product MC
    And I saved the product by entering quantity and sales price MC
    Then I should see the new product over quote detail page under quote line item section MC
    And I open the quote line item just created MC
    Then I should see the field "Local Currency Amount" over the page MC
    And I should see "1.05" in "Local Currency Amount" field MC
    Then I should see the field "Local Currency" over the page MC
    And I should see "EUR 1.05" in "Local Currency" field MC
    Then I should see the field "Local Currency Line Total" over the page MC
    And I should see "1.05" in "Local Currency Line Total" field MC
    When I click quote name from quote name field MC
    And I should see "EUR 2.1" in "Local Currency" field MC
    And I should see "USD 2.00" in "Total Price" field MC
    When I clicked on Start Sync button over the page MC
    And I click on "Sync" button MC
    And I click on "Done" button MC
    When I click Renewal Opportunity link MC
    Then I should see the field "Local Renewal Target" is present under "Opportunity Information" section MC
    And I should see "EUR 1.05" in "Local Renewal Target" field MC
    And I should see "Local Currency" column under "Quotes" section MC
