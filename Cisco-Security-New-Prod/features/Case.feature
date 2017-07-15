@cases
Feature: Cases
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I navigate to "Cases" tab in salesforce application

  #    And I should create new account record "Smoke_test_accounts_cases" as test data
  #    And I navigate to "Cases" tab in salesforce application
  #    And I should create new opportunity record "Smoke-test-opportunity-for-cases" as test data
  #    And I navigate to "Cases" tab in salesforce application
  #    And I should create new contact record "Smoke_test_primery_contact" as test data
  #    And I navigate to "Cases" tab in salesforce application
  @US-003964 @OpsMgr_cases @OpsRep_cases @AllUser_cases
  Scenario: @US-003964 Case Types by Persona
    When I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I should see the specific case type option for individual role
    And I select "Lead Submission" from record type of new record
    And I should not see the field "Applicable Discounts" over the page
    And I should see the field "New Term Dates" over the page as not required field
    And I enter the value in all the mandatory field over case edit page for "Lead Submission" record type
    And I select "Low" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see "NALA 48hrs" in Case Milestones section
    And I should see the field "Target Date" is present under "Case Management" section
    And I verify that the Target Date value under Case Milestones and Target Date value under Case Management are same
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Booking Request" record type
    And I select "Normal" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see "NALA 24hrs" in Case Milestones section
    And I should see the field "Target Date" is present under "Case Management" section
    And I verify that the Target Date value under Case Milestones and Target Date value under Case Management are same
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Quote Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for record type Quote Request Request
    And I select "High" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see "NALA 12hrs" in Case Milestones section
    And I should see the field "Target Date" is present under "Case Management" section
    And I verify that the Target Date value under Case Milestones and Target Date value under Case Management are same
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Review Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Review Request" record type
    And I select "Low" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I click Edit button from top button row
    And I check the "Request Escalation" checkbox
    And I enter "Testing" in "Escalation Reason" textarea field
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I select "House Account" from "Sub Case Type" picklist
    And I select "HA - Bad Data - BDT" from "Renewal Status" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see lock icon next to edit button
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I select "No Service" from "Sub Case Type" picklist
    And I select "NS - Client Product Replacement - PTR" from "Renewal Status" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see lock icon next to edit button
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I click Edit button from top button row
    And I select "On Hold" from "Status" picklist
    And I select "Awaiting NetSuite Generated Sales Order" from "On Hold Reason" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see "On Hold" selected under "Status" drop down
    And I should see "Awaiting NetSuite Generated Sales Order" selected under "On Hold Reason" drop down

  @US-003964_1 @SalesOps_cases
  Scenario: @US-003964 Case Types by Persona
    When I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I should see the specific case type option for individual role
    When I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Booking Request" record type
    And I select "Normal" from "Priority" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see "NALA 24hrs" in Case Milestones section
    And I should see the field "Target Date" is present under "Case Management" section
    And I verify that the Target Date value under Case Milestones and Target Date value under Case Management are same
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I select "House Account" from "Sub Case Type" picklist
    And I select "HA - Bad Data - BDT" from "Renewal Status" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see lock icon next to edit button
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I select "No Service" from "Sub Case Type" picklist
    And I select "NS - Client Product Replacement - PTR" from "Renewal Status" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see lock icon next to edit button
    When I navigate to "Cases" tab in the application
    And I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I click Edit button from top button row
    And I select "On Hold" from "Status" picklist
    And I select "Awaiting NetSuite Generated Sales Order" from "On Hold Reason" picklist
    And I click Save button from top button row
    Then The "Cases" record should save seccessfully
    And I should see "On Hold" selected under "Status" drop down
    And I should see "Awaiting NetSuite Generated Sales Order" selected under "On Hold Reason" drop down
