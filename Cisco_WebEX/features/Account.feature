Feature: Accounts
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I should navigate to "Accounts" tab in saleforce application

  @US-003594 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account @SalesOps_Account
  Scenario: US-003594 Verify Field Updates
    When I follow on "New" button
    And I enter data in all the required field over Account Edit page
    And I select "No risk - upsell/cross sell opportunity" from "Health Status Reason" dropdown
    And I click Save button from top button row
    Then The account record should save seccessfully
    And The Health Status should be "Green"
    When I navigate to "Accounts" tab
    When I follow on "New" button
    And I enter data in all the required field over Account Edit page
    And I select "Training gaps" from "Health Status Reason" dropdown
    And I click Save button from top button row
    Then The account record should save seccessfully
    And The Health Status should be "Yellow"
    When I navigate to "Accounts" tab
    When I follow on "New" button
    And I enter data in all the required field over Account Edit page
    And I select "Product complexity" from "Health Status Reason" dropdown
    And I click Save button from top button row
    Then The account record should save seccessfully
    And The Health Status should be "Red"
    And The "Last Health Status" field should show current date

  @US-003599_3 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account
  Scenario: US-003599_3 Verify new and removal of fields(Verify currency field)
    When I select existing account record
    Then I should see the field "SaaS Loss Amount" as currency field

  @US-003599 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @Admin_Account
  Scenario: US-003599 Verify new and removal of fields
    When I select existing account record
    Then I should not see the field "Account Owner"
    And I should not see the field "Annual Revenue"
    And I should not see the field "Number of Cases"
    And I should not see the field "Number of New Cases"
    And I should not see the field "Number of Working Cases"
    And I should not see the field "Number of Open High Priority Cases"
    And I should not see the field "Number of Closed Cases"
    And I should not see the field "Oldest Open Case"
    When I click Edit button from top button row
    Then I should not see the field "Account Owner"
    And I should not see the field "Annual Revenue"
    And I should not see the field "Last Health Status"
    And I should not see the field "Number of Cases"
    And I should not see the field "Number of New Cases"
    And I should not see the field "Number of Working Cases"
    And I should not see the field "Number of Open High Priority Cases"
    And I should not see the field "Number of Closed Cases"
    And I should not see the field "Oldest Open Case"
    And I should see the field "UPO Name"
    And I should see the field "UPO ID"
    And I should see the field "Org Name"
    And I should see the field "Org ID"
    And I should see the field "SaaS Migration"
    And I should see the field "SaaS Loss Amount"
    And I should see the field "UPO Name" as text type
    And I should see the field "UPO Name" with RW permission
    And I should see the field "UPO ID" as text type
    And I should see the field "UPO ID" with RW permission
    And I should see the field "Org Name" as text type
    And I should see the field "Org Name" with RW permission
    And I should see the field "Org ID" as text type
    And I should see the field "Org ID" with RW permission
    And I should see the field "SaaS Migration" as checkbox type
    And I should see the field "SaaS Migration" with RW permission
    #And I should see the field "SaaS Loss Amount" as currency type
    And I should see the field "SaaS Loss Amount" with RW permission
    And I click Save button from top button row
    #And I should see "Sales Development" section under "CSM section" section
    And I should see the "Sales Development" section under "CSM" section
    And I should see the field "Meetings" is present under "Sales Development" section
    And I should see the field "Registered Hosts" is present under "Sales Development" section
    And I should see the field "Active Hosts" is present under "Sales Development" section
    And I should see the field "Utilization" is present under "Sales Development" section
    And I should see the field "Total Telephony Charge" is present under "Sales Development" section
    And I should see the field "People Minutes" is present under "Sales Development" section
    And I should see the field "Attach Rate" is present under "Sales Development" section
    And I should see the field "Days Till Expiration" is present under "Sales Development" section
    And I click Save button from top button row
    #And I should see the field "Org ID" as text type
    And I should see the field "Meetings" with - Read Only - permission
    #And I should see the field "Registered Hosts" as numeric type
    And I should see the field "Registered Hosts" with - Read Only - permission
    #And I should see the field "Active Hosts" as numeric type
    And I should see the field "Active Hosts" with - Read Only - permission
    # And I should see the field "Utilization" as numeric type
    And I should see the field "Utilization" with - Read Only - permission
    #And I should see the field "Total Telephony Charge" as text type
    And I should see the field "Total Telephony Charge" with - Read Only - permission
    #And I should see the field "People Minutes" as text type
    And I should see the field "People Minutes" with - Read Only - permission
    # And I should see the field "Attach Rate" as text type
    And I should see the field "Attach Rate" with - Read Only - permission
    #And I should see the field "Days Till Expiration" as numeric type
    And I should see the field "Days Till Expiration" with - Read Only - permission
    When I navigate to "Accounts" tab
    And I select existing account record
    And I should see "Type" column under "Contacts" section
    And I should see "Task/Event Record Type" column under "Open Activities" section
    And I should see "Task/Event Record Type" column under "Activity History" section
    And I should not see the "Assets" section over the page

  @US-003599_admin @Admin_Account
  Scenario: @US-003599_admin Account Related List
    #    When I select existing account record
    #    Then I should see the field "Registered Hosts" as numeric type
    #    And I should see the field "Active Hosts" as numeric type
    #    And I should see the field "Utilization" as numeric type
    #    And I should see the field "Days Till Expiration" as numeric type
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I clicked the "Accounts" link under "App Setup"
    And I clicked the "Fields" link under "App Setup"
    And I click the button "Set History Tracking" over the page
    And I checked the "Enable Account History" checkbox
    Then I should see track history checkbox checked for "Health Status" field
    And I should see track history checkbox checked for "Last Health Status" field
    And I should see track history checkbox checked for "SaaS Migration" field
    And I should see track history checkbox checked for "Health Status Reason" field
    And I should see track history checkbox checked for "SaaS Loss Amount" field
    And I should see track history checkbox checked for "UPO Name" field
    And I should see track history checkbox checked for "UPO ID" field
    And I should see track history checkbox checked for "Org Name" field
    And I should see track history checkbox checked for "Org ID" field
    And I click Cancel button from top button row
    And I should see that track history has not been enabled for "Utilization" field

  @US-003632 @Admin_Account
  Scenario: US-003632 Removed field tracking from Utilization field
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I clicked the "Accounts" link under "App Setup"
    And I clicked the "Fields" link under "App Setup"
    And I should see that track history has not been enabled for "Utilization" field

  @US-003641 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account @SalesOps_Account
  Scenario: US-003641 Add related list for Flex Leads to the Account page layout
    When I select existing account record
    Then I should see the "Flex Leads" section over the page
    And I should see the "Name" column in "Flex Leads" section
    And I should see the "Stage" column in "Flex Leads" section
    And I should see the "Lead Status" column in "Flex Leads" section
    And I should see the "Lead Engagement Type" column in "Flex Leads" section
    And I should see the "Expected Total Booking" column in "Flex Leads" section
    And I should see the "Expected Booking Date" column in "Flex Leads" section
    And I should see the "Forecast Status" column in "Flex Leads" section
    And I should see the "CSM" column in "Flex Leads" section
    And I should see the "Sales Development" column in "Flex Leads" section

  @US-003645 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account @SalesOps_Account
  Scenario: US-003645 Success Plan related list added to the page layout
    When I select existing account record
    Then I should see the "Success Plans (Account)" section over the page
    And I should see the "Display Name" column in "Success Plans (Account)" section

  @US-003648 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account @SalesOps_Account
  Scenario: @US-003648 Added the "Clean" and "Get Contacts" (data.com) buttons
    When I select existing account record
    Then I should see the "Clean" button
    And I should see the "Get Contacts" button

  @US-003599_1 @SalesRep_Account @SalesOps_Account
  Scenario: @US-003599_1 Account Related List
    When I select existing account record
    Then I should not see the field "Account Owner"
    And I should not see the field "Annual Revenue"
    And I should not see the field "Number of Cases"
    And I should not see the field "Number of New Cases"
    And I should not see the field "Number of Working Cases"
    And I should not see the field "Number of Open High Priority Cases"
    And I should not see the field "Number of Closed Cases"
    And I should not see the field "Oldest Open Case"
    When I click Edit button from top button row
    Then I should not see the field "Account Owner"
    And I should not see the field "Annual Revenue"
    And I should not see the field "Last Health Status"
    And I should not see the field "Number of Cases"
    And I should not see the field "Number of New Cases"
    And I should not see the field "Number of Working Cases"
    And I should not see the field "Number of Open High Priority Cases"
    And I should not see the field "Number of Closed Cases"
    And I should not see the field "Oldest Open Case"
    And I should see the field "UPO Name"
    And I should see the field "UPO ID"
    And I should see the field "Org Name"
    And I should see the field "Org ID"
    And I should see the field "SaaS Migration"
    And I should see the field "SaaS Loss Amount"
    And I should see the field "UPO Name" with - Read Only - permission
    And I should see the field "UPO ID" with - Read Only - permission
    And I should see the field "Org Name" with - Read Only - permission
    And I should see the field "Org ID" with - Read Only - permission
    And I should see the field "SaaS Migration" with - Read Only - permission for salesops and RW for sales rep
    And I should see the field "SaaS Loss Amount" with - Read Only - permission for salesops and RW for sales rep
    And I click Save button from top button row
    And I should see the "Sales Development" section under "CSM" section
    And I should see the field "Meetings" is present under "Sales Development" section
    And I should see the field "Registered Hosts" is present under "Sales Development" section
    And I should see the field "Active Hosts" is present under "Sales Development" section
    And I should see the field "Utilization" is present under "Sales Development" section
    And I should see the field "Total Telephony Charge" is present under "Sales Development" section
    And I should see the field "People Minutes" is present under "Sales Development" section
    And I should see the field "Attach Rate" is present under "Sales Development" section
    And I should see the field "Days Till Expiration" is present under "Sales Development" section
    And I click Save button from top button row
    And I should see the field "Meetings" with - Read Only - permission
    And I should see the field "Registered Hosts" with - Read Only - permission
    And I should see the field "Active Hosts" with - Read Only - permission
    And I should see the field "Utilization" with - Read Only - permission
    And I should see the field "Total Telephony Charge" with - Read Only - permission
    And I should see the field "People Minutes" with - Read Only - permission
    And I should see the field "Attach Rate" with - Read Only - permission
    And I should see the field "Days Till Expiration" with - Read Only - permission
    When I navigate to "Accounts" tab
    And I select existing account record
    And I should see "Type" column under "Contacts" section
    And I should see "Task/Event Record Type" column under "Open Activities" section
    And I should see "Task/Event Record Type" column under "Activity History" section
    And I should not see the "Assets" section over the page

  @US-003654 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @SalesOps_Account @Admin_Account
  Scenario: @US-003654 Added "Clean Status" field to the Account page layout
    When I select existing account record
    Then I should see the "Clean Status" field as ReadOnly field