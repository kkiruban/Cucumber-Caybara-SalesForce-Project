@schneider @general @Asst
Feature: General
  In order to verify and validate Assets test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to Assets tab in saleforce application

  @US-003803 @admin-asset @opsmanager-asset @opsrep-asset
  Scenario: US-003803 Add new fields to Asset page layout
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see territory field under contact field
    And I should see eopl field under territory field
    And I should see eosl field under eopl field
    And I should see Engagement Type field under Covered Asset field
    And I should see Service Sales Owner field
    And I should see Warranty End Date field
    When I fill all mandantory fields to create new assets
    And I click on "Save" button from top row
    Then I should see content "Asset Detail"

  @US-003803 @salesmanager-asset @salesrep-asset
  Scenario: US-003803 Add new fields to Asset page layout
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see "Territory" field with read only permission
    And I should see "EOPL" field with read only permission
    And I should see "EOSL" field with read only permission
    And I should see "Engagement Type" field with read only permission
    And I should see "Service Sales Owner" field with read only permission
    And I should see "Warranty End Date" field with read only permission
    When I fill all mandantory fields to create new assets
    And I click on "Save" button from top row
    Then I should see content "Asset Detail"

  @US-003834 @admin-asset @opsmanager-asset @opsrep-asset @salesmanager-asset @salesrep-asset
  Scenario: US-003834 Add Operating Status Active to Asset page layout
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see Operating Status active checkbox
    When I fill all mandantory fields to create new assets
    And I click on "Save" button from top row
    Then I should see content "Asset Detail"

  @US-003835 @admin-asset @opsmanager-asset @opsrep-asset @salesmanager-asset @salesrep-asset
  Scenario: US-003835 Update Status picklist
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see status picklist values
    When I fill all mandantory fields to create new assets
    And I click on "Save" button from top row
    Then I should see content "Asset Detail"

  @US-003868-assets @admin-asset @opsmanager-asset @opsrep-asset @salesmanager-asset @salesrep-asset
  Scenario: US-003868 Default value
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see Asset Currency field with default value
    When I fill all mandantory fields to create new assets
    And I click on "Save" button from top row
    Then I should see content "Asset Detail"

  @US-003836 @admin-asset @opsmanager-asset @opsrep-asset @salesmanager-asset @salesrep-asset
  Scenario: US-003836 Update Asset Currency picklist
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see Asset Currency picklist values
    When I fill all mandantory fields to create new assets
    And I click on "Save" button from top row
    Then I should see content "Asset Detail"
    