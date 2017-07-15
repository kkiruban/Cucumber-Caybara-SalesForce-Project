@Assets_feature
Feature: All scenarios related to Assets feature

  Background: Login to the Application
    Given I login to the "F5 Networks" application
    Then I able to see the logged in to "F5 Networks" application


  @US-004176 @OpsMgr_Assets @OpsRep_Assets @SalesMgr_Assets @SalesRep_Assets @Admin_Assets @SalesOps_Assets
  Scenario: Update Asset and Asset PickList
    When I click on "Assets" from "All Tabs" page
    Then I able to see the "Recent Assets" page
    When I click on the "New" button
    Then I able to see the "Asset Edit" page
    And I verify the asset "Asset Name" text field should be visible in the left column under "Asset Information" section
    And I verify the "Asset Name" text field should be editable for all users except salesOps
    And I verify the asset "Asset Currency" pickList field should be visible in the left column under "Asset Information" section
    And I verify the "Asset Currency" pickList field should be editable for all users except salesOps
    And I verify the "Asset Currency" pickList field values
    And I verify the "Source Opportunity" lookup field should be visible in the left column under "Asset Information" section
    And I verify the "Source Opportunity" lookup field should be editable for all users except salesOps
    And I verify the "Asset Owner" lookup field should be visible in the right column under "Asset Information" section
    And I able to see the "Asset Owner" text field should be editable for all users except salesOps
    And I verify the asset "Start Date" date field should be visible in the right column under "Asset Information" section
    And I able to see the "Start Date" text field should be editable for all users except salesOps
    And I verify the asset "End Date" date field should be visible in the right column under "Asset Information" section
    And I able to see the "End Date" text field should be editable for all users except salesOps
    When I fill the asset required fields
    And I click on "Save" button from new "Asset Edit" page
    Then I able to see the asset created successfully
