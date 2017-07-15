@PKI @cases
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Cases" tab in saleforce application

  #    And I should create new account record "Smoke_test_accounts_cases" as test data
  #    And I should navigate to "Cases" tab in saleforce application
  #    And I should create new opportunity record "Smoke-test-opportunity-for-cases" as test data
  #    And I should navigate to "Cases" tab in saleforce application
  #    And I should create new contact record "Smoke_test_primery_contact" as test data
  #    And I should navigate to "Cases" tab in saleforce application
  @US-003817 @OpsMgr_cases @OpsRep_cases
  Scenario: US-003817 Updated Case Types by Persona - Booking Request
    When I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I should see the option "Booking Request" under "Record Type of new record" dropdown
    And I should see the option "Data Update Request" under "Record Type of new record" dropdown
    And I should see the option "Reporting Request" under "Record Type of new record" dropdown
    And I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Booking Request" record type
    And I click on "Save & New" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see content "Select Case Record Type"
    And I select "Reporting Request" from record type of new record
    And I enter the value in all the mandatory field over case edit page for "Reporting Request" record type
    And I click on "Save & New" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I select "Low" option from "Priority" picklist
    And I click on "Save" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see "NALA 48hrs" in Case Milestones section
    When I should navigate to "Cases" tab
    Given I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I select "Normal" option from "Priority" picklist
    And I click on "Save" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see "NALA 48hrs" in Case Milestones section
    When I should navigate to "Cases" tab
    Given I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Data Update Request" record type
    And I select "High" option from "Priority" picklist
    And I click on "Save" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see "NALA 24hrs" in Case Milestones section

  @US-003817_1 @SalesMgr_cases @SalesRep_cases
  Scenario: US-003817 Updated Case Types by Persona - Booking Request
    When I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I should see the option "Booking Request" under "Record Type of new record" dropdown
    And I should see the option "Data Update Request" under "Record Type of new record" dropdown
    And I should see the option "Reporting Request" under "Record Type of new record" dropdown
    And I should see the option "Quote Request" under "Record Type of new record" dropdown
    And I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the value in all the mandatory field over case edit page for "Booking Request" record type
    And I click on "Save & New" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see content "Select Case Record Type"
    And I select "Reporting Request" from record type of new record
    And I enter the value in all the mandatory field over case edit page for "Reporting Request" record type
    And I click on "Save & New" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see content "Select Case Record Type"
    And I select "Quote Request" from record type of new record
    And I enter the value in all the mandatory field over case edit page for record type Quote Request Request
    And I click on "Save & New" button from top row
    Then The "Cases" record should save seccessfully
    Then I should see content "Select Case Record Type"

  @US-003819 @OpsMgr_cases @OpsRep_cases
  Scenario: US-003819 NS/HA Rules turned off
    When I select the existing opportunity "Smoke-test-opportunity-for-cases"
    Given I click on "Create Case" button from top row
    Then I should see content "Select Case Record Type"
    When I select "Data Update Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the mandatory field values under new case for data update request
    And I select "House Account" option from "Sub Case Type" picklist
    And I select "HA - Bad Data - BDT" option from "Renewal Status" picklist
    And I click on "Save" button from top row
    Then I should not see lock icon next to edit button

  @US-003820 @OpsMgr_cases @OpsRep_cases
  Scenario: US-003820 Approval Process turned off
    And Navigate to "Home" tab
    And I should not see the "Items To Approve" section over the page
