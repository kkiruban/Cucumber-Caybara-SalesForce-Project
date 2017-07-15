@oneplatform @opportunities @create_data
Feature:
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test case

  @create_account
  Scenario: create a account
    Given I should navigate to Accounts tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    Then I should see content "New Account"
    When I fill random account name under account information
    And I click on "Save" button from top row
    And I get the account name
    Then I should see content "Account Detail"

  @create_Contact
  Scenario: Creation of Contact
    Given I should navigate to "Contacts" tab in saleforce application
    When I follow on "New" button
    Then I should see content "New Contact"
    And I should see content "Contact Edit"
    When I fill all mandatory fields to create a random new contact
    And I click on "Save" button from top row

  @create_quote
  Scenario: create new Quote
    Given I should navigate to "Quotes" tab in saleforce application
    When I follow on "New" button
    And I fill value for all mandatory field to create quote
    And I enter value "GBP" in currency field
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"

  @create_opportunity
  Scenario: create new opportunity
    Given I should navigate to "Opportunities" tab in saleforce application
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see content "New Opportunity"
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    Then I should see content "Opportunity Edit"
    When I fill required values for mandantory fields to create a new opportunity
    And I wait for 5 seconds
    And I click on "Save" button from top row

  @create_new_account
  Scenario: create Test data create new account record
    When I create new account test record "smoke Test-Account-"
    And I create new success plan
    And I create new Service Contracts
    And I create new Survey Responses
    And I created Activity History record
    And I created New Task

  @create_account_task @nalaCreateData
  Scenario: create a new account
    Given I should navigate to "Accounts" tab
    When I click on new button
    Then I should see content "New Account"
    And I enter data to fields under new account section
    Then I click on "Save" button from top row
    Then I should see content "Account Detail"

  @create_contacts_task @nalaCreateData
  Scenario: create a new contact
   Given I should navigate to "Contacts" tab
   When I click on new button
   Then I should see content "New Contact"
   And I enter data to reqired fields under new contacts section
   Then I click on "Save" button from top row
   Then I should see content "Contact Detail"
   And I note the contact name created above

#  @create_pice_book_task @nalaCreateData
#  Scenario: create a new price book
#   Given I should navigate to "Price Books" tab
#   When I click on new button
#   Then I should see content "New Price Book"
#   And I enter data to reqired fields under new price book section
#   Then I click on "Save" button from top row
#   Then I should see content "Price Book Detail"

  @create_opportunity_task @nalaCreateData
  Scenario: create a new opportunity
   Given I should navigate to "Opportunities" tab
   When I click on new button
   Then I select opportunity edit from record type of new record
   Then I should see content "New Opportunity"
   And I enter data to reqired fields under new opportunity section
   Then I click on "Save" button from top row
   Then I should see content "Opportunity Detail"
