@cisco @service_contracts
Feature:
  In order to test service contracts module in salesforce application
  As a tester
  And I should verify all functionalities as per client requirement

  @US-003568 @nalaOpsRep_sc @nalaOpsMgr_sc @nalaAdmin_sc
  Scenario: US-003568 verifying multiple fields in create new service contracts page
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      Service Contract
      New Service Contract
      """
    And I should see content "Service Contract Edit"
    And I should see content "Asset Detail"
    And I should see product picklist under asset detail row
    And I should verify product picklist values under asset detail row
    And I should see client territory picklist under asset detail row
    And I should verify client territory picklist values under asset detail row
    And I should see client segment picklist under asset detail row
    And I should verify client segment picklist values under asset detail row
    And I should see deployment status picklist under asset detail row
    And I should verify deployment status picklist values under asset detail row
    And I should see client batch quarter picklist under asset detail row
    And I should verify client batch quarter picklist values under asset detail row
    And I should see product ID field under asset detail row
    And I should see dtrack case number field under asset detail row
    And I should see client data delivery date field under asset detail row
    And I should see country picklist under asset detail row

  @US-003568 @nalaSalesRep_sc
  Scenario: US-003568 verifying multiple fields in create new service contracts page
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    When I click on go button
    And I wait for 5 seconds
    And I click on underlying contract name as sales ops
    Then I should see content "Product"
    And I should see content "Client Territory"
    And I should see content "Client Segment"
    And I should see content "Country"
    And I should see content "Client Data Delivery Date"
    And I should see content "Dtrack Case Number"
    And I should see content "Product ID"
    And I should see content "Client Batch Quarter"
    And I should see content "Deployment Status"
    And I should see content "Client Segment"
    And I should see content "Client Segment"

  @US-003583 @nalaOpsRep_sc @nalaOpsMgr_sc
  Scenario: US-003583 verify adding of service offering text field
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      Service Contract
      New Service Contract
      """
    And I should see service offering field under asset detail row

  @US-003583 @nalaSalesRep_sc @nalaSalesMgr_sc
  Scenario: US-003583 verify adding of service offering text field
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    When I click on go button
    And I wait for 5 seconds
#    And I click on underlying contract name
    And I click on underlying contract name as sales ops
    Then I should see content "Service Contract Detail"
    And I should see content "Asset Detail"
    And I should see content "Service Offering"

@US-003583 @nalaSalesOps_sc
  Scenario: US-003583 verify adding of service offering text field
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    When I click on go button
    And I wait for 5 seconds
   # And I click on underlying contract name
    And I click on underlying contract name as sales ops
    Then I should see content "Service Contract Detail"
    And I should see content "Asset Detail"
    And I should see content "Service Offering"

  @US-003616-1 @nalaOpsRep_sc @nalaOpsMgr_sc @nalaSalesRep_sc @nalaSalesMgr_sc @nalaAdmin_sc
  Scenario: US-003616 Add field labeled Description to the page layout
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    #    When I select "All Service Contracts" from view picklist
    When I click on go button
    And I wait for 5 seconds
    And I click on underlying contract name as sales ops
    #    And I click on "Save" button on top button row
    #    Then I should see content "Service Contract Detail"
    #    And I should see content "Asset Detail"
    When I click on description field and veirfy whether it is editable

  @US-003622 @nalaOpsMgr_sc @nalaOpsRep_sc @nalaAdmin_sc 
  Scenario: US-003622 Add new fields and remove fields to page layout
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    #    When I select "All Service Contracts" from view picklist
    When I click on go button
    And I wait for 5 seconds
    And I click on underlying contract name
#    And I click on underlying contract name as sales ops
    And I should see content "Client Batch Year"
    And I should see content "Site ID"


  @US-003622-1 @nalaSalesMgr_sc @nalaSalesRep_sc @nalaSalesOps_sc
  Scenario: US-003622 Add new fields and remove fields to page layout
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    #    When I select "All Service Contracts" from view picklist
    When I click on go button
    And I wait for 5 seconds
    And I click on underlying contract name as sales ops
    And I should see content "Client Batch Year"
    And I should see content "Site ID"


@US-003671 @nalaOpsMgr_sc @nalaOpsRep_sc 
  Scenario: US-003671 Add new fields and remove fields to page layout
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    #    When I select "All Service Contracts" from view picklist
    When I click on go button
    And I wait for 5 seconds
   # And I click on underlying contract name
	 And I click on underlying contract name as sales ops
    And I should see content "Client Batch Year-DS"
    And I should see content "Site ID-DS"

  @US-003660 @nalaSalesMgr_sc @nalaSalesRep_sc
  Scenario: Remove access to create Service Contracts or edit Service Contracts from Sales Rep and Sales Manager profiles
    Given I should navigate to "Home" tab in saleforce application
    When I click on all tabs view button
    And I should see content "All Tabs"
    And I should click on service contracts link
    Then I should see the following:
      """
      Service Contracts
      Home
      """
    But I should not see new button to create new service contracts
    When I click on go button
    And I wait for 5 seconds
    And I click on underlying contract name as sales ops
    Then I should see content "Service Contract Detail"
    But I should not see edit button to create new service contracts
