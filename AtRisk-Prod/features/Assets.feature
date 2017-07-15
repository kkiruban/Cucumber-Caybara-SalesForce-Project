@AtRisk @Asst
Feature: General
  In order to verify and validate Assets test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to Assets tab in saleforce application

  @Assets-01 @om-assets @or-assets @sm-assets @sr-assets
  Scenario: Assets-01 Added Product Line to asset
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see "Product Line" field with read only permission
    When I fill all mandantory fields to create new assets
    And I click on "Save" button from top row
    Then I should see content "Asset Detail"
    When I get the created asset name
    And I logout from the current user
    And I login as "admin"
    And I wait for 5 seconds
    And I search recently created asset and click on asset name
    And I click on "Edit" button from top row
    Then I should see product line picklist
    