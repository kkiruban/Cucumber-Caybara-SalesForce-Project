@Guidance @create_data
Feature:
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test case

#  Background:
#    Given I should navigate to "Home" tab in saleforce application

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
    And I fill contact name as "<contact-name>"
    And I click on "Save" button from top row

    Examples:
      | contact-name          |
      | smoke-test-contact-1- |
      | smoke-test-contact-2- |
      | smoke-test-contact-3- |
      | smoke-test-contact-4- |
      | smoke-test-contact-5- |