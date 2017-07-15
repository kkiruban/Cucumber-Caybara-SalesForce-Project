@Guidance @accounts
Feature: General
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Accounts" tab in saleforce application

@Acc-01 @All-Users_Accounts
 Scenario: Acc-01 create new account
  Given I follow on "New" button
  And I enter value to all the mandatory field
  Then I click on "Save" button from top row

@Acc-02 @All-Users_Accounts
 Scenario: Acc-02 validate currency picklist
  Given I follow on "New" button
  Then I check the picklist value of account currency field
  And I select picklist value for account currency field

@Acc-03 @All-Users_Accounts
 Scenario: Acc-03 validate industry picklist
  Given I follow on "New" button
  And I check the picklist value of industry field
  Then I select picklist value for industry field

@Acc-04 @All-Users_Accounts
 Scenario: Acc-04 Verify Type field
  Given I follow on "New" button
  And I check the picklist value of type field
  Then I select picklist value for type field
    
@Acc-05 @All-Users_Accounts
 Scenario: Acc-05 Verify Channel Tier field
  Given I follow on "New" button
  And I check that "Channel Tier" is visible and editable
  And I check the picklist value of channel tier field
  Then I select picklist value for channel tier field




