@oneplatform @opportunities @create_data
Feature:
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @create_account_task @WebExCreateData
  Scenario: create a new account
    Given I should navigate to "Accounts" tab
    When I click on new button
    Then I should see content " New Account"
    And I enter data to fields under new account section
    Then I click on "Save" button from top row
    Then I should see content "Account Detail"

  @create_contacts_task @WebExCreateData
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
  @create_opportunity_task @WebExCreateData
  Scenario: create a new opportunity
    Given I should navigate to "Opportunities" tab
    When I click on new button
    Then I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I enter data to reqired fields under new opportunity section
    Then I click on "Save" button from top row
    Then I should see content "Opportunity Detail"

  @create_new_account
  Scenario: create account
    When I create new account test record "PES_Account3_"
    And I create new Survey Responses
    And I created Activity History record
    And I created New Task
    And I create new lead
    And I create new success plan
