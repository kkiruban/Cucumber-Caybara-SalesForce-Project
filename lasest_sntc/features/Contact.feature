@cisco @contact

Feature:
  In order to test contact module in salesforce application
  As a tester
  And I should verify all functionalities as per client requirement

Background:
    Given I should navigate to "Contacts" tab in saleforce application

  @US-003566 @nalaOpsMgr_contact @nalaOpsRep_contact @nalaSalesMgr_contact @nalaSalesRep_contact
  Scenario: US-003566 need to make field labeled Type visible on the page layout
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Contact Edit
      New Contact
      """
    And I should see content "Contact Edit"
    And I should see content "Contact Information"
    And I should see type picklist under contact information
    And I should see verify type picklist values under contact information
    When I fill all mandatory fields to create a random new contact
    And I wait for 5 seconds

  #    And I click on "Save" button on top button row
  @US-003566 @nalaSalesOps_contact
  Scenario: US-003566 need to make field labeled Type visible on the page layout
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Contact Edit
      New Contact
      """
    And I should see content "Contact Edit"
    And I should see content "Contact Information"
    But I should not see type picklist under contact information

    @US-003582 @nalaOpsMgr_contact @nalaOpsRep_contact @nalaSalesMgr_contact @nalaSalesRep_contact @nalaAdmin_contact
    Scenario: US-003582 need to make field labeled Type visible on the page layout
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Contact Edit
      New Contact
      """
    And I see the role picklist and there values under contact information row
    
    @US-003678 @nalaOpsMgr_contact @nalaOpsRep_contact @nalaSalesMgr_contact @nalaSalesRep_contact
      Scenario: US-003678 Added validation Rule that requires Type field on the Contact object to be populated
        When I follow on "New" button
        And I wait for 5 seconds
        Then I should see the following:
          """
          Contact Edit
          New Contact
          """
        And I should see content "Contact Edit"
        And I should see content "Contact Information"
        And I should see type picklist under contact information
        And I should see verify type picklist values under contact information
        When I fill all mandatory fields to create a random new contact
        And I wait for 5 seconds    
       And I click on "Save" button on top button row
       And I should see the error message "The following field cannot be blank: Contact Type"
       
  