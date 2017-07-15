@Accounts_feature
Feature: All scenarios related to Accounts feature

  Background: Login to the Application
    Given I login to the "AtRisk" application
    Then I able to see the logged in to "AtRisk" application



  @US-003821 @OpsMgr_accounts @OpsRep_accounts @SalesMgr_accounts @SalesRep_accounts @Admin_accounts @SalesOps_accounts
  Scenario: Added "Sic" field to the layout
    When I click on the "Accounts" tab
    Then I able to see the "Accounts" page
    When I click on the "New" button
    Then I able to see the "Account Edit" page
    And I verify new account field
    And I verify "SIC Code" field should be visible
    And I verify "SIC Code" text field with valid edit permissions
    And I verify "Channel" is not include in the page
    And I should not able to see the "Channel" section visible
    And I enter account required fields
    And I click on "Save" button from new "Contacts Edit" page
    Then I able to see the account created successfully


  @US-003823 @OpsMgr_accounts @OpsRep_accounts @SalesMgr_accounts @SalesRep_accounts @Admin_accounts @SalesOps_accounts
  Scenario: Added custom values to Industry
    When I click on the "Accounts" tab
    Then I able to see the "Accounts" page
    When I click on the "New" button
    Then I able to see the "Account Edit" page
    And I verify the "Industry" pickList
    And I able to see the "Industry" pickList values


