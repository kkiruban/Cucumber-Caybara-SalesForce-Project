@Contacts_feature
Feature: All scenarios related to Contacts feature

  Background: Login to the Application
    Given I login to the "AtRisk" application
    Then I able to see the logged in to "AtRisk" application


  @Contacts-01 @OpsMgr_contacts @OpsRep_contacts @SalesMgr_contacts @SalesRep_contacts @Admin_contacts @SalesOps_contacts
  Scenario: Removed Channel sections from Contact
    When I click on the "Contacts" tab
    Then I able to see the "Contacts" page
    When I click on the "New" button
    Then I able to see the "Contact Edit" page
    And I fill the all contact required fields
    And I click on "Save" button from new "Contacts Edit" page
    Then I able to see the "Contact" created successfully
