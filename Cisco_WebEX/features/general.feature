@Cisco_WebEx @general
Feature:
  In order to test general functionlaities
  As a tester
  I should verify all the functionalities as per user story

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @US-003592_1 @Admin_general
  Scenario: US-003592 verify business hours
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Business Hours" link
    And I click on "NALA 24hrs" link
    Then I verify nala time zone and Business Hours

  @US-003592_2 @Admin_general
  Scenario: US-003592 verify currency
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Manage Currencies" link
    Then I should see content "Active Currencies"
    And I should see content "CAD"
    And I should see content "USD"

  @US-003592_3 @Admin_general
  Scenario: US-003592 verify currency
    Given I click on username in the top right corner then select setup
    And I expand "Company Profile" from administration setup
    And I click "Fiscal Year" link

  @US-003597-1 @Admin_general
  Scenario: US-003597 Verifying rules to be turned off
    Given I click on username in the top right corner then select setup
    And I expand "Customize" from app setup
    And I expand "Opportunities" link under customize
    And I click "Validation Rules" link
    And I check that Stage_Closed_Sale rule Active checkbox should be unchecked
    And I expand "Customize" from app setup
    And I expand "Leads" link under customize
    And I click "Validation Rules" link
    And I check that Expected_Booking_Date_Required rule is available and active checkbox is checked
    And I check that Expected_Total_Booking_Required rule is available and active checkbox is checked
    And I check that Forecast_Status_Required rule is available and active checkbox is checked
    And I check that New_Contract_Required rule is available and active checkbox is checked
    And I check that Term_Required rule is available and active checkbox is checked
    And I check that Order_ID_Required rule is available and active checkbox is checked
    And I check that Actual_Booking_Date_Required rule is available and active checkbox is checked
    And I check that Actual_Booking_Amount_Required is available and active checkbox is checked
    And I check that Primary_Reason_Required rule is available and active checkbox is checked
    And I check that Lead_Status_Booked rule is available and active checkbox is checked
    And I check that New_MRR_Required rule is available and active checkbox is checked
    And I expand "Customize" from app setup
    And I expand "Cases" link under customize
    And I click "Validation Rules" link
    And I check that Reason_Code_Change rule is available and active checkbox is checked
    And I check that offset_c rule is available and active checkbox is checked
    And I expand "Customize" from app setup
    And I expand "Activities" link under customize
    And I click "Task Validation Rules" link
    And I check that health_status_reason_required rule is available and active checkbox is checked

  @US-003633 @Admin_general
  Scenario: US-003633 Verifying rules to be turned off
    Given I click on username in the top right corner then select setup
    And I expand "Customize" from app setup
    And I expand "Activities" link under customize
    And I click "Task Validation Rules" link
    Then I check that health_status_reason_required rule is available and active checkbox is checked

  @US-003598 @Admin_general
  Scenario: US-003598 Users
    Given I click on username in the top right corner then select setup
    When I expand "Manage Users" from administration setup
    And I click "Users" link
    Then I check that list of Active User should match with the username in config workbook user tab

  @US-003607 @Admin_general
  Scenario: US-003607 WebEx - CSM
    Given I click on username in the top right corner then select setup
    When I search for scheduled jobs in quick search bar
    And I click "Scheduled Jobs" link
    Then I should see content "All Scheduled Jobs"
    And I ckeck that "CSM_AccountPlanBatchUpdate" batch job is enabled
    And I ckeck that "CSM_AccPlanBatchCreatePlaySchdDispatcher" batch job is enabled
    And I ckeck that "CSM_BatchAccOvrdueTskScheduledDispatcher" batch job is enabled
    And I ckeck that "CSM_OppBatchCreatePlaySchdDispatcher" batch job is enabled
    And I ckeck that "CSM_DailyOppBatchCreatePlaySchdDispatchr" batch job is enabled
    And I click on manage and verify frequency of "CSM_AccountPlanBatchUpdate"
    And I click "Scheduled Jobs" link
    Then I should see content "All Scheduled Jobs"
    And I click on manage and verify frequency of "CSM_AccPlanBatchCreatePlaySchdDispatcher"
    And I click "Scheduled Jobs" link
    Then I should see content "All Scheduled Jobs"
    And I click on manage and verify frequency of "CSM_BatchAccOvrdueTskScheduledDispatcher"
    And I click "Scheduled Jobs" link
    Then I should see content "All Scheduled Jobs"
    And I click on manage and verify frequency of "CSM_OppBatchCreatePlaySchdDispatcher"
    And I click "Scheduled Jobs" link
    Then I should see content "All Scheduled Jobs"
    And I click on manage and verify frequency of "CSM_DailyOppBatchCreatePlaySchdDispatchr"

  @US-003625 @Admin_general
  Scenario: US-003625 Need Melissa Bell added as an active user
    Given I click on username in the top right corner then select setup
    When I expand "Manage Users" from administration setup
    And I click "Users" link
    Then I check that "Bell, Melissa" is available active user with SSI Zenith Sales Profile

  @US-003640 @Admin_general
  Scenario: US-003640 Moved user Queue Team from inactive to Active
    Given I click on username in the top right corner then select setup
    When I expand "Manage Users" from administration setup
    And I click "Users" link
    Then I verify that "Team, Queue" is available and an active user