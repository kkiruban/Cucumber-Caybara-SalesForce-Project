@Guidance-opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

@Opp-01 @All-Users_Opportunity
  Scenario: Opp-01 validate new button for opportunity related list
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section

@Opp-02 @All-Users_Opportunity
 Scenario: Opp-02 validate new fields on opportunity details page
  Given I should navigate to "Accounts" tab in saleforce application
  When I click on new button
  Then I should see content "New Account"
  And I enter value to all the mandatory field under new account section
  And I click on "Save" button from top row
  Then I should see content "Account Detail"
  And I navigate to "Accounts" tab
  And I click on the just created account name
  And I click on new Opportunity button from Opportunity related section
  And I check that "Invoicing" field is visble and editable under opportunity details section
  And I check that "Contact" field is visble and editable under opportunity details section
  And I check that "New Contract ID" field is visble and editable under opportunity details section
  And I check that "Quarterly Forecast" field is visble and editable under opportunity details section
  And I check that "Revised/Returned" field is visble and editable under opportunity details section
  And I check that "Field Rep" field is visble and editable under opportunity details section
  And I check that "Invoicing" is a picklist field
  And I check that "Quarterly Forecas" is a picklist field
  And I check that "Revised/Returned" is a picklist field
  And I check that "New Contract ID" is a text field
  And I check the invoicing picklist values
  And I check the quarterly forecast picklist values
  And I check the "Revised/Returned" picklist values
  And I check that "Worked By" is a picklist field
  And I check that "Direct/Channel" is a picklist field
  And I check that "Data Exclusion Type" is a picklist field
  And I check that "SFDC Opp ID" is a text field
  And I check that Quote Ready is a checkbox
  And I check the worked by picklist values
  And I check the Data Exclusion Type picklist values
  And I check the picklist value of "Direct/Channel" field
  And I check that "Partner Account 1 Contact" field is visble and editable under partner information section
  And I check that "Partner Account 1" field is visble and editable under partner information section
  And I check that "Partner Account 1 Type" field is visble and editable under partner information section
  And I check that "Incumbent" field is visble and editable under partner information section
  And I check that "Partner Account 2 Contact" field is visble and editable under partner information section
  And I check that "Partner Account 2" field is visble and editable under partner information section
  And I check that "Partner Account 2 Type" field is visble and editable under partner information section
  And I check the "Partner Account 1 Type" picklist field values
  And I check the vlaue for "Partner Account 2 Type" picklist field
  And I check the Business Line picklist values
  And I check the Client Region picklist values
  And I check the Commit Level picklist values
  And I check the SSI Theatre picklist values
  And I enter data to reqired fields under new opportunity section
  Then I click on "Save" button from top row

@Opp-03 @All-Users_Opportunity
 Scenario: Opp-03 create new quotes
  Given I should navigate to "Accounts" tab in saleforce application
  When I click on new button
  Then I should see content "New Account"
  And I enter value to all the mandatory field under new account section
  And I click on "Save" button from top row
  Then I should see content "Account Detail"
  And I navigate to "Accounts" tab
  And I click on the just created account name
  And I click on new Opportunity button from Opportunity related section
  And I enter data to reqired fields under new opportunity section
  And I click on "Save" button from top row
  And I click on new quote button under quotes section
  Then I should see content "New Quote"
  Then I check the Quote Type picklist values
  Then I check the Quote Type Year picklist values
  And I enter value to mandatory fields under new quote section
  And I click on "Save" button from top row
  Then I should see content "Quote Detail"

@Opp-04 @All-Users_Opportunity
 Scenario: Opp-04 create quote line items
  Given I should navigate to "Accounts" tab in saleforce application
  When I click on new button
  Then I should see content "New Account"
  And I enter value to all the mandatory field under new account section
  And I click on "Save" button from top row
  Then I should see content "Account Detail"
  And I navigate to "Accounts" tab
  And I click on the just created account name
  And I click on new Opportunity button from Opportunity related section
  And I enter data to reqired fields under new opportunity section
  And I click on "Save" button from top row
  And I click on new quote button under quotes section
  Then I should see content "New Quote"
  And I enter value to mandatory fields under new quote section
  And I click on "Save" button from top row
  Then I should see content "Quote Detail"
  And I click on add line items button under quote line items section
  And I select existing product name
  And I clik on select button
  And I enter start date field value
  And I enter end date field value
  And I enter quantity field value
  And I enter sales price field value
  And I select value from batch type field
  And I click on "Save" button under add quote line items to page
  Then I should see content "Quote Detail"

@Opp-05 @All-Users_Opportunity
 Scenario: Opp-05 sync quote
  Given I should navigate to "Accounts" tab in saleforce application
  When I click on new button
  Then I should see content "New Account"
  And I enter value to all the mandatory field under new account section
  And I click on "Save" button from top row
  Then I should see content "Account Detail"
  And I navigate to "Accounts" tab
  And I click on the just created account name
  And I click on new Opportunity button from Opportunity related section
  And I enter data to reqired fields under new opportunity section
  And I click on "Save" button from top row
  And I click on new quote button under quotes section
  Then I should see content "New Quote"
  And I enter value to mandatory fields under new quote section
  And I click on "Save" button from top row
  Then I should see content "Quote Detail"
  And I click on add line items button under quote line items section
  And I select existing product name
  And I clik on select button
  And I note the product name under add quote line items to section
  And I enter start date field value
  And I enter end date field value
  And I enter quantity field value
  And I enter sales price field value
  And I select value from batch type field
  And I click on "Save" button under add quote line items to page
  Then I should see content "Quote Detail"
  And I click on "Start Sync" button from top row
  And I click on "Sync" button
  And I click on "Done" button
  Then I should see content "Quote Detail"
  And I click on opportunity name link
  Then I check that new line items added is be visible under products related list

@Opp-06 @All-Users_Opportunity
 Scenario: Opp-06 create renewable line item
  Given I should navigate to "Accounts" tab in saleforce application
  When I click on new button
  Then I should see content "New Account"
  And I enter value to all the mandatory field under new account section
  And I click on "Save" button from top row
  Then I should see content "Account Detail"
  And I navigate to "Accounts" tab
  And I click on the just created account name
  And I click on new Opportunity button from Opportunity related section
  And I enter data to reqired fields under new opportunity section
  And I click on "Save" button from top row
  And I click on new quote button under quotes section
  Then I should see content "New Quote"
  And I enter value to mandatory fields under new quote section
  And I click on "Save" button from top row
  Then I should see content "Quote Detail"  
  And I click on add line items button under quote line items section
  And I select existing product name
  And I clik on select button
  And I note the product name under add quote line items to section
  And I enter start date field value
  And I enter end date field value
  And I enter quantity field value
  And I enter sales price field value
  And I select value from batch type field
  And I click on "Save" button under add quote line items to page
  Then I should see content "Quote Detail"
  And I click on "Start Sync" button from top row
  And I click on "Sync" button
  And I click on "Done" button
  Then I should see content "Quote Detail"
  And I click on opportunity name link
  Then I check that new line items added is be visible under products related list
  And I click on "New Renewable Line Item" button under renewable line item section
  And I enter data to all mandatory fields under renewable line item
  And I click on "Save" button in renewable line item section
  And I click on "Edit" button from top row
  Then I check that "AM Project" is visible and editable
  Then I check that "Existing Product" is visible and editable
  Then I check that "Covered Product" is visible and editable
  Then I check that "AM Project" is a text field
  Then I check that "Existing Product" is a text field
  Then I check that "Covered Product" is a text field
  Then I check the picklist values for batch type field
  Then I check the picklist values for ssi sub result reason field
  Then I update value to previous price field
  Then I update value to am project field
  Then I select value from ssi sub result reason picklist
  Then I select value from batch type picklist
  And I click on "Save" button from top row
  Then I should see content "Renewable Line Item Detail"


@Opp-07 @All-Users_Opportunity
 Scenario: Opp-07 manage renewals
  Given I should navigate to "Accounts" tab in saleforce application
  When I click on new button
  Then I should see content "New Account"
  And I enter value to all the mandatory field under new account section
  And I click on "Save" button from top row
  Then I should see content "Account Detail"
  And I navigate to "Accounts" tab
  And I click on the just created account name
  And I click on new Opportunity button from Opportunity related section
  And I enter data to reqired fields under new opportunity section
  And I click on "Save" button from top row
  And I click on new quote button under quotes section
  Then I should see content "New Quote"
  And I enter value to mandatory fields under new quote section
  And I click on "Save" button from top row
  Then I should see content "Quote Detail"
  And I click on add line items button under quote line items section
  And I select existing product name
  And I clik on select button
  And I note the product name under add quote line items to section
  And I enter start date field value
  And I enter end date field value
  And I enter quantity field value
  And I enter sales price field value
  And I select value from batch type field
  And I click on "Save" button under add quote line items to page
  Then I should see content "Quote Detail"
  And I click on "Start Sync" button from top row
  And I click on "Sync" button
  And I click on "Done" button
  Then I should see content "Quote Detail"
  And I click on opportunity name link
  Then I check that new line items added is be visible under products related list
  And I click on "New Renewable Line Item" button under renewable line item section
  And I enter data to all mandatory fields under renewable line item
  And I click on "Save" button in renewable line item section
  And I click on "Edit" button from top row
  Then I check that "AM Project" is visible and editable
  Then I check that "Existing Product" is visible and editable
  Then I check that "Covered Product" is visible and editable
  Then I check that "AM Project" is a text field
  Then I check that "Existing Product" is a text field
  Then I check that "Covered Product" is a text field
  Then I check the picklist values for batch type field
  Then I check the picklist values for ssi sub result reason field
  Then I update value to previous price field
  Then I update value to am project field
  Then I select value from ssi sub result reason picklist
  Then I select value from batch type picklist
  And I click on "Save" button from top row
  Then I should see content "Renewable Line Item Detail"
  And I click on renewal opportunity link
  And I click on "Manage Renewals" button under renewable line item section
  And I select any existing product line on the list
  And I click on renewal status button
  Then I check that Open is avialble in the dropdown
  Then I check that Lost is avialble in the dropdown
  Then I check that Won is avialble in the dropdown







