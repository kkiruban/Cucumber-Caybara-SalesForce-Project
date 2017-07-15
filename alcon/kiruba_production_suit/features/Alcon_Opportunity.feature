@Alcon-opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  @Opp-01 @All-Users_Opportunity
  Scenario: Opp-01 validate new button for opportunity related list
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    Then I should see content "New Opportunity"
    And I enter data to reqired fields under new opportunity section
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"

  @Opp-02 @All-Users_Opportunity
  Scenario: Opp-02 removed channel sections from account contact opportunity and asset
    Given I should navigate to "Opportunities" tab in saleforce application
    When I click on new button
    Then I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I check that the "Channel" section is removed from "Opportunity Edit"

  @Opp-03 @All-Users_Opportunity
  Scenario: Opp-03 create new quotes
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    And I enter data to reqired fields under new opportunity section
    And I click on "Save" button from top row
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"

  @Opp-04 @All-Users_Opportunity
  Scenario: Opp-04 create quote line items
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    And I enter data to reqired fields under new opportunity section
    And I click on "Save" button from top row
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    And I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
    And I enter start date field value
    And I enter end date field value
    And I enter quantity field value
    And I enter sales price field value
    And I select value from batch type field
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"

  @Opp-05 @All-Users_Opportunity
  Scenario: Opp-05 sync quote
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    And I enter data to reqired fields under new opportunity section
    And I click on "Save" button from top row
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    And I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
    And I note the product name under add quote line items to section
    And I enter start date field value
    And I enter end date field value
    And I enter quantity field value
    And I enter sales price field value
    And I select value from batch type field
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row
    And I click on "Sync" button
    And I click on "Done" button
    Then I should see content "Quote Detail"
    And I click on opportunity name link
    Then I check that new line items added is be visible under products related list

  @Opp-06 @All-Users_Opportunity
  Scenario: Opp-06 create renewable line item
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    And I enter data to reqired fields under new opportunity section
    And I click on "Save" button from top row
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    And I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
    And I note the product name under add quote line items to section
    And I enter start date field value
    And I enter end date field value
    And I enter quantity field value
    And I enter sales price field value
    And I select value from batch type field
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row
    And I click on "Sync" button
    And I click on "Done" button
    Then I should see content "Quote Detail"
    And I click on opportunity name link
    Then I check that new line items added is be visible under products related list
    And I click on "New Renewable Line Item" button under renewable line item section
    And I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"

  @Opp-07 @All-Users_Opportunity
  Scenario: Opp-07 added existing contract number to renewable line item page layout
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    And I enter data to reqired fields under new opportunity section
    And I click on "Save" button from top row
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    And I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
    And I note the product name under add quote line items to section
    And I enter start date field value
    And I enter end date field value
    And I enter quantity field value
    And I enter sales price field value
    And I select value from batch type field
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row
    And I click on "Sync" button
    And I click on "Done" button
    Then I should see content "Quote Detail"
    And I click on opportunity name link
    Then I check that new line items added is be visible under products related list
    And I click on "New Renewable Line Item" button under renewable line item section
    And I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    And I click on "Edit" button from top row
    Then I check that existing contract number field is visible

  @Opp-08 @All-Users_Opportunity
  Scenario: Opp-08 updated result reason picklist values
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    And I enter data to reqired fields under new opportunity section
    And I click on "Save" button from top row
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    And I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
    And I note the product name under add quote line items to section
    And I enter start date field value
    And I enter end date field value
    And I enter quantity field value
    And I enter sales price field value
    And I select value from batch type field
    And I click on "Save" button under add quote line items to page
    Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row
    And I click on "Sync" button
    And I click on "Done" button
    Then I should see content "Quote Detail"
    And I click on opportunity name link
    Then I check that new line items added is be visible under products related list
    And I click on "New Renewable Line Item" button under renewable line item section
    And I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    And I click on "Edit" button from top row
    Then I check that SSI Result Reason field is visible
    Then I check the SSI Result Reason picklist values
    