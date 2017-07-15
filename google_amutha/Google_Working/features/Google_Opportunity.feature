@google-opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  @US-003694 @All-Users-opportunity
  Scenario: US-003694 Add Google SFDC ID Original Order Number and DirectChannel to page layout
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I should see direct channel field under partner information
    And I should see Google SFDC ID field under opportunity detail
    And I should see Original Order Number under order information
    And I should verify direct channel field permission
    And I should verify Google SFDC ID field permission
    And I should verify Original Order Number field permission

  @US-003695 @All-Users-opportunity
  Scenario: US-003695 Add Picklist for Client Region Client Theatre Currency Engagement type and Client Territory
    Given I should navigate to "Opportunities" tab in saleforce application
    When I wait for 5 seconds
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I should verify business line picklist values
    And I should verify Client Territory picklist values
    And I should verify Renewal Currencies picklist values
    And I should verify SSI Theatre picklist values
    And I should verify Client Regions picklist values

  @US-003696 @All-Users-opportunity
  Scenario: US-003696 update Opportunity Product
    Given I should navigate to "Opportunities" tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I search opportunity "Smoke Test Opp01" under search input field
    Then I click on Edit Product Line Item in opportunity page
    Then I should see content "Opportunity Product Edit"
    And I should see Covered Product field in opportunity edit page
    And I should see Product field in opportunity edit page

    @US-003697 @Admin-Opportunity
  Scenario: US-003697 Update to Renewable Line Item
    Given I should navigate to "Opportunities" tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I fill all mandantory fields to create a new opportunity
    And I click on "Save" button on top button row
    Then I should see content "Opportunity Detail"
    When I click on new renewable line item button
    Then I should see content "Renewable Line Item"
    When I fill all mandantory fields to create new renewable line item
    And I click on "Save" button on top button row
    Then I should see content "Renewable Line Item Detail"
    When I click on opportunity link under renewal relationship details
    Then I should see content "Opportunity Detail"
    And I click on "Edit" button on top button row
    And I should see Covered Product field in opportunity edit page
    And I should see Existing Product field in opportunity edit page

   @US-003690 @Admin-Opportunity
    Scenario: US-003690 SSI ZTH Stage Closed Sale
      Given I should navigate to "Opportunities" tab in saleforce application
      Then I should see the following:
        """
        Opportunities
        Home
        """
      When I follow on "New" button
      Then I should see the following:
        """
        New Opportunity
        Select Opportunity Record Type
        """
      When I select "Opportunity - Edit" from record type of new record picklist
      And I click on "Continue" button from bottom row
      Then I should see the following:
        """
        Opportunity Edit
        New Opportunity
        """
      And I should see content "Opportunity Edit"
      And I fill all mandantory fields to create a new opportunity
      And I click on "Save" button on top button row
      Then I should see content "Opportunity Detail"
      When I click on new renewable line item button
      Then I should see content "Renewable Line Item"
      When I fill all mandantory fields to create new renewable line item
      And I click on "Save" button on top button row
      Then I should see content "Renewable Line Item Detail"
      When I click on opportunity link under renewal relationship details
      Then I should see content "Opportunity Detail"
      When I click on new quote button
      Then I should see the following:
        """
        Quote
        New Quote
        """
      When I fill quote name under quote information section
      And I click on "Save" button on top button row
      Then I should see content "Quote Detail"
      When I click on opporunity name under quote detail
      Then I should see content "Opportunity Detail"
      When I click on "Edit" button on top button row
      And I select "closed sale" from stage picklist
      And I click on "Save" button on top button row
   Then I should see content "Error: Invalid Data."
   
   
    @US-003694 @SalesRep_Opp @SalesOps_Opp
     Scenario: US-003694 Add Google SFDC ID Original Order Number and DirectChannel to page layout
       Given I should navigate to "Opportunities" tab in saleforce application
       When I wait for 5 seconds
       When I search opportunity "Smoke Test" under search input field
       And I click on "Edit" button on top button row
       And I should see direct channel field under partner information
       And I should see Google SFDC ID field under opportunity detail
       And I should see Original Order Number under order information
       And I should verify direct channel field permission
       And I should verify Google SFDC ID field permission
       And I should verify Original Order Number field permission
   
     @US-003695 @SalesRep_Opp 
     Scenario: US-003695 Add Picklist for Client Region Client Theatre Currency Engagement type and Client Territory
     	Given I should navigate to "Opportunities" tab in saleforce application
     	When I wait for 5 seconds
    	When I search opportunity "Smoke Test Opp01" under search input field
       And I click on "Edit" button on top button row
      And I should verify business line picklist values
       And I should verify Client Territory picklist values       
       And I should verify SSI Theatre picklist values
    And I should verify Client Regions picklist values