@cisco @Success_Plan_Playbooks
Feature:
  In order to validate sps section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Success Plan Playbooks" tab in saleforce application

  @US-003712_Admin @nalaAdmin_sp
  Scenario: US-003712 The buttons should be removed from all profiles   
   And I click on any existing success plan playbook   
   And I check that "Clone" button is not available
   And I check that "Delete" button is not available
   And I check that "Edit" button is not available