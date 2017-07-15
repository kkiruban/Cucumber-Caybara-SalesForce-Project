@Alcon @general @Asst
Feature: General
  In order to verify and validate Assets test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to Assets tab in saleforce application

  @Asst01 @All-users-asst
  Scenario: Asst01 verify product line in asset module
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see content "Product Line"
    #   And I should see Product Line field picklist
#    And I should verify product line picklist values

  @Asst02 @All-users-asst
  Scenario: Asst02 verify SAP Equipment ID in asset module
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see SAP Equipment ID field

  @Asst03 @All-users-asst
  Scenario: Asst03 verify status picklist in asset module
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see status field picklist
    And I should verify status picklist values
    When I fill all mandantory fields to create new assets
    Then I click on "Save" button on top button row
    When I wait for 5 seconds
    Then I should see content "Asset Detail"
