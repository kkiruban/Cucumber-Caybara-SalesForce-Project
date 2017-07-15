@ge @opportunity
Feature:
  In order to test opportunity module in salesforce application for ge tenant
  As a tester
  I should verify and validate the module as per client requirement

  Background:
    Given I should navigate to "Opportunities" tab in saleforce application
    And I wait for 5 seconds

  @US-003402 @opp-all-users
  Scenario: US-003402 validate new field discount applied
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I click on opportunity name
    Then I should see content "New Financials"
    And I should see content "Discount Applied"

  @US-003402 @opp-opertional-manager @opp-sales-manager
  Scenario: US-003402 validate new field discount applied
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I click on opportunity name
    Then I should see content "New Financials"
    And I should see content "Discount Applied"

  #    When I double click on quote number and select quote number from lookup field
  #    And I click on "Save" button on top button row
  @US-003403 @opp-all-users
  Scenario: US-003403 Validate new field Invoice Date
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Order Information"
    And I should see invoice date field is visible and editable

  @US-003404 @opp-all-users
  Scenario: US-003403 Verify new checkbox Service Centre Informed of CONO in the Order Information section
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Order Information"
    And I should see service centre informed of cono field is visible and editable

  @US-003418 @opp-all-users
  Scenario: US-003418 Validate new field Invoice Amount
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "New Financials"
    And I should see invoice amount field is visible and editable

  @US-003427 @opp-all-users
  Scenario: US-003427 Validate Business Line picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "New Financials"
    And I should see business line picklist values under opportunity edit row

  @US-003428 @opp-all-users
  Scenario: US-003428 Verify Client Region picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Location Information"
    And I should see client region picklist values under location inofrmation row

  @US-003429 @opp-all-users
  Scenario: US-003429 Verify Client Territory picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Location Information"
    And I should see Client Territory picklist values under location inofrmation row

  @US-003430 @opp-all-users
  Scenario: US-003430 Validate Comm Type picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Opportunity Edit"
    And I should see comm type picklist values under opportunity edit row

  @US-003431 @opp-all-users
  Scenario: US-003431 Validate Country picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Location Information"
    And I should see country picklist values under location inofrmation row

  @US-003432 @opp-all-users
  Scenario: US-003432 Validate Direct Channel picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Location Information"
    And I should see direct channel picklist values under location inofrmation row

  @US-003433 @opp-all-users
  Scenario: US-003433 Validate Opportunity Type picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Opportunity Edit"
    And I should see opportunity type picklist values under opportunity edit row

  @US-003434 @opp-all-users
  Scenario: US-003434 Validate SSI Theatre picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Location Information"
    And I should see SSI theatre picklist values under location information row

  @US-003419 @opp-all-users
  Scenario: US-003419 Validate new field Age on Opportunity
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    Then I should see content "Opportunity Detail"
    And I should see age field is visible under opportunity detail row

  @US-003420 @opp-all-users
  Scenario: US-003420 Verify Client Sales Stage field
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Opportunity Edit"
    And I should see Client Sales Stage field is visible under opportunity detail row

  @US-003421 @opp-all-users
  Scenario: US-003421 Vaidate new field Customer Group
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    And I wait for 5 seconds
    Then I should see content "Opportunity Edit"
    And I should see Customer Group field is visible and editable under opportunity edit row

  @US-003422 @opp-all-users
  Scenario: US-003422 Vaidate new field Source
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Opportunity Edit"
    And I should see source field is visible and editable under opportunity edit row

  @US-003516 @opp-all-users
  Scenario: US-003516 Vaidate field S-Stat picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Opportunity Edit"
    And I should see "S-Stat" field is visible and editable under opportunity edit row
    And I should see "S-Stat" picklist values under opportunity edit row

  @US-003519 @opp-all-users
  Scenario: US-003519 Verify the Client Quote Number field type and value
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    Then I should see content "Opportunity Detail"
    And I should see client quote number field is only readable and visible under opportunity detail row

  @US-003411 @opp-all-users
  Scenario: US-003411 Verify the Client Quote Number field type and value
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Opportunity Edit"
    When I select "Closed Sale" from stage field under opportunity edit row with so number field blank
    And I click on "Save" button on top button row

  @US-003424 @opp-all-users
  Scenario: US-003424 Verify Opportunity Currency picklist values
    Then I should see "Opportunities" link
    When I search opportunity "01_saswat_ge_admin" under search input field
    And I wait for 2 seconds
    And I click on opportunity name
    And I wait for 5 seconds
    And I click on "Edit" button on top button row
    Then I should see content "Opportunity Edit"
    And I should see content "Existing Financials"

  #    And I should see Opportunity Currency picklist values under opportunity edit row
  #    And I should see Renewal Currency picklist values under opportunity edit row
  #    And I should see Renewal List Price Currency picklist values under existing financials row
  @US-003438 @BA
  Scenario: US-003438 Validate exchange rate
    Given I logged in as admin
    When I click on setup button
    And I click on company profile link
    And I wait for 5 seconds
    And I click on Manage Currencies link
    And I clik on manage currencies button
    Then I should verify the table
