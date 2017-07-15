@Alcon @cases
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Cases" tab in saleforce application

  @Case-01 @All-Users_Cases
  Scenario: Case-01 create case booking request
    Given I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I select "New" from sub case type picklist under case information
    And I enter the mandatory field values under new case for booking request
    Then I click on "Save" button from top row

 @Case-07_1 @All-Users_Cases
  Scenario: Case-07 verify milestone name
    Given I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the mandatory field values under new case for booking request
    And I select "High" option from "Priority" picklist
    And I select "New" from sub case type picklist under case information
    And I click on "Save" button from top row
    And I wait for 5 seconds
    Then I should see content "Case Milestones"
    And I should see content "Target Date"
    And I should see content "Entitlement Process Start Time"
    And I should see content "NALA 12hrs"


@Case-07_2 @All-Users_Cases
  Scenario: Case-07 verify milestone name
    When I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I select "Data Processing Request" from record type of new record
    Then I should see content "Case Edit"
    And I enter the mandatory field values under new case for data processing request
#    And I select "New" from sub case type picklist under case information
    And I select "Normal" option from "Priority" picklist
    And I click on "Save" button on top button row
#    Then I check case milestone and target date value for data processing request
    Then I should see content "Case Milestones"
    And I should see content "Target Date"
    And I should see content "Entitlement Process Start Time"
    And I should see content "NALA 24hrs"

@Case-07_3 @All-Users_Cases
  Scenario: Case-07 verify milestone name
   Given I follow on "New" button
   Then I should see content "Select Case Record Type"
   When I select "Lead Submission" from record type of new record
   Then I should see content "Case Edit"
   And I select "Booking" from sub case type picklist under case information
   And I enter the mandatory field values under new case for lead submission
   And I select "Low" option from "Priority" picklist
   And I click on "Save" button on top button row
#   Then I check case milestone and target date value for lead submission
   Then I should see content "Case Milestones"
    And I should see content "Target Date"
    And I should see content "Entitlement Process Start Time"
    And I should see content "NALA 48hrs"

@Case-02 @All-Users_Cases
 Scenario: Case-02 create case data processing request
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Data Processing Request" from record type of new record
  Then I should see content "Case Edit"
#  And I select "New" from sub case type picklist under case information
  And I enter the mandatory field values under new case for data processing request
  Then I click on "Save" button on top button row

@Case-03 @All-Users_Cases
 Scenario: Case-03 create case data processing request
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Lead Submission" from record type of new record
  Then I should see content "Case Edit"
#  And I select "New" from sub case type picklist under case information
  And I enter the mandatory field values under new case for lead submission
  Then I click on "Save" button on top button row

@Case-04 @All-Users_Cases
 Scenario: Case-04 create case quote request
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Quote Request" from record type of new record
  Then I should see content "Case Edit"
  And I select "New" from sub case type picklist under case information
  And I enter the mandatory field values under new case for quote request
  Then I click on "Save" button on top button row

@Case-05 @All-Users_Cases
 Scenario: Case-05 create case quote request
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Reporting Request" from record type of new record
  Then I should see content "Case Edit"
  And I enter the mandatory field values under new case for reporting request
  Then I click on "Save" button on top button row

@Case-06 @All-Users_Cases
 Scenario: Case-06 create case review request
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Review Request" from record type of new record
  Then I should see content "Case Edit"
  And I enter the mandatory field values under new case for Review Request
  Then I click on "Save" button on top button row

@Case-08 @All-Users_Cases
 Scenario: Case-08 validate escalation
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Review Request" from record type of new record
  Then I should see content "Case Edit"
  And I enter the mandatory field values under new case for Review Request
  Then I click on "Save" button on top button row
  And I note the case number which is just created
  And I click on "Edit" button on top button row
  And I check the request escalation check box
  And I enter value in the escalation reason field
  And I click on "Save" button from top row
#  Then I check case milestone and target date value for Review Request
  Then I should see content "Case Milestones"
    And I should see content "Target Date"
    And I should see content "Entitlement Process Start Time"
    

@Case-09 @All-Users_Cases
 Scenario: Case-09 create case data update request
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Data Update Request" from record type of new record
  Then I should see content "Case Edit"
  And I enter the mandatory field values under new case for data update request
  Then I click on "Save" button from top row

@Case-10 @All-Users_Cases
 Scenario: Case-10 validate HA NS approval process off
  Given I follow on "New" button
  Then I should see content "Select Case Record Type"
  When I select "Data Update Request" from record type of new record
  Then I should see content "Case Edit"
  And I enter the mandatory field values under new case for data update request
  And I select "House Account" option from "Sub Case Type" picklist
  And I select "HA - Bad Data - BDT" option from "Renewal Status" picklist
  And I click on "Save" button from top row
  Then I check that lock icon does not appears next to edit button
  And I click on "Edit" button from top row
  And I select "No Service" option from "Sub Case Type" picklist
  And I select "NS - Client Product Replacement - PTR" option from "Renewal Status" picklist
  And I click on "Save" button from top row
  Then I check that lock icon does not appears next to edit button