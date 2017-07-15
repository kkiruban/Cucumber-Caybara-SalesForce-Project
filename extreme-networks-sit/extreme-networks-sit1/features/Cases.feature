@Cases_feature
Feature: All scenarios related to Cases feature

  Background: Login to the Application
    Given I login to the "F5 Networks" application
    Then I able to see the logged in to "F5 Networks" application


  @US-004166 @OpsMgr_cases @EMEA_OpsMgr_cases @OpsRep_cases @EMEA_OpsRep_cases @SalesMgr_cases @EMEA_SalesMgr_cases @SalesRep_cases @EMEA_SalesRep_cases @Admin_cases @SalesOps_cases @EMEA_SalesOps_cases
  Scenario: Case Types by Persona
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" cases pickList fields


  @US-004167 @US-004161 @OpsMgr_cases @EMEA_OpsMgr_cases @OpsRep_cases @EMEA_OpsRep_cases @SalesMgr_cases @EMEA_SalesMgr_cases @SalesRep_cases @EMEA_SalesRep_cases @Admin_cases @SalesOps_cases @EMEA_SalesOps_cases
  Scenario: Quote Request, Entitlements-Milestones
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Quote Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "Low"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Quote Request" case created successfully
    And I verify the Case "Milestone Name" details


  @US-004167 @US-004161 @OpsMgr_cases @EMEA_OpsMgr_cases @OpsRep_cases @EMEA_OpsRep_cases @SalesMgr_cases @EMEA_SalesMgr_cases @SalesRep_cases @EMEA_SalesRep_cases @Admin_cases @SalesOps_cases @EMEA_SalesOps_cases
  Scenario: Booking Request, Entitlements-Milestones
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Booking Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "Normal"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Booking Request" case created successfully
    And I verify the Case "Milestone Name" details


  @US-004167 @US-004161 @OpsMgr_cases @EMEA_OpsMgr_cases @OpsRep_cases @EMEA_OpsRep_cases @SalesMgr_cases @EMEA_SalesMgr_cases @SalesRep_cases @EMEA_SalesRep_cases @Admin_cases
  Scenario: Data Processing Request, Entitlements-Milestones
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Processing Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "High"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Processing Request" case created successfully
    And I verify the Case "Milestone Name" details


  @US-004167 @US-004161 @OpsMgr_cases @EMEA_OpsMgr_cases @OpsRep_cases @EMEA_OpsRep_cases @SalesMgr_cases @EMEA_SalesMgr_cases @SalesRep_cases @EMEA_SalesRep_cases @Admin_cases @SalesOps_cases @EMEA_SalesOps_cases
  Scenario: Reporting Request, Entitlements-Milestones
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Reporting Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "High"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Reporting Request" case created successfully
    And I verify the Case "Milestone Name" details


  @US-004167 @OpsMgr_cases @OpsRep_cases @Admin_cases
  Scenario: Lead Submission
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Lead Submission" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Priority" is "Low"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Lead Submission" case created successfully


  @US-004167 @SalesMgr_cases @SalesRep_cases
  Scenario: Lead Submission
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Lead Submission" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Lead Submission" case created successfully
    When I select the "Request Escalation" check box
    And I click on "Save" button from new "Case Detail" page
    Then I verify the "Data Update Request" case updated successfully
    And I double click on "Escalation Reason" text box
    And I enter the "Escalation Reason" message and click on "Ok" button
    And I click on "Save" button from new "Case Detail" page
    Then I verify the "Data Update Request" case updated successfully
    And I able to see the "Lock" icon next to "Edit" button



  @US-004167 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases @Admin_cases
  Scenario: Data Update Request
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    And I select the "House Account" value from "Sub Case Type" pickList
    Then I verify the House Account "Renewal Status" pickList values
    And I select the "No Service" value from "Sub Case Type" pickList
    Then I verify the No Service "Renewal Status" pickList values
    And I select the "Closed Sale" value from "Sub Case Type" pickList
    Then I verify the Closed Sale "Renewal Status" pickList values
    When I fill the case required fields
    And I select the "Priority" is "High"
    And I select the "House Account" value from "Sub Case Type" pickList
    And I select the "HA - Duplicate - DUP" from "Renewal Status"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" case created successfully
    And I able to see the "Lock" icon next to "Edit" button



  @US-004167 @OpsMgr_cases @OpsRep_cases
  Scenario: Booking Request
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Booking Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I select the "Status" pickList value is "Closed - Unsuccessfully"
    And I select the "House Account" pickList value from "Sub Case Type"
    And I select the "Closed Unsuccessfully Reason" is "User - Request Details"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Booking Request" case created successfully
    Then I able to see the "Case Detail" page
    When I click on "Edit" button from "Booking Request" case
    Then I able to see the "Case Edit" page
    And I select the "Status" pickList value is "Ready"
    And I click on "Save" button from new "Case Edit" page
    Then I verify the "Booking Request" case updated successfully



  @US-004167 @SalesOps_cases
  Scenario: Data Update Request
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    When I fill the case required fields
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" case created successfully



