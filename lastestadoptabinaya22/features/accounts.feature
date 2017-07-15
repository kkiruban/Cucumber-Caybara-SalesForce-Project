@emea @opportunities @create_data
Feature: Accounts
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I should navigate to "Accounts" tab in saleforce application

  @US-003567 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account
  Scenario: US-003567 Remove the following fields from the Account page layout
    When I select existing account record
    Then I should not see the field "Account Owner"
    And I should not see the field "Health Status"
    And I should not see the field "Number of Cases"
    And I should not see the field "Number of New Cases"
    And I should not see the field "Number of Working Cases"
    And I should not see the field "Last Health Status"
    And I should not see the field "Number of Open High Priority Cases"
    And I should not see the field "Number of Closed Cases"
    And I should not see the field "Oldest Open Case"
    And I should see the field "Client Theatre" under Account Detail section
    And I should see Client Theatre field under Data.com Key
    And I click Edit button from top button row
    And I should see the field "Client Theatre" with - RW - permission
    And I click Save button from top button row
    And I should see "Client Theatre" field picklist options
    And I should see the field "Industry" under Account Detail section
    And I click Edit button from top button row
    And I should see the  "Professional Services" under "Industry" dropdown
    And I should see the  "Service Provider" under "Industry" dropdown
    And I should see the  "Wholesale Distribution" under "Industry" dropdown
    And I click Save button from top button row
    #    And I should see the field "SNTC SREV Health Score" is present under "SNTC" section
    #    And I should see the field "SNTC SREV Health Score" in the left column
    #    And The field "SNTC SREV Health Score" should be non-editable
    #    And I should see the field "SNTC Cisco Health Status" is present under "SNTC" section
    #    And I should see the field "SNTC Cisco Health Status" in the right column
    #    And The field "SNTC Cisco Health Status" should be non-editable
    #    And I should see the field "SNTC Cisco Health Score" is present under "SNTC" section
    #    And I should see the field "SNTC Cisco Health Score" in the left column
    #    And The field "SNTC Cisco Health Score" should be non-editable
    #    And I should see the field "SNTC Inhibitors" is present under "SNTC" section
    #    And I should see the field "SNTC Inhibitors" in the left column
    #    And The field "SNTC Inhibitors" should be non-editable
    #    And I should see the field "SNTC Desired Outcomes" is present under "SNTC" section
    #    And I should see the field "SNTC Desired Outcomes" in the left column
    #    And The field "SNTC Desired Outcomes" should be non-editable
    #    And I should see the field "SNTC Achieved Outcomes" is present under "SNTC" section
    #    And I should see the field "SNTC Achieved Outcomes" in the left column
    #    And The field "SNTC Achieved Outcomes" should be non-editable
    #    And I should see the field "SNTC Features" is present under "SNTC" section
    #    And I should see the field "SNTC Features" in the right column
    #    And The field "SNTC Features" should be non-editable
    #    And I should see the field "SNTC At Risk Reason" is present under "SNTC" section
    #    And I should see the field "SNTC At Risk Reason" in the right column
    #    And The field "SNTC At Risk Reason" should be non-editable
    #    And I should see the field "SNTC Customer Sentiment" is present under "SNTC" section
    #    And I should see the field "SNTC Customer Sentiment" in the right column
    #    And The field "SNTC Customer Sentiment" should be non-editable
    #    And The field "SNTC SREV Health Status" should be non-editable
    #    And I should see the field "SNTC Last Health Status" is present under "SNTC" section
    #    And I should see the field "SNTC Last Health Status" in the right column
    #    And The field "SNTC Last Health Status" should be non-editable
    #    And I should see the field "SNTC Stage" is present under "SNTC" section
    #    And I should see the field "SNTC Stage" in the right column
    #    And The field "SNTC Stage" should be non-editable for sales role
    #    And The field "SNTC Stage" should be editable for ops role
    #    And I should see the field "NOS Cisco Health Status" is present under "NOS" section
    #    And I should see the field "NOS Cisco Health Status" in the right column
    #    And The field "NOS Cisco Health Status" should be non-editable
    #    And I should see the field "NOS SREV Health Score" is present under "NOS" section
    #    And I should see the field "NOS SREV Health Score" in the left column
    #    And The field "NOS SREV Health Score" should be non-editable
    #    And I should see the field "NOS Cisco Health Score" is present under "NOS" section
    #    And I should see the field "NOS Cisco Health Score" in the left column
    #    And The field "NOS Cisco Health Score" should be non-editable
    #    And I should see the field "NOS Inhibitors" is present under "NOS" section
    #    And I should see the field "NOS Inhibitors" in the left column
    #    And The field "NOS Inhibitors" should be non-editable
    #    And I should see the field "NOS Desired Outcomes" is present under "NOS" section
    #    And I should see the field "NOS Desired Outcomes" in the left column
    #    And The field "NOS Desired Outcomes" should be non-editable
    #    And I should see the field "NOS Achieved Outcomes" is present under "NOS" section
    #    And I should see the field "NOS Achieved Outcomes" in the left column
    #    And The field "NOS Achieved Outcomes" should be non-editable
    #    And I should see the field "NOS Features" is present under "NOS" section
    #    And I should see the field "NOS Features" in the right column
    #    And The field "NOS Features" should be non-editable
    #    And I should see the field "NOS At Risk Reason" is present under "NOS" section
    #    And I should see the field "NOS At Risk Reason" in the right column
    #    And The field "NOS At Risk Reason" should be non-editable
    #    And I should see the field "NOS Customer Sentiment" is present under "NOS" section
    #    And I should see the field "NOS Customer Sentiment" in the right column
    #    And The field "NOS Customer Sentiment" should be non-editable
    #    And The field "NOS SREV Health Status" should be non-editable
    #    And I should see the field "NOS Last Health Status" is present under "NOS" section
    #    And I should see the field "NOS Last Health Status" in the right column
    #    And The field "NOS Last Health Status" should be non-editable
    #    And I should see the field "NOS Stage" is present under "NOS" section
    #    And I should see the field "NOS Stage" in the right column
    #    And The field "NOS Stage" should be non-editable for sales role
    #    And The field "NOS Stage" should be editable for ops role
    #    And I should see the field "Collab ELA SREV Health Score" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA SREV Health Score" in the left column
    #    And The field "Collab ELA SREV Health Score" should be non-editable
    #    And I should see the field "Collab ELA Cisco Health Status" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Cisco Health Status" in the right column
    #    And The field "Collab ELA Cisco Health Status" should be non-editable
    #    And I should see the field "Collab ELA Cisco Health Score" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Cisco Health Score" in the left column
    #    And The field "Collab ELA Cisco Health Score" should be non-editable
    #    And I should see the field "Collab ELA Inhibitors" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Inhibitors" in the left column
    #    And The field "Collab ELA Inhibitors" should be non-editable
    #    And I should see the field "Collab ELA Desired Outcomes" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Desired Outcomes" in the left column
    #    And The field "Collab ELA Desired Outcomes" should be non-editable
    #    And I should see the field "Collab ELA Achieved Outcomes" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Achieved Outcomes" in the left column
    #    And The field "Collab ELA Achieved Outcomes" should be non-editable
    #    And I should see the field "Collab ELA Features" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Features" in the right column
    #    And The field "Collab ELA Features" should be non-editable
    #    And I should see the field "Collab ELA At Risk Reason" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA At Risk Reason" in the right column
    #    And The field "Collab ELA At Risk Reason" should be non-editable
    #    And I should see the field "Collab ELA Customer Sentiment" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Customer Sentiment" in the right column
    #    And The field "Collab ELA Customer Sentiment" should be non-editable
    #    And The field "Collab ELA SREV Health Status" should be non-editable
    And I should see the field "Collab ELA Last Health Status" is present under "Collab ELA" section
    And I should see the field "Collab ELA Last Health Status" in the right column
    #    And The field "Collab ELA Last Health Status" should be non-editable
    #    And I should see the field "Collab ELA Stage" is present under "Collab ELA" section
    #    And I should see the field "Collab ELA Stage" in the right column
    #    And The field "Collab ELA Stage" should be non-editable for sales role
    #    And The field "Collab ELA Stage" should be editable for ops role
    #    And I should see the field "AMP SREV Health Score" is present under "AMP" section
    #    And I should see the field "AMP SREV Health Score" in the left column
    #    And The field "AMP SREV Health Score" should be non-editable
    #    And I should see the field "AMP Cisco Health Score" is present under "AMP" section
    #    And I should see the field "AMP Cisco Health Score" in the left column
    #    And The field "AMP Cisco Health Score" should be non-editable
    #    And I should see the field "AMP Inhibitors" is present under "AMP" section
    #    And I should see the field "AMP Inhibitors" in the left column
    #    And The field "AMP Inhibitors" should be non-editable
    #    And I should see the field "AMP Desired Outcomes" is present under "AMP" section
    #    And I should see the field "AMP Desired Outcomes" in the left column
    #    And The field "AMP Desired Outcomes" should be non-editable
    #    And I should see the field "AMP Cisco Health Status" is present under "AMP" section
    #    And I should see the field "AMP Cisco Health Status" in the right column
    #    And The field "AMP Cisco Health Status" should be non-editable
    #    And I should see the field "AMP Achieved Outcomes" is present under "AMP" section
    #    And I should see the field "AMP Achieved Outcomes" in the left column
    #    And The field "AMP Achieved Outcomes" should be non-editable
    #    And I should see the field "AMP Features" is present under "AMP" section
    #    And I should see the field "AMP Features" in the right column
    #    And The field "AMP Features" should be non-editable
    #    And I should see the field "AMP At Risk Reason" is present under "AMP" section
    #    And I should see the field "AMP At Risk Reason" in the right column
    #    And The field "AMP At Risk Reason" should be non-editable
    #    And I should see the field "AMP Customer Sentiment" is present under "AMP" section
    #    And I should see the field "AMP Customer Sentiment" in the right column
    #    And The field "AMP Customer Sentiment" should be non-editable
    #    And The field "AMP SREV Health Status" should be non-editable
    #    And I should see the field "AMP Last Health Status" is present under "AMP" section
    #    And I should see the field "AMP Last Health Status" in the right column
    #    And The field "AMP Last Health Status" should be non-editable
    #    And I should see the field "AMP Stage" is present under "AMP" section
    #    And I should see the field "AMP Stage" in the right column
    #    And The field "AMP Stage" should be non-editable for sales role
    #    And The field "AMP Stage" should be editable for ops role
    #    And I should see the field "AMP Stage" with - Read Only - permission
    And I should not see the "Opportunities" section over the page
    And I should not see the "Assets" section over the page
    And I should see the "Service Contracts" section over the page
    And I should see the "Success Plans (Account)" section over the page
    And I should see the "Type" column in "Contacts" section
    And I should see the "Task" column in "Open Activities" section
    And I should see the field "NOS Inhibitors" with - Read Only - permission
    #    And I should see the field "NOS Inhibitors" with - RW - permission
    #    And I should see the "NOS Inhibitors" as multiselect picklist
    #    And I should see "NOS Inhibitors" field MultiSelectPicklist options
    #    And I should see the field "NOS Desired Outcomes" with - RW - permission
    #    And I should see "NOS Desired Outcomes" field MultiSelectPicklist options
    #    And I should see the "NOS Desired Outcomes" as multiselect picklist
    And I should see the field "NOS Desired Outcomes" with - Read Only - permission
    And I should see the field "NOS Achieved Outcomes" with - Read Only - permission

  #    And I should see the field "NOS Achieved Outcomes" with - RW - permission
  #    And I should see "NOS Achieved Outcomes" field MultiSelectPicklist options
  #    And I should see the "NOS Achieved Outcomes" as multiselect picklist
  @US-003567_2 @Admin_Account
  Scenario: US-003567 Remove the following fields from the Account page layout
    When I select existing account record
    #    And I should see the field "SNTC SREV Health Score" as numeric type
    #    And I should see the field "SNTC Cisco Health Score" as numeric type
    #    And I should see the "SNTC Inhibitors" as multiselect picklist
    #    And I should see "SNTC Inhibitors" field MultiSelectPicklist options
    #    And I should see the "SNTC Desired Outcomes" as multiselect picklist
    #    And I should see "SNTC Desired Outcomes" field MultiSelectPicklist options
    #    And I should see the "SNTC Achieved Outcomes" as multiselect picklist
    #    And I should see "SNTC Achieved Outcomes" field MultiSelectPicklist options
    # And I should see the "SNTC Features" as multiselect picklist
    And I should see the field "SNTC Features" with - RW - permission
    And I should see "SNTC Features" field MultiSelectPicklist options
    #    And I should see the "SNTC At Risk Reason" as picklist type
    #And I should see the field "SNTC At Risk Reason" with - RW - permission
    And I should see "SNTC At Risk Reason" field picklist options
    #    And I should see "SNTC Customer Sentiment" field picklist options
    And I should see the field "SNTC Customer Sentiment" with - RW - permission
    And I should see the "SNTC Customer Sentiment" as picklist type
    #    And I should see the "SNTC SREV Health Status" as picklist type
    And I should see the field "SNTC SREV Health Status" with - RW - permission
    And I should see "SNTC SREV Health Status" field picklist options
    #    And The field "SNTC Last Health Status" should be of date type
    #    And I should see the "SNTC Stage" as picklist type
    #    And I should see "SNTC Stage" field picklist options
    #    And I should see the field "NOS SREV Health Score" as numeric type
    #    And I should see the field "NOS Cisco Health Score" as numeric type
    #    And I should see the "NOS Inhibitors" as multiselect picklist
    #    And I should see "NOS Inhibitors" field MultiSelectPicklist options
    #    And I should see "NOS Desired Outcomes" field MultiSelectPicklist options
    #    And I should see the "NOS Desired Outcomes" as multiselect picklist
    #    And I should see "NOS Achieved Outcomes" field MultiSelectPicklist options
    #    And I should see the "NOS Achieved Outcomes" as multiselect picklist
    And I should see the field "NOS Features" with - RW - permission
    And I should see "NOS Features" field MultiSelectPicklist options
    #    And I should see the "NOS Features" as multiselect picklist
    And I should see the field "NOS At Risk Reason" with - RW - permission
    And I should see "NOS At Risk Reason" field picklist options
    #    And I should see the "NOS At Risk Reason" as picklist type
    And I should see the field "NOS Customer Sentiment" with - RW - permission
    And I should see "NOS Customer Sentiment" field picklist options
    #    And I should see the "NOS Customer Sentiment" as picklist type
    #    And I should see the "NOS SREV Health Status" as picklist type
    And I should see the field "NOS SREV Health Status" with - RW - permission
    And I should see "NOS SREV Health Status" field picklist options
    #    And I should see the "NOS Health Status" as picklist type
    #    And I should see "NOS Health Status" field picklist options
    #    And The field "NOS Last Health Status" should be of date type
    #    And I should see the "NOS Stage" as picklist type
    #And I should see "NOS Stage" field picklist options
    #    And I should see the field "Collab ELA SREV Health Score" as numeric type
    #    And I should see the field "Collab ELA Cisco Health Score" as numeric type
    #And I should see the "Collab ELA Inhibitors" as multiselect picklist
    And I should see the field "Collab ELA Inhibitors" with - RW - permission
    And I should see "Collab ELA Inhibitors" field MultiSelectPicklist options
    #And I should see the "Collab ELA Desired Outcomes" as multiselect picklist
    And I should see the field "Collab ELA Desired Outcomes" with - RW - permission
    And I should see "Collab ELA Desired Outcomes" field MultiSelectPicklist options
    #And I should see the "Collab ELA Achieved Outcomes" as multiselect picklist
    And I should see the field "Collab ELA Achieved Outcomes" with - RW - permission
    And I should see "Collab ELA Achieved Outcomes" field MultiSelectPicklist options
    #And I should see the "Collab ELA Features" as multiselect picklist
    And I should see the field "Collab ELA Features" with - RW - permission
    And I should see "Collab ELA Features" field MultiSelectPicklist options
    #And I should see the "Collab ELA At Risk Reason" as picklist type
    And I should see the field "Collab ELA At Risk Reason" with - RW - permission
    And I should see "Collab ELA At Risk Reason" field picklist options
    And I should see the field "Collab ELA Customer Sentiment" with - RW - permission
    And I should see "Collab ELA Customer Sentiment" field picklist options
    #And I should see the "Collab ELA Customer Sentiment" as picklist type
    #And I should see the "Collab ELA SREV Health Status" as picklist type
    And I should see the field "Collab ELA SREV Health Status" with - RW - permission
    And I should see "Collab ELA SREV Health Status" field picklist options
    #    And The field "Collab ELA Last Health Status" should be of date type
    #    And I should see the "Collab ELA Stage" as picklist type
    #    And I should see "Collab ELA Stage" field picklist options
    #    And I should see the field "AMP SREV Health Score" as numeric type
    #    And I should see the field "AMP Cisco Health Score" as numeric type
    #And I should see the "AMP Inhibitors" as multiselect picklist
    And I should see the field "AMP Inhibitors" with - RW - permission
    And I should see "AMP Inhibitors" field MultiSelectPicklist options
    #And I should see the "AMP Desired Outcomes" as multiselect picklist
    And I should see the field "AMP Desired Outcomes" with - RW - permission
    And I should see "AMP Desired Outcomes" field MultiSelectPicklist options
    #And I should see the "AMP Achieved Outcomes" as multiselect picklist
    And I should see the field "AMP Achieved Outcomes" with - RW - permission
    And I should see "AMP Achieved Outcomes" field MultiSelectPicklist options
    #And I should see the "AMP Features" as multiselect picklist
    And I should see the field "AMP Features" with - RW - permission
    And I should see "AMP Features" field MultiSelectPicklist options
    #And I should see the "AMP At Risk Reason" as picklist type
    And I should see the field "AMP At Risk Reason" with - RW - permission
    And I should see "AMP At Risk Reason" field picklist options
    #And I should see the "AMP Customer Sentiment" as picklist type
    And I should see the field "AMP Customer Sentiment" with - RW - permission
    And I should see "AMP Customer Sentiment" field picklist options
    #And I should see the "AMP SREV Health Status" as picklist type
    #    And The field "AMP Last Health Status" should be of date type
    And I should see the field "AMP SREV Health Status" with - RW - permission
    And I should see "AMP SREV Health Status" field picklist options
    #    And I should see the "AMP Stage" as picklist type
    #    And I should see "AMP Stage" field picklist options
    #    And I should see the field "SNTC Cisco Health Status" with - RW - permission
    #    And I should see "SNTC Cisco Health Status" field picklist options
    #    And I should see the field "NOS Cisco Health Status" with - RW - permission
    And I should see the field "NOS Cisco Health Status" with - RW - permission
    And I should see "NOS Cisco Health Status" field picklist options
    #    And I should see the field "AMP Cisco Health Status" with - RW - permission
    #    And I should see "AMP Cisco Health Status" field picklist options
    And I should see the field "Collab ELA Cisco Health Status" with - RW - permission
    And I should see "Collab ELA Cisco Health Status" field picklist options

  @US-003567_1 @SalesOps_Account
  Scenario: US-003567_1 Remove the following fields from the Account page layout
    When I select existing account record
    Then I should not see the field "Account Owner"
    And I should not see the field "Health Status"
    And I should not see the field "Number of Cases"
    And I should not see the field "Number of New Cases"
    And I should not see the field "Number of Working Cases"
    And I should not see the field "Last Health Status"
    And I should not see the field "Number of Open High Priority Cases"
    And I should not see the field "Number of Closed Cases"
    And I should not see the field "Oldest Open Case"
    #And I should see the field "Client Theatre" under Account Detail section
    #    And I should see Client Theatre field under Data.com Key
    #    And The field "Client Theatre" should be non-editable
    #    And I should see the field "SNTC SREV Health Score" is present under "SNTC" section
    And I should see the field "SNTC SREV Health Score" in the left column
    And The field "SNTC SREV Health Score" should be non-editable
    #    And I should see the field "SNTC Cisco Health Status" is present under "SNTC" section
    And I should see the field "SNTC Cisco Health Status" in the right column
    #And I should see the field "SNTC SREV Health Score" as numeric type
    And The field "SNTC Cisco Health Status" should be non-editable
    #    And I should see the field "SNTC Cisco Health Score" is present under "SNTC" section
    And I should see the field "SNTC Cisco Health Score" in the left column
    And The field "SNTC Cisco Health Score" should be non-editable
    #    And I should see the field "SNTC Inhibitors" is present under "SNTC" section
    And I should see the field "SNTC Inhibitors" in the left column
    And The field "SNTC Inhibitors" should be non-editable
    #    And I should see the field "SNTC Desired Outcomes" is present under "SNTC" section
    And I should see the field "SNTC Desired Outcomes" in the left column
    And The field "SNTC Desired Outcomes" should be non-editable
    #    And I should see the field "SNTC Achieved Outcomes" is present under "SNTC" section
    And I should see the field "SNTC Achieved Outcomes" in the left column
    And The field "SNTC Achieved Outcomes" should be non-editable
    #    And I should see the field "SNTC Features" is present under "SNTC" section
    And I should see the field "SNTC Features" in the right column
    And The field "SNTC Features" should be non-editable
    #    And I should see the field "SNTC At Risk Reason" is present under "SNTC" section
    And I should see the field "SNTC At Risk Reason" in the right column
    And The field "SNTC At Risk Reason" should be non-editable
    #    And I should see the field "SNTC Customer Sentiment" is present under "SNTC" section
    And I should see the field "SNTC Customer Sentiment" in the right column
    And The field "SNTC Customer Sentiment" should be non-editable
    #    And I should see the field "SNTC SREV Health Status" is present under "SNTC" section
    And I should see the field "SNTC SREV Health Status" in the right column
    And The field "SNTC SREV Health Status" should be non-editable
    #    And I should see the field "SNTC Last Health Status" is present under "SNTC" section
    And I should see the field "SNTC Last Health Status" in the right column
    And The field "SNTC Last Health Status" should be non-editable
    #    And I should see the field "SNTC Stage" is present under "SNTC" section
    And I should see the field "SNTC Stage" in the right column
    And The field "SNTC Stage" should be non-editable
    #    And I should see the field "NOS SREV Health Score" is present under "NOS" section
    And I should see the field "NOS SREV Health Score" in the left column
    And The field "NOS SREV Health Score" should be non-editable
    #    And I should see the field "NOS Cisco Health Status" is present under "NOS" section
    And I should see the field "NOS Cisco Health Status" in the right column
    And The field "NOS Cisco Health Status" should be non-editable
    #    And I should see the field "NOS Cisco Health Score" is present under "NOS" section
    And I should see the field "NOS Cisco Health Score" in the left column
    And The field "NOS Cisco Health Score" should be non-editable
    #    And I should see the field "NOS Inhibitors" is present under "NOS" section
    And I should see the field "NOS Inhibitors" in the left column
    And The field "NOS Inhibitors" should be non-editable
    #    And I should see the field "NOS Desired Outcomes" is present under "NOS" section
    And I should see the field "NOS Desired Outcomes" in the left column
    And The field "NOS Desired Outcomes" should be non-editable
    #    And I should see the field "NOS Achieved Outcomes" is present under "NOS" section
    And I should see the field "NOS Achieved Outcomes" in the left column
    And The field "NOS Achieved Outcomes" should be non-editable
    #    And I should see the field "NOS Features" is present under "NOS" section
    And I should see the field "NOS Features" in the right column
    And The field "NOS Features" should be non-editable
    #    And I should see the field "NOS At Risk Reason" is present under "NOS" section
    And I should see the field "NOS At Risk Reason" in the right column
    And The field "NOS At Risk Reason" should be non-editable
    #    And I should see the field "NOS Customer Sentiment" is present under "NOS" section
    And I should see the field "NOS Customer Sentiment" in the right column
    And The field "NOS Customer Sentiment" should be non-editable
    #    And I should see the field "NOS SREV Health Status" is present under "NOS" section
    And I should see the field "NOS SREV Health Status" in the right column
    And The field "NOS SREV Health Status" should be non-editable
    #    And I should see the field "NOS Last Health Status" is present under "NOS" section
    And I should see the field "NOS Last Health Status" in the right column
    And The field "NOS Last Health Status" should be non-editable
    #    And I should see the field "NOS Stage" is present under "NOS" section
    And I should see the field "NOS Stage" in the right column
    And The field "NOS Stage" should be non-editable
    #    And I should see the field "Collab ELA SREV Health Score" is present under "Collab ELA" section
    And I should see the field "Collab ELA SREV Health Score" in the left column
    And The field "Collab ELA SREV Health Score" should be non-editable
    #    And I should see the field "Collab ELA Cisco Health Status" is present under "Collab ELA" section
    And I should see the field "Collab ELA Cisco Health Status" in the right column
    And The field "Collab ELA Cisco Health Status" should be non-editable
    #    And I should see the field "Collab ELA Cisco Health Score" is present under "Collab ELA" section
    And I should see the field "Collab ELA Cisco Health Score" in the left column
    And The field "Collab ELA Cisco Health Score" should be non-editable
    #    And I should see the field "Collab ELA Inhibitors" is present under "Collab ELA" section
    And I should see the field "Collab ELA Inhibitors" in the left column
    And The field "Collab ELA Inhibitors" should be non-editable
    #    And I should see the field "Collab ELA Desired Outcomes" is present under "Collab ELA" section
    And I should see the field "Collab ELA Desired Outcomes" in the left column
    And The field "Collab ELA Desired Outcomes" should be non-editable
    #    And I should see the field "Collab ELA Achieved Outcomes" is present under "Collab ELA" section
    And I should see the field "Collab ELA Achieved Outcomes" in the left column
    And The field "Collab ELA Achieved Outcomes" should be non-editable
    #    And I should see the field "Collab ELA Features" is present under "Collab ELA" section
    And I should see the field "Collab ELA Features" in the right column
    And The field "Collab ELA Features" should be non-editable
    #    And I should see the field "Collab ELA At Risk Reason" is present under "Collab ELA" section
    And I should see the field "Collab ELA At Risk Reason" in the right column
    And The field "Collab ELA At Risk Reason" should be non-editable
    #    And I should see the field "Collab ELA Customer Sentiment" is present under "Collab ELA" section
    And I should see the field "Collab ELA Customer Sentiment" in the right column
    And The field "Collab ELA Customer Sentiment" should be non-editable
    #    And I should see the field "Collab ELA SREV Health Status" is present under "Collab ELA" section
    And I should see the field "Collab ELA SREV Health Status" in the right column
    And The field "Collab ELA SREV Health Status" should be non-editable
    #    And I should see the field "Collab ELA Last Health Status" is present under "Collab ELA" section
    And I should see the field "Collab ELA Last Health Status" in the right column
    And The field "Collab ELA Last Health Status" should be non-editable
    #    And I should see the field "Collab ELA Stage" is present under "Collab ELA" section
    And I should see the field "Collab ELA Stage" in the right column
    And The field "Collab ELA Stage" should be non-editable
    #    And I should see the field "AMP SREV Health Score" is present under "AMP" section
    And I should see the field "AMP SREV Health Score" in the left column
    And The field "AMP SREV Health Score" should be non-editable
    #    And I should see the field "AMP Cisco Health Status" is present under "AMP" section
    And I should see the field "AMP Cisco Health Status" in the right column
    And The field "AMP Cisco Health Status" should be non-editable
    #    And I should see the field "AMP Cisco Health Score" is present under "AMP" section
    And I should see the field "AMP Cisco Health Score" in the left column
    And The field "AMP Cisco Health Score" should be non-editable
    #    And I should see the field "AMP Inhibitors" is present under "AMP" section
    And I should see the field "AMP Inhibitors" in the left column
    And The field "AMP Inhibitors" should be non-editable
    #    And I should see the field "AMP Desired Outcomes" is present under "AMP" section
    And I should see the field "AMP Desired Outcomes" in the left column
    And The field "AMP Desired Outcomes" should be non-editable
    #    And I should see the field "AMP Achieved Outcomes" is present under "AMP" section
    And I should see the field "AMP Achieved Outcomes" in the left column
    And The field "AMP Achieved Outcomes" should be non-editable
    #    And I should see the field "AMP Features" is present under "AMP" section
    And I should see the field "AMP Features" in the right column
    And The field "AMP Features" should be non-editable
    #    And I should see the field "AMP At Risk Reason" is present under "AMP" section
    And I should see the field "AMP At Risk Reason" in the right column
    And The field "AMP At Risk Reason" should be non-editable
    #    And I should see the field "AMP Customer Sentiment" is present under "AMP" section
    And I should see the field "AMP Customer Sentiment" in the right column
    And The field "AMP Customer Sentiment" should be non-editable
    #    And I should see the field "AMP SREV Health Status" is present under "AMP" section
    And I should see the field "AMP SREV Health Status" in the right column
    And The field "AMP SREV Health Status" should be non-editable
    #    And I should see the field "AMP Last Health Status" is present under "AMP" section
    And I should see the field "AMP Last Health Status" in the right column
    And The field "AMP Last Health Status" should be non-editable
    #    And I should see the field "AMP Stage" is present under "AMP" section
    And I should see the field "AMP Stage" in the right column
    And The field "AMP Stage" should be non-editable
    And I should not see the "Opportunities" section over the page
    And I should not see the "Assets" section over the page
    And I should see the "Service Contracts" section over the page
    And I should see the "Success Plans (Account)" section over the page
    And I should see the "Type" column in "Contacts" section
    And I should see the "Task" column in "Open Activities" section

  @US-003581 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account
  Scenario: US-003581 Account Related List
    When I select existing account record
    Then I should see "Survey Responses" section over "Accounts" detail page
    And I should see the "Survey Responses" section under "Success Plans (Account)" section

  @US-003585 @Admin_Account
  Scenario: US-003585 Account Related List
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I clicked the "Accounts" link under "App Setup"
    And I clicked the "Fields" link under "App Setup"
    Then I should see that track history has been enabled for "SNTC Stage" field
    And I should see that track history has been enabled for "NOS Stage" field
    And I should see that track history has been enabled for "Collab ELA Stage" field
    And I should see that track history has been enabled for "AMP Stage" field

  @US-003586 @Admin_Account
  Scenario: US-003586 Account Picklist
    When I select existing account record
    And I click Edit button from top button row
    #And I should see "SNTC Stage" field picklist options
    Then I should see the  "Active" under "SNTC Stage" dropdown
    And I should see the  "Terminated" under "SNTC Stage" dropdown
    And I should see the  "Do Not Contact" under "SNTC Stage" dropdown
    And I should see the  "Sales Pullback" under "SNTC Stage" dropdown
    And I should see the  "Unresponsive" under "SNTC Stage" dropdown
    Then I should see the  "Active" under "NOS Stage" dropdown
    And I should see the  "Terminated" under "NOS Stage" dropdown
    And I should see the  "Do Not Contact" under "NOS Stage" dropdown
    And I should see the  "Sales Pullback" under "NOS Stage" dropdown
    And I should see the  "Unresponsive" under "NOS Stage" dropdown
    Then I should see the  "Active" under "Collab ELA Stage" dropdown
    And I should see the  "Terminated" under "Collab ELA Stage" dropdown
    And I should see the  "Do Not Contact" under "Collab ELA Stage" dropdown
    And I should see the  "Sales Pullback" under "Collab ELA Stage" dropdown
    And I should see the  "Unresponsive" under "Collab ELA Stage" dropdown
    Then I should see the  "Active" under "AMP Stage" dropdown
    And I should see the  "Terminated" under "AMP Stage" dropdown
    And I should see the  "Do Not Contact" under "AMP Stage" dropdown
    And I should see the  "Sales Pullback" under "AMP Stage" dropdown
    And I should see the  "Unresponsive" under "AMP Stage" dropdown
    Then I should not see the option "CSM Contacted" under "SNTC Stage" dropdown
    And I should not see the option "SOM Contacted" under "SNTC Stage" dropdown
    And I should not see the option "Partner Contacted" under "SNTC Stage" dropdown
    And I should not see the option "Customer Contacted" under "SNTC Stage" dropdown
    And I should not see the option "Health Check Scheduled" under "SNTC Stage" dropdown
    And I should not see the option "Health Check Completed" under "SNTC Stage" dropdown
    Then I should not see the option "CSM Contacted" under "NOS Stage" dropdown
    And I should not see the option "SOM Contacted" under "NOS Stage" dropdown
    And I should not see the option "Partner Contacted" under "NOS Stage" dropdown
    And I should not see the option "Customer Contacted" under "NOS Stage" dropdown
    And I should not see the option "Health Check Scheduled" under "NOS Stage" dropdown
    And I should not see the option "Health Check Completed" under "NOS Stage" dropdown
    Then I should not see the option "CSM Contacted" under "Collab ELA Stage" dropdown
    And I should not see the option "SOM Contacted" under "Collab ELA Stage" dropdown
    And I should not see the option "Partner Contacted" under "Collab ELA Stage" dropdown
    And I should not see the option "Customer Contacted" under "Collab ELA Stage" dropdown
    And I should not see the option "Health Check Scheduled" under "Collab ELA Stage" dropdown
    And I should not see the option "Health Check Completed" under "Collab ELA Stage" dropdown
    Then I should not see the option "CSM Contacted" under "AMP Stage" dropdown
    And I should not see the option "SOM Contacted" under "AMP Stage" dropdown
    And I should not see the option "Partner Contacted" under "AMP Stage" dropdown
    And I should not see the option "Customer Contacted" under "AMP Stage" dropdown
    And I should not see the option "Health Check Scheduled" under "AMP Stage" dropdown
    And I should not see the option "Health Check Completed" under "AMP Stage" dropdown
    And I click Save button from top button row

  @US-003587_1_OpsMgr_Account @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @SalesOps_Account
  Scenario: US-003587_1 Account Fields
    When I select existing account record
    #And I click Edit button from top button row
    And I should see the field "SNTC SREV Health Status" in the right column
    And I should see the field "SNTC SREV Health Status" with - Read Only - permission
    And I should see the field "SNTC Cisco Health Status" in the right column
    And I should see the field "SNTC Cisco Health Status" with - Read Only - permission
    And I should see the field "SNTC Features" in the right column
    And I should see the field "SNTC Features" with - Read Only - permission
    And I should see the field "SNTC At Risk Reason" in the right column
    And I should see the field "SNTC At Risk Reason" with - Read Only - permission
    And I should see the field "SNTC Customer Sentiment" in the right column
    And I should see the field "SNTC Customer Sentiment" with - Read Only - permission
    And I should see the field "SNTC Last Health Status" in the right column
    And I should see the field "SNTC Last Health Status" with - Read Only - permission
    And I should see the field "SNTC Stage" in the right column
    And I should see the field "SNTC Stage" with - Read Only - permission
    And I should see the field "NOS SREV Health Status" in the right column
    And I should see the field "NOS SREV Health Status" with - Read Only - permission
    And I should see the field "NOS Cisco Health Status" in the right column
    And I should see the field "NOS Cisco Health Status" with - Read Only - permission
    And I should see the field "NOS Features" in the right column
    And I should see the field "NOS Features" with - Read Only - permission
    And I should see the field "NOS At Risk Reason" in the right column
    And I should see the field "NOS At Risk Reason" with - Read Only - permission
    And I should see the field "NOS Customer Sentiment" in the right column
    And I should see the field "NOS Customer Sentiment" with - Read Only - permission
    And I should see the field "NOS Last Health Status" in the right column
    And I should see the field "NOS Last Health Status" with - Read Only - permission
    And I should see the field "NOS Stage" in the right column
    And I should see the field "NOS Stage" with - Read Only - permission
    And I should see the field "Collab ELA SREV Health Status" in the right column
    And I should see the field "Collab ELA SREV Health Status" with - Read Only - permission
    And I should see the field "Collab ELA Cisco Health Status" in the right column
    And I should see the field "Collab ELA Cisco Health Status" with - Read Only - permission
    And I should see the field "Collab ELA Features" in the right column
    And I should see the field "Collab ELA Features" with - Read Only - permission
    And I should see the field "Collab ELA At Risk Reason" in the right column
    And I should see the field "Collab ELA At Risk Reason" with - Read Only - permission
    And I should see the field "Collab ELA Customer Sentiment" in the right column
    And I should see the field "Collab ELA Customer Sentiment" with - Read Only - permission
    And I should see the field "Collab ELA Last Health Status" in the right column
    And I should see the field "Collab ELA Last Health Status" with - Read Only - permission
    And I should see the field "Collab ELA Stage" in the right column
    And I should see the field "Collab ELA Stage" with - Read Only - permission
    And I should see the field "AMP SREV Health Status" in the right column
    And I should see the field "AMP Cisco Health Status" with - Read Only - permission
    And I should see the field "AMP Features" in the right column
    And I should see the field "AMP Features" with - Read Only - permission
    And I should see the field "AMP At Risk Reason" in the right column
    And I should see the field "AMP At Risk Reason" with - Read Only - permission
    And I should see the field "AMP Customer Sentiment" in the right column
    And I should see the field "AMP Customer Sentiment" with - Read Only - permission
    And I should see the field "AMP Last Health Status" in the right column
    And I should see the field "AMP Last Health Status" with - Read Only - permission
    And I should see the field "AMP Stage" in the right column
    And I should see the field "AMP Stage" with - Read Only - permission

  #    And I should see the field "SNTC SREV Health Status" is present under "SNTC" section
  #    And I should see the field "SNTC SREV Health Status" in the right column
  #    And I should see the field "SNTC SREV Health Status" as the first item in the right column
  #    And I should see the field "NOS SREV Health Status" is present under "NOS" section
  #    And I should see the field "NOS SREV Health Status" in the right column
  #    And I should see the field "NOS SREV Health Status" as the first item in the right column
  #    And I should see the field "Collab ELA SREV Health Status" is present under "Collab ELA" section
  #    And I should see the field "Collab ELA SREV Health Status" in the right column
  #    And I should see the field "Collab ELA SREV Health Status" as the first item in the right column
  #    And I should see the field "AMP SREV Health Status" is present under "AMP" section
  #    And I should see the field "AMP SREV Health Status" in the right column
  #    And I should see the field "AMP SREV Health Status" as the first item in the right column
  #    Then I click Edit button from top button row
  #    And I should see the field "SNTC Cisco Health Status" with - Read Only - permission
  #    And I should see the field "NOS Cisco Health Status" with - Read Only - permission
  #    And I should see the field "AMP Cisco Health Status" with - Read Only - permission
  #    And I should see the field "Collab ELA Cisco Health Status" with - Read Only - permission
  #  @US-003587_2 @Admin_Account
  #  Scenario: US-003587_2 Account Fields
  #    When I select existing account record
  #    Then I click Edit button from top button row
  #    And I should see the field "SNTC Cisco Health Status" with - RW - permission
  #    And I should see the field "NOS Cisco Health Status" with - RW - permission
  #    And I should see the field "AMP Cisco Health Status" with - RW - permission
  #    And I should see the field "Collab ELA Cisco Health Status" with - RW - permission
  @US-003606 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account
  Scenario: US-003606 Account Fields
    When I select existing account record
    And I should see the field "SNTC Engagement Tier" is present under "SNTC" section
    And I should see the field "SNTC Engagement Tier" in the left column
    Then I click Edit button from top button row
    And I should see the field "SNTC Engagement Tier" with - RW - permission
    And I click Save button from top button row
    And I should see "SNTC Engagement Tier" field picklist options
    And I should see the field "AMP Engagement Tier" is present under "AMP" section
    And I should see the field "AMP Engagement Tier" in the left column
    Then I click Edit button from top button row
    And I should see the field "AMP Engagement Tier" with - RW - permission
    And I click Save button from top button row
    And I should see "AMP Engagement Tier" field picklist options
    And I should see the field "Collab ELA Engagement Tier" is present under "Collab ELA" section
    And I should see the field "Collab ELA Engagement Tier" in the left column
    Then I click Edit button from top button row
    And I should see the field "Collab ELA Engagement Tier" with - RW - permission
    And I click Save button from top button row
    And I should see "Collab ELA Engagement Tier" field picklist options

  @US-003606_1 @SalesRep_Account @SalesOps_Account
  Scenario: US-003606_1 Account Fields
    When I select existing account record
    And I should see the field "SNTC Engagement Tier" is present under "SNTC" section
    And I should see the field "SNTC Engagement Tier" in the left column
    Then I click Edit button from top button row
    And I should see the field "SNTC Engagement Tier" with - Read Only - permission
    And I click Save button from top button row
    And I should see the field "AMP Engagement Tier" is present under "AMP" section
    And I should see the field "AMP Engagement Tier" in the left column
    Then I click Edit button from top button row
    And I should see the field "AMP Engagement Tier" with - Read Only - permission
    And I click Save button from top button row
    And I should see the field "Collab ELA Engagement Tier" is present under "Collab ELA" section
    And I should see the field "Collab ELA Engagement Tier" in the left column
    Then I click Edit button from top button row
    And I should see the field "Collab ELA Engagement Tier" with - Read Only - permission
    And I click Save button from top button row

  @US-003601 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account
  Scenario: US-003601 Success Plan Details Visualforce page
    #When I select "PES_Account_Ba" account record
    When I select existing account record
    And I should see the Visualforce page under CSM section

  @US-003629 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account @SalesOps_Account
  Scenario: US-003629 Account related List columns
    When I select existing account record
    Then I should see "Contract Name" column under "Service Contracts" section
    And I should see "Product" column under "Service Contracts" section
    And I should see "Owner Name" column under "Service Contracts" section
    And I should see "Site ID" column under "Service Contracts" section
    And I should see "Product ID" column under "Service Contracts" section
    And I should see "End Date" column under "Service Contracts" section
    And I should see "Survey Name" column under "Survey Responses" section
    And I should see "Taken By" column under "Survey Responses" section
    And I should see "Date Completed" column under "Survey Responses" section
    And I should see "Product" column under "Survey Responses" section
    Then I should see "Assigned To" column under "Open Activities" section
    And I should see "Assigned To" as third column in the "Open Activities" table
    And I should see "Product" column under "Open Activities" section
    And I should see "Product" as 4th column in the "Open Activities" table
    Then I should see "Assigned To" column under "Activity History" section
    And I should see "Assigned To" as third column in the "Activity History" table
    And I should see "Product" column under "Activity History" section
    And I should see "Product" as 4th column in the "Activity History" table

  @US-003636 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account
  Scenario: @US-003636 SNTC Stage, AMP Stage Collab ELA Stage, NOS Stage fields
    When I select existing account record
    And I click Edit button from top button row
    Then I should see the field "SNTC Stage" with RW permission
    And I should see the field "AMP Stage" with RW permission
    And I should see the field "Collab ELA Stage" with RW permission
    And I should see the field "NOS Stage" with RW permission

  @US-003638 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account @SalesOps_Account
  Scenario: @US-003638 SNTC Stage, AMP Stage Collab ELA Stage, NOS Stage fields
    When I select existing account record
    Then I should not see new button under case section

  @US-003662 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @Admin_Account @SalesOps_Account
  Scenario: @US-003662 Formula Field needs to be added to the Account that does not need to visible to users as it will be used for reporting.
    When I select existing account record
    Then I should not see the field "Account Count"

  @US-003586_1 @OpsMgr_Account @OpsRep_Account
  Scenario: US-003586 Account Picklist
    When I select existing account record
    And The field "SNTC Stage" should be editable for ops role
    And The field "NOS Stage" should be editable for ops role
    And The field "Collab ELA Stage" should be editable for ops role
    And The field "AMP Stage" should be editable for ops role

  @US-003675 @SalesRep_Account
  Scenario: US-003675 Remove Sales Rep access to edit the Client Company ID field on the Account record
    When I select existing account record
    And I click Edit button from top button row
    Then I should see the field "Client Company ID" with - Read Only - permission

  @US-003677 @Admin_Account
  Scenario: US-003677 Add New field Customer Success Story
    When I select existing account record
    Then I should see "SNTC Customer Success Story" field picklist options
    And I should see "Collab ELA Customer Success Story" field picklist options
    And I should see "AMP Customer Success Story" field picklist options

  @US-003677_11 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @SalesRep_Account @SalesOps_Account
  Scenario: US-003677 Add New field Customer Success Story
    When I select existing account record
    And I click Edit button from top button row
    Then I should see the field "SNTC Customer Success Story" with - Read Only - permission
    Then I should see the field "Collab ELA Customer Success Story" with - Read Only - permission
    Then I should see the field "AMP Customer Success Story" with - Read Only - permission

 @US-003721 @OpsMgr_Account @OpsRep_Account @SalesMgr_Account @Admin_Account
 Scenario: US-003677 Add picklist value 'Transition' to SNTC Stage, AMP Stage, Collab ELA Stage, NOS Stage
    Given I click on new button under accounts section
    When I enter data to all mandatory fields under new account
    And I click on "Save" button from top row
    And I should navigate to "Accounts" tab
    And I open an exiting account
    And I click on "Edit" button from top row
    Then I check that sntc stage picklist contains transition option
    Then I check that amp stage picklist contains transition option
    Then I check that collab ela stage picklist contains transition option
    Then I check that nos stage picklist contains transition option    