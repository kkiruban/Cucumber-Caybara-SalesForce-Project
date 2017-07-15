@Contacts_feature
Feature: All scenarios related to Contacts feature

  Background: Login to the Application
    Given I login to the "F5 Networks" application
    Then I able to see the logged in to "F5 Networks" application


  @US-004165 @OpsMgr_contacts @OpsRep_contacts @SalesMgr_contacts @SalesRep_contacts @Admin_contacts @SalesOps_contacts
  Scenario: Removed "CSM Related" field
    When I click on the "Contacts" tab
    Then I able to see the "Contacts" page
    When I click on the "New" button
    Then I able to see the "Contact Edit" page
    And I should not able to see the "CSM Related" field
    And I verify the contact "Type" pickList field should be visible in the left column under "Contact Details"
    And I verify "Type" PickList field should be editable for all excepts SalesOps
    And I verify the contact "Type" PickList values
    When I fill the all contact required fields
    And I click on "Save" button from new "Contacts Edit" page
    Then I able to see the "Contact" created successfully
