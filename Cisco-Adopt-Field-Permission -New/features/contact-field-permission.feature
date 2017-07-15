@cisco @contact-field-permission
Feature:
  As a tester
  We are verifying the field permission for contact entity

  @contact-field-permission-ops-manager
  Scenario: verify the role field permission for contacts
    Given I should login as a "OpsManager"
    When I wait for 5 seconds
    And I click on contacts tab
    And I follow on "New" button
    And I should verify role field permission for opsmanager user role
    And I should verify type field permission for opsmanager user role

 @contact-field-permission-OpsRep
  Scenario: verify the role field permission for contacts
    Given I should login as a "OpsRep"
    When I wait for 5 seconds
    And I click on contacts tab
    And I follow on "New" button
    And I should verify role field permission for OpsRep user role
    And I should verify type field permission for OpsRep user role

   @contact-field-permission-SalesManager
  Scenario: verify the role field permission for contacts
    Given I should login as a "SalesManager"
    When I wait for 5 seconds
    And I click on contacts tab
    And I follow on "New" button
    And I should verify role field permission for SalesManager user role
    And I should verify type field permission for SalesManager user role

   @contact-field-permission-SalesRep
  Scenario: verify the role field permission for contacts
    Given I should login as a "SalesRep"
    When I wait for 5 seconds
    And I click on contacts tab
    And I follow on "New" button
    And I should verify role field permission for SalesRep user role
    And I should verify type field permission for SalesRep user role

@contact-field-permission-SalesOps
  Scenario: verify the role field permission for contacts
    Given I should login as a "SalesOps"
    When I wait for 5 seconds
    And I click on contacts tab
    And I follow on "New" button
    And I should verify role field permission for SalesOps user role
    And I should verify type field permission for SalesOps user role
