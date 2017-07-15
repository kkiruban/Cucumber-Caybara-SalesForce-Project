@oneplatform @create_data
Feature:
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test case

  @create_price_book
   Scenario: create a price book
   Given I should navigate to price book tab in saleforce application
   And I wait for 5 seconds
   When I follow on "New" button
   Then I should see content "New Price Book"
   When I fill price book name as "smoke-test-price-book"
   And I click on "Save" button from top row

  @create_account-prod
  Scenario Outline: create a account
    Given I should navigate to Accounts tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    Then I should see content "New Account"
    When I fill account name as "<account-name>"
    And I click on "Save" button from top row
    And I get the account name
    Then I should see content "Account Detail"

    Examples:
      | account-name          |
      | smoke-test-account-1- |
      | smoke-test-account-2- |
      | smoke-test-account-3- |
      | smoke-test-account-4- |
      | smoke-test-account-5- |

  @create_Contact_prod
  Scenario Outline: Creation of Contact
    Given I should navigate to "Contacts" tab in saleforce application
    When I follow on "New" button
    And I fill contact name as "<contact-name>"
    And I fill all mandatory fields to create a random new contact
    And I click on "Save" button from top row

    Examples:
      | contact-name          |
      | smoke-test-contact-1- |
      | smoke-test-contact-2- |
      | smoke-test-contact-3- |
      | smoke-test-contact-4- |
      | smoke-test-contact-5- |

  @create_opportunity_prod
  Scenario Outline: create new opportunity
    Given I should navigate to "Opportunities" tab in saleforce application
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see content "New Opportunity"
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    Then I should see content "Opportunity Edit"
    When I fill all mandantory fields to create a new opportunity
    And I fill opportunity name as "<opportunity-name>"
    And I wait for 5 seconds
    And I click on "Save" button from top row

    Examples:
      | opportunity-name          |
      | smoke-test-opportunity-1- |
      | smoke-test-opportunity-2- |
      | smoke-test-opportunity-3- |
      | smoke-test-opportunity-4- |
      | smoke-test-opportunity-5- |