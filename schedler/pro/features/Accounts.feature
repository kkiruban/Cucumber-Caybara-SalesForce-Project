@Accounts_feature
Feature: All scenarios related to Accounts feature

  Background: Login to the Application
    Given I login to the "Schneider" application
    Then I able to see the logged in to "Schneider" application


  @US-003802 @OpsMgr_accounts @OpsRep_accounts @SalesMgr_accounts @SalesRep_accounts @Admin_accounts @SalesOps_accounts
  Scenario: Add new fields to the Account page layout
    When I click on the "Accounts" tab
    Then I able to see the "Accounts" page
    When I click on the "New" button
    Then I able to see the "Account Edit" page
    And I verify new account field
    And I verify "Account Zip Code" field should be visible
    And I verify "Account Zip Code" text field with valid edit permissions


  @US-003802 @OpsMgr_accounts @OpsRep_accounts @SalesMgr_accounts @SalesRep_accounts @Admin_accounts @SalesOps_accounts
  Scenario: Update Type pickList
    When I click on the "Accounts" tab
    Then I able to see the "Accounts" page
    When I click on the "New" button
    Then I able to see the "Account Edit" page
    And I verify the "Type" pickList
    And I able to see the "Type" pickList values

   @US-003868-account @OpsMgr_accounts @OpsRep_accounts @SalesMgr_accounts @SalesRep_accounts @Admin_accounts @SalesOps_accounts
  Scenario: US-003868 Default value
    When I click on the "Accounts" tab
    Then I able to see the "Accounts" page
    When I click on the "New" button
    Then I able to see the "Account Edit" page
    And I verify the "Type" pickList
    And I able to see the "Type" pickList values
    And I should verify Sales center field with default value
    When I fill random account name
    And I click on "Save" button from top row