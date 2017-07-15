@cisco @survey-response-field-permission
Feature:
  In order to validate tasks section
  As a tester
  I should validate the functionalities as per test case

  @survey-response-field-permission
  Scenario: verify the description field permission for suvery response
    Given I should login as a "OpsManager"
    When I wait for 5 seconds
    And I click on Survey Response tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Account field permission for opsmanager user role
    And I should verify Date Completed field permission for opsmanager user role
    And I should verify Time Completed field permission for opsmanager user role
    And I should verify Link to Survey field permission for opsmanager user role
    And I should verify Taken By field permission for opsmanager user role
    And I should verify Product field permission for opsmanager user role

  @survey-response-field-permission
  Scenario: verify the description field permission for suvery response
    Given I should login as a "SalesManager"
    When I wait for 5 seconds
    And I click on Survey Response tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Account field permission for SalesManager user role
    And I should verify Date Completed field permission for SalesManager user role
    And I should verify Time Completed field permission for SalesManager user role
    And I should verify Link to Survey field permission for SalesManager user role
    And I should verify Taken By field permission for SalesManager user role
    And I should verify Product field permission for SalesManager user role

  @survey-response-field-permission
  Scenario: verify the description field permission for suvery response
    Given I should login as a "SalesRep"
    When I wait for 5 seconds
    And I click on Survey Response tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Account field permission for SalesRep user role
    And I should verify Date Completed field permission for SalesRep user role
    And I should verify Time Completed field permission for SalesRep user role
    And I should verify Link to Survey field permission for SalesRep user role
    And I should verify Taken By field permission for SalesRep user role
    And I should verify Product field permission for SalesRep user role

  @survey-response-field-permission
  Scenario: verify the description field permission for suvery response
    Given I should login as a "SalesOps"
    When I wait for 5 seconds
    And I click on Survey Response tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Account field permission for SalesOps user role
    And I should verify Date Completed field permission for SalesOps user role
    And I should verify Time Completed field permission for SalesOps user role
    And I should verify Link to Survey field permission for SalesOps user role
    And I should verify Taken By field permission for SalesOps user role
    And I should verify Product field permission for SalesOps user role
