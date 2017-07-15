@cisco-webex @contact
Feature:
  In order to test contact module in salesforce application
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to "Contacts" tab in saleforce application

  @US-003600 @OpsMgr_contacts @SalesMgr_contacts @SalesRep_contacts @Admin_contacts
  Scenario: US-003600 verify new fields added to the contact layout
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Contact Edit
      New Contact
      """
    And I should see type picklist under fields row
    And I should see type picklist with write permission

  @US-003600 @OpsRep_contacts @SalesOps_contacts
  Scenario: US-003600 verify new fields added to the contact layout
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Contact Edit
      New Contact
      """
    And I should see type picklist with read permission

  @US-003600 @Admin_contacts
  Scenario: US-003600 Verify new field tracking history
    When I click on username and select setup link
    And I wait for 5 seconds
    And I click on contacts then fields under customize app setup
    And I wait for 5 seconds
    Then I should see content "Contact Fields"
    And I should see contact custom fields & relationships table

  @US-003649 @OpsMgr_contacts @SalesMgr_contacts @SalesRep_contacts @Admin_contacts @OpsRep_contacts
  Scenario: US-003649 verify new fields added to the contact layout
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Contact Edit
      New Contact
      """
    And I should see clean button
    And I should see clean status field with read only permission