@cisco-webex @opportunity
Feature:
  In order to test contact module in salesforce application
  As a tester
  And I should verify all functionalities as per client requirement

  @US-003615 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity
  Scenario: US-003615 added directchannel fields on opportunities and  page layout
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select record type
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see direct channel picklist under opportunity information

  @US-003626 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity
  Scenario: US-003626 Make Client Territory field on the Opportunity not required
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select record type
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see Client Territory field as non mandantory field

  @US-003642 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity @Admin_opportunity
  Scenario: US-003642 updated opportunity tab need to add field for segment
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    Then I should see content "Location and Batch Classification"
    And I should see content "Segment"

  @US-003631 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity @Admin_opportunity
  Scenario: US-003631 Updated Opportunity tab removed Type field
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    Then I should see content "Contact Roles"
    But I should not see type coloumn

  @US-003624 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity @Admin_opportunity
  Scenario: US-003624 Created rule on Opportunity to have Sub Expected Reason Code required
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    And I click on "Edit" button on top button row
    Then I should see content "Churn Information"
    When I select "Strategic: Offset - Migration to SaaS Platform" from expected reason code
    And I click on "Save" button on top button row
    Then I should see error as "Sub Expected Reason Code is required when Expected Reason Code = Strategic: Offset - Migration to SaaS Platform"

  @US-003623 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity @Admin_opportunity
  Scenario: US-003623 Added Sub Expected Reason Code to the Opportunity object
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    Then I should see content "Churn Information"
    And I should see sub expected reason code picklist under churn information

  @US-003603 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity @Admin_opportunity
  Scenario: US-003603 WebEx Quote
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    Then I should see content "Quotes"
    When I click on new quote button under quote section
#    Then I should see the following:
#      """
#      Quote
#      New Quote
#      """
    When I enter all mandatory fields to create new quote
    And I click on "Save" button on top button row
#    Then I should see content "Quote Line Items"

  @US-003604 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity @Admin_opportunity
  Scenario: US-003604 WebEx - Opportunity Product
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    Then I should see content "Products"

  @US-003604 @Admin_opportunity
  Scenario: US-003604 verify fields tracking
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I click on username and select setup link
    And I wait for 5 seconds
    And I click on opporunities then fields under customize app setup
    Then I should see content "Opportunity Product Custom Fields & Relationships"
    And I should see content "Opportunity Product Fields"
    And I should see opportunity custom fields & relationships table

  @US-003605-1 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @Admin_opportunity
  Scenario: US-003605 webEx renewable line item
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on existing relationship id under renewable line item
    And I click on "Edit" button on top button row
    Then I should see renewal status picklist with values under information row
    And I should see "Service" field with read and write permission
    And I should see "Service Model" field with read and write permission
    And I should not see "SSI Sub Result Reason" field

  @US-003609 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @Admin_opportunity
  Scenario: US-003609 WebEx Opportunity
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select record type
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Additional Opportunity Detail"
    And I should see content "Order Information"
    And I should see secondary rep field under additional opportunity detail row
    And I should see initial term field under additional opportunity detail row
    And I should see current term field under additional opportunity detail row
    And I should see renewal term field under additional opportunity detail row
    And I should see client batch field under additional opportunity detail row
    And I should see srev batch	field under additional opportunity detail row
    And I should see estimated close date field under additional opportunity detail row
    And I should see renewal lead picklist field under additional opportunity detail row
    And I should see content "ARR"
    And I should see content "Total Past Due"
    And I should see GPL owner field under additional opportunity detail row
    And I should see new contract number field under additional opportunity detail row
    And I should see invoice date field under additional opportunity detail row
    And I should see possible saas migration chechbox field under additional opportunity detail row
    And I should see recurring picklist field under additional opportunity detail row
    And I should see Upsell Downsell field under additional opportunity detail row
    And I should see content "Churn Information"
    And I should see content "Actual ARR Loss Amount"
    And I should see content "Actual Loss Type"
#    And I should see content "Actual Offset Status"
    And I should see content "Actual Reason Code"
    And I should see content "Cancel Process Effective Date"
    And I should see expected ARR loss amount text field under churn information row
    And I should see expected loss type	picklist field under churn information row
    And I should see expected offset status picklist field under churn information row
    And I should see expected offset amount text field under churn information row
    And I should see expected reason code picklist field under churn information row
    And I should see sub expected reason code field under churn information row
    And I should see expected loss date field under churn information row
    And I should see content "Usage Information"
    And I should see content "Active Host"
    And I should see content "Registered Host"
    And I should see content "Meetings"
    And I should see content "People Minutes (30 Days)"
    And I should see content "Location and Batch Classification"
    And I should see opportunity type picklist field
    And I should see engagement type picklist field
    And I should see business line picklist field
    And I should see client territory picklist field
    And I should see client region picklist field
    And I should see Country picklist field
    And I should see SSI Theatre picklist field
    And I should see content "Segment"

   @US-003658 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @Admin_opportunity
   Scenario: US-003658 WebEx Opportunity
   Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select record type
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Additional Opportunity Detail"
    And I should see content "Order Information"
    And I should see secondary rep field under additional opportunity detail row
    And I should see initial term field under additional opportunity detail row
    And I should see current term field under additional opportunity detail row
    And I should see renewal term field under additional opportunity detail row
    And I should see client batch field under additional opportunity detail row
    And I should see srev batch	field under additional opportunity detail row
    And I should see estimated close date field under additional opportunity detail row
    And I should see renewal lead picklist field under additional opportunity detail row
    And I should see content "ARR"
    And I should see content "Total Past Due"
    And I should see GPL owner field under additional opportunity detail row
    And I should see new contract number field under additional opportunity detail row
    And I should see invoice date field under additional opportunity detail row
    And I should see possible saas migration chechbox field under additional opportunity detail row
    And I should see recurring picklist field under additional opportunity detail row
    And I should see Upsell Downsell field under additional opportunity detail row
    And I should see content "Churn Information"
    And I should see content "Actual ARR Loss Amount"
    And I should see content "Actual Loss Type"
    And I should see content "Actual Reason Code"
    And I should see content "Cancel Process Effective Date"
    And I should see expected ARR loss amount text field under churn information row
    And I should see expected loss type	picklist field under churn information row
    And I should see expected offset status picklist field under churn information row
    And I should see expected offset amount text field under churn information row
    And I should see expected reason code picklist field under churn information row
    And I should see sub expected reason code field under churn information row
    And I should see expected loss date field under churn information row
    And I should see content "Usage Information"
    And I should see content "Active Host"
    And I should see content "Registered Host"
    And I should see content "Meetings"
    And I should see content "People Minutes (30 Days)"
    And I should see content "Location and Batch Classification"
    And I should see opportunity type picklist field
    And I should see engagement type picklist field
    And I should see business line picklist field
    And I should see client territory picklist field
    And I should see client region picklist field
    And I should see Country picklist field
    And I should see SSI Theatre picklist field
    And I should see content "Segment"

  @US-003699 @OpsMgr_opportunity @OpsRep_opportunity
   Scenario:US-003699 Updated fields from Read Only to Editable by the Ops Rep and Ops Manager
   Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select record type
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should verify Actual ARR Loss Amount field type should be editable for opsmanager and opsrep
    And I should verify Actual Loss Type field type should be editable for opsmanager and opsrep
    And I should verify Actual Reason Code field type should be editable for opsmanager and opsrep
    And I should verify Cancel Process Effective Date field type should be editable for opsmanager and opsrep

  @US-003699 @SalesMgr_opportunity
   Scenario:US-003699 Updated fields from Read Only to Editable by the Ops Rep and Ops Manager
   Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select record type
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should verify Actual ARR Loss Amount field type should be read only for salesmanager salesrep and salesops
    And I should verify Actual Loss Type field type should be read only for salesmanager salesrep and salesops
    And I should verify Actual Reason Code field type should be read only for salesmanager salesrep and salesops
    And I should verify Cancel Process Effective Date field type should be read only for salesmanager salesrep and salesops

   @US-003702 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity
   Scenario:US-003702 Added Renewal Extension picklist field to Opportunity
   Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button under select record type
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should verify Renewal Extension field visibility and type should be editable
    And I should verify Renewal Extension picklist values

  @US-003609 @Admin_opportunity
  Scenario: US-003609 verify fields tracking
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I click on username and select setup link
    And I wait for 5 seconds
    And I click on opporunities then fields under customize app setup
    Then I should see content "Opportunity Product Custom Fields & Relationships"
    And I should see content "Opportunity Product Fields"
    And I should see opportunity custom fields & relationships table

  @US-003609 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity @Admin_opportunity
  Scenario: US-003609 Verify Removal of column for Products related list
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    Then I should see content "Renewable Line Item"
    And I should see content "Products"

  @US-003597-2 @Admin_opportunity
  Scenario: US-003597 Verify Stage Closed Sale Rule is off
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    And I click on username and select setup link
    And I wait for 5 seconds
    And I enter opportunity in search field and click on validation rules
    Then I should see content "Opportunity Product Validation Rules"

  @US-003650 @OpsMgr_opportunity @OpsRep_opportunity @SalesMgr_opportunity @SalesRep_opportunity
  Scenario: US-003650 verify closed sale required Rule
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    Then I should see content "Order Information"
    And I should see content "SSI Booking Date"
    And I should see content "Client Booking Date"
    And I should see content "PO Number"
    And I should see content "SO Number"
    And I double click on stage and update to closed sale under opportunity detail
    And I wait for 10 seconds
    And I click on "Save" button on top button row
    And I wait for 10 seconds
    Then I should see error as "Error:The following must be true when Stage = Closed Sale, Client Booking Date, Quote must be synced with Opportunity, Renewal Status on Renewable Line Item must not = Open"