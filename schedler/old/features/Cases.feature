@Cases_feature
Feature: All scenarios related to Cases feature

  Background: Login to the Application
    Given I login to the "Schneider" application
    Then I able to see the logged in to "Schneider" application


  @US-003811 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases @Admin_cases @SalesOps_cases
  Scenario: Case types required for all persona
#    Given I should navigate to Cases tab in saleforce application
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" cases pickList fields


  @US-003811 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases @Admin_cases @SalesOps_cases
  Scenario: Booking Request
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Booking Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Booking Request" case created successfully


  @US-003811 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases @Admin_cases @SalesOps_cases
  Scenario: Lead Submission
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Lead Submission" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields to create new lead submission
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Lead Submission" case created successfully


  @US-003811 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases @Admin_cases @SalesOps_cases
  Scenario: Quote Request
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Quote Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields to create a new quote request
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Quote Request" case created successfully


  @US-003811 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases @Admin_cases @SalesOps_cases
  Scenario: Reporting Request
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Reporting Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields to create reporting request
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Reporting Request" case created successfully


  @US-003811 @OpsMgr_cases @OpsRep_cases
  Scenario: Data Update Request
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields to data update request
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" case created successfully



  @US-003811 @OpsMgr_cases @OpsRep_cases
  Scenario: Update case "Priority=Low"
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "Low"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" case created successfully
    And I able to see the "Case Detail" content
    And I able to see the "Case Milestones" content
    And I able to see the "NALA 24hrs" content
    And I able to see the "Target Date" content
    And I verify the "Target Date" should be "48 Hours"



  @US-003811 @OpsMgr_cases @OpsRep_cases
  Scenario: Update case "Priority=Normal"
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "Normal"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" case created successfully
    And I able to see the "Case Detail" content
    And I able to see the "Case Milestones" content
    And I able to see the "NALA 24hrs" content
    And I able to see the "Target Date" content
    And I verify the "Target Date" should be "24 Hours"



  @US-003811 @OpsMgr_cases @OpsRep_cases
  Scenario: Update case "Priority=High"
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "High"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" case created successfully
    And I able to see the "Case Detail" content
    And I able to see the "Case Milestones" content
    And I able to see the "NALA 24hrs" content
    And I able to see the "Target Date" content
    And I verify the "Target Date" should be "12 Hours"


  @US-003811 @OpsMgr_cases @OpsRep_cases
  Scenario: Update "Case Sub Type = HA/HS"
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "High"
    And I select the "HA - Cancelled - CNL" from "Renewal Status"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" created renewal case
    And I able to see the "Lock" icon next to "Edit" button
    And I "Case Owner" should shows "Sales & Ops Manager Queue"


  @US-003811 @OpsMgr_cases @OpsRep_cases
  Scenario: Update "Case Sub Type = HA/HS"
    Given I should navigate to Cases tab in saleforce application
    Then I able to see the "Recent Cases" page
    When I open the existing case from "Sales & Ops Manager Queue" filter
    Then I able to see the "Approval History" case section
    When I click on the "Approved" the link
    Then I able to see the "Approve" Approval Request page load
    And I enter the approve comments
    When I click on the "Approve" button
    Then I able to see the case page load
    And I verify the case approved
    And I "Lock" icon should no longer be visible
    And I "HA/ NS meets approval criteria" checkbox should be checked