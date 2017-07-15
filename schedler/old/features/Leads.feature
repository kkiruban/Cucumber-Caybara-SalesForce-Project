@Lead_feature
Feature: All scenarios related to Lead feature

  Background: Login to the Application
    Given I should navigate to Assets tab in saleforce application
    Then I able to see the logged in to "Schneider" application

  @US-003804 @OpsMgr_leads @OpsRep_leads @SalesMgr_leads @SalesRep_leads @Admin_leads @SalesOps_leads
  Scenario: US-003804 Add new fields to Leads page layout
    When I click on "Leads" from "All Tabs" page
    Then I able to see the "Recent Leads" page
    When I click on the "New" button
    Then I able to see the "Lead Edit" page
    And I verify the "Lead Status" pickList field
    And I verify the "Lead Status" pickList values
    And I fill the all lead required fields
    And I click on "Save" button from new "Lead Edit" page
    And I able to see the lead created successfully

  @US-003868 @OpsMgr_leads @OpsRep_leads @SalesMgr_leads @SalesRep_leads @Admin_leads @SalesOps_leads
  Scenario: US-003868 verify lead source field
    When I click on "Leads" from "All Tabs" page
    Then I able to see the "Recent Leads" page
    When I click on the "New" button
    Then I able to see the "Lead Edit" page
    And I verify the "Lead Status" pickList field
    And I verify the "Lead Status" pickList values
    And I should see Lead Source field with default value
    And I fill the all lead required fields
    And I click on "Save" button from new "Lead Edit" page
    And I able to see the lead created successfully

  @US-003866 @OpsMgr_leads @OpsRep_leads @SalesMgr_leads @SalesRep_leads @Admin_leads @SalesOps_leads
  Scenario: US-003866 verify lead source picklist values
    When I click on "Leads" from "All Tabs" page
    Then I able to see the "Recent Leads" page
    When I click on the "New" button
    Then I able to see the "Lead Edit" page
    And I verify the "Lead Status" pickList field
    And I verify the "Lead Status" pickList values
    And I should see Lead Source picklist values
    And I fill the all lead required fields
    And I click on "Save" button from new "Lead Edit" page
    And I able to see the lead created successfully