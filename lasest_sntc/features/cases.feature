@cisco @cases
Feature:
  In order to test case module in salesforce application
  As a tester
  And I should verify all functionalities as per client requirement

  @US-003558 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases
  Scenario Outline: US-003558 Validate case types need to be enabled
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "<Record_Type>" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    When I select "<priority>" from priority field under case information row
    #    And I select "New" from sub case type picklist under case information
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    #    And I fill in contract amount with "500" under booking request details
    And I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    And I should see content "Case Milestones"
    And I should see content "<content>"

    Examples:
      | Record_Type         | priority | content       |
      | Data Update Request | High     | 24 Hours NALA |
      | Reporting Request   | Normal   | 24 Hours NALA |

  @US-003558 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases
  Scenario: US-003558 Validate case types need to be enabled
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    When I select "Low" from priority field under case information row
    And I select "New" from sub case type picklist under case information
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I fill in contract amount with "500" under booking request details
    And I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    And I should see content "Case Milestones"
    And I should see content "48 Hours NALA"

  @US-003562 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases
  Scenario: US-003562 Case Configuration
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Data Update Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    And I should see sub caste type picklist values for record type data update request
    When I select "New" from status field under case information row
    And I select "Low" from priority field under case information row
    And I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row

  @US-003562 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases
  Scenario: US-003562 Case Configuration
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Reporting Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    And I should see sub caste type picklist values for record type reporting request
    When I select "New" from status field under case information row
    And I select "Low" from priority field under case information row
    And I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row

  @US-003562 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases
  Scenario: US-003562 Case Configuration
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    #    And I should see sub caste type picklist values for record type reporting request
    When I select "New" from status field under case information row
    And I select "Low" from priority field under case information row
    And I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row

  @US-003577 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases
  Scenario: US-003577 validate disable rule SSI ZTH case account opportunity require
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    When I select "Low" from priority field under case information row
    And I select "New" from sub case type picklist under case information
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I fill in contract amount with "500" under booking request details
    When I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row
    Then I should see content "New Case"

  @US-003569-re @nalaSalesRep_cases @nalaOpsRep_cases
  Scenario: US-003569 case Approval Process Builder
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    When I select "Low" from priority field under case information row
    And I select "New" from sub case type picklist under case information
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I fill in contract amount with "500" under booking request details
    When I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row
    And I should get recently created case
    Then I should see content "Case Detail"
    When I click on "Edit" button on top button row
    And I check request escalation
    And I enter escalation reason
    And I click on "Save" button on top button row
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see the following:
      """
      Record Locked
      The record you are trying to edit has been locked. Please contact your administrator if access is necessary.
      """
    And I logout from the current user
    Given I should login as a "OpsManager"
    When I click on Home tab
    And I wait for 5 seconds
    Then I should see content "Items to Approve"
    And I should see case no under items to approve section
    And I logout from the current user
    Given I should login as a "SalesManager"
    When I click on Home tab
    And I wait for 5 seconds
    Then I should see content "Items to Approve"
    And I should see case no under items to approve section
    

  @US-003569 @apacSaleRep @apacOpsRep
  Scenario: US-003569 case Approval Process Builder
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    When I select "Low" from priority field under case information row
    And I select "New" from sub case type picklist under case information
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I fill in contract amount with "500" under booking request details
    When I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row
    And I should get recently created case
    Then I should see content "Case Detail"
    When I click on "Edit" button on top button row
    And I check request escalation
    And I enter escalation reason
    And I click on "Save" button on top button row
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see the following:
      """
      Record Locked
      The record you are trying to edit has been locked. Please contact your administrator if access is necessary.
      """
    And I logout from the current user
    Given I should login as a "apacOpsMgr"
    When I click on Home tab
    And I wait for 5 seconds
    Then I should see content "Items to Approve"
    And I should see case no under items to approve section
    And I logout from the current user
    Given I should login as a "apacSalesMgr"
    When I click on Home tab
    And I wait for 5 seconds
    Then I should see content "Items to Approve"
    And I should see case no under items to approve section

  @US-003584 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases
  Scenario Outline: US-003584 validate new product field to booking data update and reporting case page layouts
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "<record_type>" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    And I should see product field picklist under case information
    And I should verify product field picklist values as per requirements

    Examples:
      | record_type         |
      | Booking Request     |
      | Data Update Request |
      | Reporting Request   |

  @US-003584 @nalaSalesOps_cases
  Scenario: US-003584 validate new product field to booking data update and reporting case page layouts
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I select "All Case Open" from view picklist
    And I wait for 5 seconds
    And I click on underlying case name
    And I click on "Edit" button on top button row
    And I should see product field with read only permission

  @US-003590 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases
  Scenario: US-003590 Add workflow and field update
    Given I should navigate to Cases tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    When I select "New" from  sub case type picklist field under case information row
    And I select "New" from status field under case information row
    And I select "Low" from priority field under case information row
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I fill in contract amount with "500" under booking request details
    And I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row
    Then I should see content "Case Management"
    And I should see content "Target Date"
    And I get the case no value
    When I double click on request escalation under case information
    And I double click on escalation reason and enter proper reason
    And I wait for 5 seconds
    And I click on "Save" button on top button row
    And I logout from the current user
    And I login as opsmanager to approve the escalation request
    Then I should see content "Items to Approve"
    And I should see caseno just created

  #    When I click on approve link
  #    And I should see content "Approve/Reject Approval Request"
  #    And I should click on approve button
  @US-003661 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases
  Scenario: remove documentation picklist option from the sub case type picklist on data update cases
    Given I should navigate to Cases tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    And I select "Data Update Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    But I should not see "Documentation" value in sub case type picklist field

  @US-003680 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases
  Scenario: US-003680 Add the following values to the Sub Case Type field on Data Update cases
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Data Update Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    And I should see sub caste type picklist values for record type data update request

  @US-003672 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases
  Scenario Outline: US-003672 Update the following SLAs for Data Update
    Given I should navigate to Cases tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "<Record_Type>" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    When I select "<priority>" from priority field under case information row
    #    And I select "New" from sub case type picklist under case information
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    #    And I fill in contract amount with "500" under booking request details
    And I select "SNTC" from product picklist under description information
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    And I should see content "Case Milestones"
    And I should see content "<content>"

    Examples:
      | Record_Type         | priority | content       |
      | Data Update Request | High     | 24 Hours NALA |
      | Data Update Request | Low      | 48 Hours NALA |
      | Data Update Request | Normal   | 48 Hours NALA |


  @US-003720 @nalaOpsMgr_cases @nalaOpsRep_cases @nalaSalesMgr_cases @nalaSalesRep_cases @nalaAdmin_cases @nalaSalesOps_cases
  Scenario: US-003720 Remove sub case type Research-Other from Data Update case record type
    Given I should navigate to Cases tab in saleforce application
    When I follow on "New" button
    And I select "Data Update Request" from record type of new record picklist
    And I click on "Continue" button under select case record type
    Then I check the removal of "Research-Other" from Sub Case type