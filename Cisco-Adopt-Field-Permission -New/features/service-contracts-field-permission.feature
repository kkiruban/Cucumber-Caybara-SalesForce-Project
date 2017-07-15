@cisco @service-contracts-field-permission
Feature:
  In order to validate tasks section
  As a tester
  I should validate the functionalities as per test case

  @service-contracts-field-permission
  Scenario: verify the description field permission for service contracts
    Given I should login as a "OpsManager"
    When I wait for 5 seconds
    And I click on service contracts tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Description field permission for opsmanager user role for service contracts entity
    And I should verify Client Territory field permission for opsmanager user role for service contracts entity
    And I should verify Client Segment field permission for opsmanager user role for service contracts entity
    And I should verify Country field permission for opsmanager user role for service contracts entity
    And I should verify Product field permission for opsmanager user role for service contracts entity
    And I should verify Cisco Contract Status field permission for opsmanager user role for service contracts entity
    And I should verify Deployment Status field permission for opsmanager user role for service contracts entity
    And I should verify Dtrack Case Number field permission for opsmanager user role for service contracts entity
    And I should verify Service Offering field permission for opsmanager user role for service contracts entity
    And I should verify Site ID-DS field permission for opsmanager user role for service contracts entity
    And I should verify Client Batch Year DS field permission for opsmanager user role for service contracts entity
    And I should verify Client Data Delivery Date field permission for opsmanager user role for service contracts entity
    And I should verify Client Batch Quarter field permission for opsmanager user role for service contracts entity
    And I should verify Product ID field permission for opsmanager user role for service contracts entity
    And I should verify Site ID field permission for opsmanager user role for service contracts entity
    And I should verify Client Batch Year field permission for opsmanager user role for service contracts entity

    @service-contracts-field-permission-OpsRep
  Scenario: verify the description field permission for service contracts
    Given I should login as a "OpsRep"
    When I wait for 5 seconds
    And I click on service contracts tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Description field permission for OpsRep user role for service contracts entity
    And I should verify Client Territory field permission for OpsRep user role for service contracts entity
    And I should verify Client Segment field permission for OpsRep user role for service contracts entity
    And I should verify Country field permission for OpsRep user role for service contracts entity
    And I should verify Product field permission for OpsRep user role for service contracts entity
    And I should verify Cisco Contract Status field permission for OpsRep user role for service contracts entity
    And I should verify Deployment Status field permission for OpsRep user role for service contracts entity
    And I should verify Dtrack Case Number field permission for OpsRep user role for service contracts entity
    And I should verify Service Offering field permission for OpsRep user role for service contracts entity
    And I should verify Site ID-DS field permission for OpsRep user role for service contracts entity
    And I should verify Client Batch Year DS field permission for OpsRep user role for service contracts entity
    And I should verify Client Data Delivery Date field permission for OpsRep user role for service contracts entity
    And I should verify Client Batch Quarter field permission for OpsRep user role for service contracts entity
    And I should verify Product ID field permission for OpsRep user role for service contracts entity
    And I should verify Site ID field permission for OpsRep user role for service contracts entity
    And I should verify Client Batch Year field permission for OpsRep user role for service contracts entity

    @service-contracts-field-permission-SalesManager
  Scenario: verify the description field permission for service contracts
    Given I should login as a "SalesManager"
    When I wait for 5 seconds
    And I click on service contracts tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Description field permission for SalesManager user role for service contracts entity
    And I should verify Client Territory field permission for SalesManager user role for service contracts entity
    And I should verify Client Segment field permission for SalesManager user role for service contracts entity
    And I should verify Country field permission for SalesManager user role for service contracts entity
    And I should verify Product field permission for SalesManager user role for service contracts entity
    And I should verify Cisco Contract Status field permission for SalesManager user role for service contracts entity
    And I should verify Deployment Status field permission for SalesManager user role for service contracts entity
    And I should verify Dtrack Case Number field permission for SalesManager user role for service contracts entity
    And I should verify Service Offering field permission for SalesManager user role for service contracts entity
    And I should verify Site ID-DS field permission for SalesManager user role for service contracts entity
    And I should verify Client Batch Year DS field permission for SalesManager user role for service contracts entity
    And I should verify Client Data Delivery Date field permission for SalesManager user role for service contracts entity
    And I should verify Client Batch Quarter field permission for SalesManager user role for service contracts entity
    And I should verify Product ID field permission for SalesManager user role for service contracts entity
    And I should verify Site ID field permission for SalesManager user role for service contracts entity
    And I should verify Client Batch Year field permission for SalesManager user role for service contracts entity

    @service-contracts-field-permission-SalesRep
  Scenario: verify the description field permission for service contracts
    Given I should login as a "SalesRep"
    When I wait for 5 seconds
    And I click on service contracts tab
    And I follow on "New" button
    And I wait for 5 seconds
    And I should verify Description field permission for SalesRep user role for service contracts entity
    And I should verify Client Territory field permission for SalesRep user role for service contracts entity
    And I should verify Client Segment field permission for SalesRep user role for service contracts entity
    And I should verify Country field permission for SalesRep user role for service contracts entity
    And I should verify Product field permission for SalesRep user role for service contracts entity
    And I should verify Cisco Contract Status field permission for SalesRep user role for service contracts entity
    And I should verify Deployment Status field permission for SalesRep user role for service contracts entity
    And I should verify Dtrack Case Number field permission for SalesRep user role for service contracts entity
    And I should verify Service Offering field permission for SalesRep user role for service contracts entity
    And I should verify Site ID-DS field permission for SalesRep user role for service contracts entity
    And I should verify Client Batch Year DS field permission for SalesRep user role for service contracts entity
    And I should verify Client Data Delivery Date field permission for SalesRep user role for service contracts entity
    And I should verify Client Batch Quarter field permission for SalesRep user role for service contracts entity
    And I should verify Product ID field permission for SalesRep user role for service contracts entity
    And I should verify Site ID field permission for SalesRep user role for service contracts entity
    And I should verify Client Batch Year field permission for SalesRep user role for service contracts entity

    @service-contracts-field-permission-SalesOps
  Scenario: verify the description field permission for service contracts
    Given I should login as a "SalesOps"
    When I wait for 5 seconds
    And I click on service contracts tab
    When I wait for 5 seconds
    And I click on existing service contract
    And I wait for 5 seconds
    And I should verify Description field permission for SalesOps user role for service contracts entity
    And I should verify Client Territory field permission for SalesOps user role for service contracts entity
    And I should verify Client Segment field permission for SalesOps user role for service contracts entity
    And I should verify Country field permission for SalesOps user role for service contracts entity
    And I should verify Product field permission for SalesOps user role for service contracts entity
    And I should verify Cisco Contract Status field permission for SalesOps user role for service contracts entity
    And I should verify Deployment Status field permission for SalesOps user role for service contracts entity
    And I should verify Dtrack Case Number field permission for SalesOps user role for service contracts entity
    And I should verify Service Offering field permission for SalesOps user role for service contracts entity
    And I should verify Site ID-DS field permission for SalesOps user role for service contracts entity
    And I should verify Client Batch Year DS field permission for SalesOps user role for service contracts entity
    And I should verify Client Data Delivery Date field permission for SalesOps user role for service contracts entity
    And I should verify Client Batch Quarter field permission for SalesOps user role for service contracts entity
    And I should verify Product ID field permission for SalesOps user role for service contracts entity
    And I should verify Site ID field permission for SalesOps user role for service contracts entity
    And I should verify Client Batch Year field permission for SalesOps user role for service contracts entity