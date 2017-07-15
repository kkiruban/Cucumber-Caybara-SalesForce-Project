@cisco @cases_field_permission

Feature:
  As a tester
  We are verifying the field permission


  @US-003584 @cases-field-permission
  Scenario: verify the field permission for product field
    Given I should login as a "OpsManager"
    When I click on cases tab in salesforce home page
    And I follow on "New" button
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I should verify Sub Case Type field permission for OpsManager for case entity
    And I should verify Case Record Type field permission for OpsManager for case entity
    And I should verify Product field permission for OpsManager for case entity


    @US-003584 @cases-field-permission
  Scenario: verify the field permission for product field
    Given I should login as a "OpsRep"
    When I click on cases tab in salesforce home page
    And I follow on "New" button
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I should verify Sub Case Type field permission for OpsRep for case entity
    And I should verify Case Record Type field permission for OpsRep for case entity
    And I should verify Product field permission for OpsRep for case entity


    @US-003584 @cases-field-permission
  Scenario: verify the field permission for product field
    Given I should login as a "SalesManager"
    When I click on cases tab in salesforce home page
    And I follow on "New" button
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I should verify Sub Case Type field permission for SalesManager for case entity
    And I should verify Case Record Type field permission for SalesManager for case entity
    And I should verify Product field permission for SalesManager for case entity


    @US-003584 @cases-field-permission
  Scenario: verify the field permission for product field
    Given I should login as a "SalesRep"
    When I click on cases tab in salesforce home page
    And I follow on "New" button
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I should verify Sub Case Type field permission for SalesRep for case entity
    And I should verify Case Record Type field permission for SalesRep for case entity
    And I should verify Product field permission for SalesRep for case entity


   @US-003584 @cases-field-permission
  Scenario: verify the field permission for product field
    Given I should login as a "SalesOps"
    When I click on cases tab in salesforce home page
    And I follow on "New" button
    And I select "Booking Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I should verify Sub Case Type field permission for SalesOps for case entity
    And I should verify Case Record Type field permission for SalesOps for case entity
    And I should verify Product field permission for SalesOps for case entity