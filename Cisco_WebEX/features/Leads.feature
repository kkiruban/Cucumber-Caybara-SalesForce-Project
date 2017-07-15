Feature: Leads
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I should navigate to "Leads" tab in the application

  #@US-003644 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1 @SalesOps_Account_1
  @US-003644 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1
  Scenario: @US-003644 Added rule to the Leads object - contract_type_required__c
    #When I select "PES_leads_Sales_Ops1" record
    When I select existing leads record
    Then I click Edit button from top button row
    And I select "4 Agreement" from "Stage" dropdown
    And I select "--None--" from "Contract Type" dropdown
    And I click Save button from top button row
    Then I should see error message "Contract Type is required when Stage = Stage 4 or greater"
    When I select "5 Closing" from "Stage" dropdown
    And I click Save button from top button row
    Then I should see error message "Contract Type is required when Stage = Stage 4 or greater"

  @US-003643 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1
  Scenario: @US-003643 Updated Leads page layout
    When I select existing leads record
    Then I should not see the "Convert" button
    And I click Edit button from top button row
    And I should see the field "Contract Type" over the page as not required field
    And I should see the field "Primary Contact" with RW permission

  @US-003643_1 @SalesOps_Account_1
  Scenario: US-003643_1 Updated Leads page layout
    When I select existing leads record
    Then I should not see the "Convert" button
    #And I should see the field "Contract Type" over the page as not required field
    And I should see the field "Primary Contact" with - Read Only - permission

  @US-003608 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1
  Scenario: US-003608 WebEx Leads - Verify removal of fields
    When I click the button "New" over the page
    Then I should not see the field "Lead Owner"
    And I should not see the field "Do Not Call"
    And I should not see the "Additional Information" section over the page
    And I should not see the field "Annual Revenue"
    And I should not see the field "No. of Employees"
    And I should not see the field "Industry"
    And I should see the field "Account Name" is visible under "Lead Information" section
    And I should see the field "Account Name" over the page as required field
    And I should see the field "CSM" is visible under "Lead Information" section
    And I should see the field "CSM" over the page as required field
    And I should see the field "Sales Development" is visible under "Lead Information" section
    And I should see the field "Sales Development" over the page as required field
    And I should see the field "Lead Source" is visible under "Lead Information" section
    And I should see the field "Lead Source" over the page as required field
    And I should see the field "Lead Status" is visible under "Lead Information" section
    And I should see the field "Lead Status" over the page as required field
    And I should see the field "Stage" is visible under "Lead Information" section
    And I should see the field "Stage" over the page as required field
    And I should see the field "Lead Engagement Type" is visible under "Lead Information" section
    And I should see the field "Lead Engagement Type" over the page as required field
    And I should see the field "Contract Type" is visible under "Lead Information" section
    And I should see the field "Contract Type" over the page as required field
    And I should see the field "Lead Type" is visible under "Lead Information" section
    And I should see the field "Lead Type" over the page as required field
    And I should see the field "Account Name" with RW permission
    And I should see the field "Account Name" over the page as lookup
    And I should see the field "CSM" with RW permission
    And I should see the field "CSM" over the page as lookup
    And I should see the field "Sales Development" with RW permission
    And I should see the field "Sales Development" over the page as lookup
    And I should see the field "Lead Source" with RW permission
    And I should see the field "Lead Source" over the page as picklist
    And I should see the field "Lead Status" with RW permission
    And I should see the field "Lead Status" over the page as picklist
    And I should see the field "Stage" with RW permission
    And I should see the field "Stage" over the page as picklist
    And I should see the field "Lead Engagement Type" with RW permission
    And I should see the field "Lead Engagement Type" over the page as picklist
    And I should see the field "Contract Type" with RW permission
    And I should see the field "Contract Type" over the page as picklist
    And I should see the field "Lead Type" with RW permission
    And I should see the field "Lead Type" over the page as picklist
    And I should see the "Forecasting Information" section over the page
    And I should see the field "Products" is visible under "Forecasting Information" section
    And I should see the field "Products" over the page as required field
    And I should see the field "Expected Booking Date" is visible under "Forecasting Information" section
    And I should see the field "Expected Total Booking" is visible under "Forecasting Information" section
    And I should see the field "Forecast Status" is visible under "Forecasting Information" section
    And I should see the field "Previous Contract" is visible under "Forecasting Information" section
    And I should see the field "Previous Contract" over the page as required field
    And I should see the field "New Contract" is visible under "Forecasting Information" section
    And I should see the field "Term" is visible under "Forecasting Information" section
    And I should see the field "Order ID" is visible under "Forecasting Information" section
    And I should see the field "Actual Booking Date" is visible under "Forecasting Information" section
    And I should see the field "Actual Booking Amount" is visible under "Forecasting Information" section
    And I should see the field "Primary Reason Won / Lost" is visible under "Forecasting Information" section
    And I should see the field "New MRR" is visible under "Forecasting Information" section
    And I should see the field "Term" is visible under "Forecasting Information" section
    And I should see the field "Prior MRR" is visible under "Forecasting Information" section
    And I should see the field "Prior MRR" over the page as required field
    And I should see the field "Non - Recurring Total" is visible under "Forecasting Information" section
    And I should see the field "Products" over the page as multi select picklist
    And I should see the field "Products" with RW permission
    And The field "Expected Booking Date" should be of date type
    And I should see the field "Expected Total Booking" with RW permission
    And I should see the field "Forecast Status" over the page as picklist
    And I should see the field "Forecast Status" with RW permission
    And I should see the field "Previous Contract" as text type
    And I should see the field "Previous Contract" with RW permission
    And I should see the field "Term" as text type
    And I should see the field "Term" with RW permission
    And I should see the field "Order ID" as text type
    And I should see the field "Order ID" with RW permission
    And The field "Actual Booking Date" should be of date type
    And I should see the field "Actual Booking Date" with RW permission
    And I should see the field "Actual Booking Amount" with RW permission
    And I should see the field "Actual Booking Amount" with RW permission
    And I should see the field "Prior MRR" with RW permission
    And I should see the field "New MRR" with RW permission
    And I should see the field "Net ARR Change" with RW permission
    And I should see the field "Non - Recurring Total" with RW permission
#    And I should see the "Account" section under "System Information" section
#    And I should see "Action" column under "Account" section
#    And I should see "Action" column under "Account" section
#    And I should see "Account Name" column under "Account" section
#    And I should see "Client Company ID" column under "Account" section
#    And I should see "Org Name" column under "Account" section
#    And I should see "Org ID" column under "Account" section

  @US-003608_admin @Admin_Account_1
  Scenario: US-003608 WebEx Leads - Verify removal of fields
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I clicked the "Leads" link under "App Setup"
    And I clicked the "Fields" link under "App Setup"
    And I click the button "Set History Tracking" over the page
    And I checked the "Enable Account History" checkbox
    Then I should see track history checked for "Account Name" field
    Then I should see track history checked for "Expected Booking Date" field
    Then I should see track history checked for "Stage" field
    Then I should see track history checked for "Forecast Status" field
    Then I should see track history checked for "Lead Type" field
    Then I should see track history checked for "Products" field
    Then I should see track history checked for "CSM" field
    Then I should see track history checked for "Sales Development" field
    Then I should see track history checked for "Lead Engagement Type" field

  @US-003608_2 @SalesOps_Account_1
  Scenario: US-003608_2 WebEx Leads - Verify removal of fields
    When I click the button "New" over the page
    Then I should not see the field "Lead Owner"
    And I should not see the field "Do Not Call"
    And I should not see the "Additional Information" section over the page
    And I should not see the field "Annual Revenue"
    And I should not see the field "No. of Employees"
    And I should not see the field "Industry"
    And I should see the field "Account Name" is visible under "Lead Information" section
    And I should see the field "CSM" is visible under "Lead Information" section
    And I should see the field "Sales Development" is visible under "Lead Information" section
    And I should see the field "Lead Source" is visible under "Lead Information" section
    And I should see the field "Lead Status" is visible under "Lead Information" section
    And I should see the field "Stage" is visible under "Lead Information" section
    And I should see the field "Lead Engagement Type" is visible under "Lead Information" section
    And I should see the field "Contract Type" is visible under "Lead Information" section
    And I should see the field "Lead Type" is visible under "Lead Information" section
    And I should see the field "Account Name" with - Read Only - permission
    And I should see the field "Account Name" with - Read Only - permission
    And I should see the field "CSM" with - Read Only - permission
    And I should see the field "Sales Development" with - Read Only - permission
    And I should see the field "Lead Source" with - Read Only - permission
    And I should see the field "Lead Status" with - Read Only - permission
    And I should see the field "Stage" with - Read Only - permission
    And I should see the field "Lead Engagement Type" with - Read Only - permission
    And I should see the field "Contract Type" with - Read Only - permission
    And I should see the field "Lead Type" with - Read Only - permission
    And I should see the "Forecasting Information" section over the page
    And I should see the field "Products" is visible under "Forecasting Information" section
    And I should see the field "Expected Booking Date" is visible under "Forecasting Information" section
    And I should see the field "Expected Total Booking" is visible under "Forecasting Information" section
    And I should see the field "Forecast Status" is visible under "Forecasting Information" section
    And I should see the field "Previous Contract" is visible under "Forecasting Information" section
    And I should see the field "New Contract" is visible under "Forecasting Information" section
    And I should see the field "Term" is visible under "Forecasting Information" section
    And I should see the field "Order ID" is visible under "Forecasting Information" section
    And I should see the field "Actual Booking Date" is visible under "Forecasting Information" section
    And I should see the field "Actual Booking Amount" is visible under "Forecasting Information" section
    And I should see the field "Primary Reason Won / Lost" is visible under "Forecasting Information" section
    And I should see the field "New MRR" is visible under "Forecasting Information" section
    And I should see the field "Term" is visible under "Forecasting Information" section
    And I should see the field "Prior MRR" is visible under "Forecasting Information" section
    And I should see the field "Non - Recurring Total" is visible under "Forecasting Information" section
    And I should see the field "Products" with - Read Only - permission
    And I should see the field "Expected Booking Date" with - Read Only - permission
    And I should see the field "Expected Total Booking" with - Read Only - permission
    And I should see the field "Forecast Status" with - Read Only - permission
    And I should see the field "Previous Contract" with - Read Only - permission
    And I should see the field "Term" with - Read Only - permission
    And I should see the field "Order ID" with - Read Only - permission
    And I should see the field "Actual Booking Date" with - Read Only - permission
    And I should see the field "Actual Booking Amount" with - Read Only - permission
    And I should see the field "Actual Booking Amount" with - Read Only - permission
    And I should see the field "Prior MRR" with - Read Only - permission
    And I should see the field "New MRR" with - Read Only - permission
    And I should see the field "Net ARR Change" with - Read Only - permission
    And I should see the field "Non - Recurring Total" with - Read Only - permission
#    And I should see the "Account" section under "System Information" section
#    And I should see "Action" column under "Account" section
#    And I should see "Action" column under "Account" section
#    And I should see "Account Name" column under "Account" section
#    And I should see "Client Company ID" column under "Account" section
#    And I should see "Org Name" column under "Account" section
#    And I should see "Org ID" column under "Account" section

  #@US-003620 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1 @SalesOps_Account_1
  @US-003620_123 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1
  Scenario: @US-003620 Verify that CSM & Sales Development fields are required when Lead Engagement Type = CS / SD
    When I click the button "New" over the page
    Then I enter data in all the mandatory fields and enter "CS / SD" in Lead Engagement Type dropdown
    And I click Save button from top button row
    Then I should see error message "CSM & Sales Development fields are required when Lead Engagement Type = CS / SD"
    When I navigate to "Leads" tab in the application
    When I click the button "New" over the page
    And I enter data in all the mandatory fields and enter "SD / Cisco" in Lead Engagement Type dropdown
    And I click Save button from top button row
    Then I should see error message "Sales Development and Cisco Rep fields are required when Lead Engagement Type = SD / Cisco"
    When I navigate to "Leads" tab in the application
    When I click the button "New" over the page
    And I enter data in all the mandatory fields and enter "CS / Cisco" in Lead Engagement Type dropdown
    And I click Save button from top button row
    Then I should see error message "CSM & Cisco Rep fields are required when Lead Engagement Type = CS / Cisco"

  @US-003621_1 @Admin_Account_1
  Scenario: @US-003621_1 Changes to the Leads tab
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I clicked the "Leads" link under "App Setup"
    And I clicked the "Fields" link under "App Setup"
    And I click the button "Set History Tracking" over the page
    And I checked the "Enable Account History" checkbox
    Then I should see track history checkbox checked for "CSM" field
    Then I should see track history checkbox checked for "Sales Development" field

  #@US-003621 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1 @SalesOps_Account_1
  @US-003621 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1 @SalesOps_Account_1
  Scenario: @US-003621 Changes to the Leads tab
    When I click the button "New" over the page
    Then I should see the field "Cisco Rep" over the page as not required field
    And I should see the field "CSM" over the page
    And I should see the field "Sales Development" over the page

  @US-003608_3312 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1 @SalesOps_Account_1
  Scenario: @US-003608_3 WebEx Leads - Verify removal of fields (Verify currency)
    When I select existing leads record
    Then I should see the field "Expected Total Booking" as currency field
    And I should see the field "Actual Booking Amount" as currency field
    And I should see the field "Prior MRR" as currency field
    And I should see the field "New MRR" as currency field
    And I should see the field "Net ARR Change" as currency field
    And I should see the field "Non - Recurring Total" as currency field

  @US-003597_123 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1
  Scenario: @US-003597 Verify that CSM & Sales Development fields are required when Lead Engagement Type = CS / SD
    When I click the button "New" over the page
    Then I create new lead record by entering all the mandatory field
    And I click Edit button from top button row
    And I select "--None--" from "Contract Type" dropdown
    And I should see the field "Expected Booking Date" as empty field
    And I should see the field "Expected Total Booking" as empty field
    And I should see the picklist "Forecast Status" as empty picklist
    And I select "2 Qualification" from "Stage" dropdown
    And I click Save button from top button row
    Then I should see error message "• Expected Booking Date is required upon creation when Lead Engagement Type = CS / SD or SD / Cisco & Stage is 2 or greater."
    And I should see error message "• Expected Total Booking is required upon creation when Lead Engagement Type = CS / SD or SD / Cisco & Stage is 2 or greater"
    And I should see error message "• Forecast Status is required upon creation when Lead Engagement Type = CS / SD or SD / Cisco & Stage is 2 or greater"
    When I enter date in "Expected Booking Date" field
    And I enter "12" in "Expected Total Booking" field
    And I select "Upside" from "Forecast Status" dropdown
    And I click Save button from top button row
    And I click Edit button from top button row
    And I should see the field "New Contract" as empty field
    And I should see the field "Term" as empty field
    And I should see the field "Order ID" as empty field
    And I should see the field "Actual Booking Date" as empty field
    And I should see the field "Actual Booking Amount" as empty field
    And I should see the picklist "Lead Status" as empty picklist
    And I should see the field "New MRR" as empty field
    And I select "5 Closing" from "Stage" dropdown
    And I click Save button from top button row
    Then I should see error message "• Actual Booking Amount is required when Stage = Stage 5"
    And I should see error message "• Actual Booking Date is required when Stage = Stage 5"
    And I should see error message "• Lead Status must = Booked when Stage = Stage 5"
    And I should see error message "• New Contract is required when Stage = Stage 5"
    And I should see error message "• New MRR is required when Stage = Stage 5"
    And I should see error message "• Order ID is required when Stage = Stage 5"
    And I should see error message "• Term is required when Stage = Stage 5"

  @US-003705_0123 @OpsMgr_Account_1 @OpsRep_Account_1 @SalesMgr_Account_1 @SalesRep_Account_1 @Admin_Account_1
  Scenario: US-003705 Verify that CSM & Sales Development fields are required when Lead Engagement Type = CS / SD
    When I click the button "New" over the page
    Then I should see the "Meeting Center" under "Products" dropdown
    And I should see the "Event Center" under "Products" dropdown
    And I should see the "Support Center" under "Products" dropdown
    And I should see the "Training Center" under "Products" dropdown
    And I should see the "Spark" under "Products" dropdown
    And I should see the "EE Full Deployment" under "Products" dropdown
    And I should see the "Multi Service" under "Products" dropdown
    And I should see the "Telephony" under "Products" dropdown
    And I should see the "CMR" under "Products" dropdown
    And I should see the "Toll Named User" under "Products" dropdown
    And I should see the "Toll Active User" under "Products" dropdown
    And I should see the "Toll Named User Plus" under "Products" dropdown
    And I should see the "Toll Active User Plus" under "Products" dropdown
    And I should see the "Active Host" under "Products" dropdown
    And I should see the "TNU+ International" under "Products" dropdown
    And I should see the "CCA-SP" under "Products" dropdown
    
