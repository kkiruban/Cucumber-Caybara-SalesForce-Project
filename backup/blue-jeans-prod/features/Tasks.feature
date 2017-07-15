@Tasks_feature
Feature: All scenarios related to Tasks feature

  Background: Login to the Application
    Given I login to the "Blue Jeans" application
    Then I able to see the logged in to "Blue Jeans" application


  @US-004140 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: SMB - Tasks
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" tasks pickList fields


  @US-004140 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - Standard
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Standard" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Standard" successfully
    When I open the created "Task - Standard" Task record
    Then I able to see the "Task Detail" page
	And I should not able to see the "CSM Details" section
	And I should not able to see the "VF Save" button
	

  @US-004140 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - OnBoarding
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Onboarding" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I verify the task "Status" field is visible
    And I verify the task "Status" field values
    And I able to see the "RLM Health Status" pickList should be visible in the left column under "RLM Details"
    And I able to see the "RLM Health Status" field editable permissions except SalesOps
    And I able to see the task "RLM Health Status" pickList field values
    And I verify the default value should be "Black" for "RLM Health Status" pickList
    And I able to see the "RLM Health Status Reason" pickList should be visible in the left column under "RLM Details"
    And I able to see the "RLM Health Status Reason" field editable permissions except SalesOps
    And I able to see the task "RLM Health Status Reason" pickList values
    And I able to see the "Sales Play" pickList should be visible in the left column under "RLM Details"
    And I able to see the "Sales Play" field editable permissions except SalesOps
    And I verify the task "Sales Play" pickList values
    And I verify the "Additional Product Training" pickList should be visible in the right column under "RLM Details"
    And I verify the "Additional Product Training" pickList field editable permissions except SalesOps
    And I verify the task "Additional Product Training" pickList field values
    And I select the "Additional Product Training" is "onVideo"
    And I verify the onVideo "Additional Training Reason" pickList values
    And I select the "Additional Product Training" is "Primetime"
    And I verify the Prime time "Additional Training Reason" pickList values
    And I select the "Additional Product Training" is "Huddle"
    And I verify the Huddle "Additional Training Reason" pickList values
    And I select the "Additional Product Training" is "onSocial"
    And I verify the onSocial "Additional Training Reason" pickList values
    And I verify the "Demo/Walkthrough Needed" checkbox field should be visible in the right column under "RLM Details"
    And I verify the "Demo/Walkthrough Needed" checkbox should be editable for all except SalesOps
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Onboarding" successfully


  @US-004140 @US-004180 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - Customer Success, Tasks_v1.1 - update pickList and field name
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Customer Success" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I verify the task "Status" field is visible
    And I verify the task "Status" field values
    And I able to see the "RLM Health Status" pickList should be visible in the left column under "RLM Details"
    And I able to see the "RLM Health Status" field editable permissions except SalesOps
    And I able to see the task "RLM Health Status" pickList field values
    And I verify the default value should be "Black" for "RLM Health Status" pickList
    And I able to see the "RLM Health Status Reason" pickList should be visible in the left column under "RLM Details"
    And I able to see the "RLM Health Status Reason" field editable permissions except SalesOps
    And I able to see the task "RLM Health Status Reason" pickList values
    And I able to see the "Sales Play" pickList should be visible in the left column under "RLM Details"
    And I able to see the "Sales Play" field editable permissions except SalesOps
    And I verify the task "Sales Play" pickList values
    And I verify the "Additional Product Training" pickList should be visible in the right column under "RLM Details"
    And I verify the "Additional Product Training" pickList field editable permissions except SalesOps
    And I verify the task "Additional Product Training" pickList field values
    And I select the "Additional Product Training" is "onVideo"
    And I verify the onVideo "Additional Training Reason" pickList values
    And I select the "Additional Product Training" is "Primetime"
    And I verify the Prime time "Additional Training Reason" pickList values
    And I select the "Additional Product Training" is "Huddle"
    And I verify the Huddle "Additional Training Reason" pickList values
    And I select the "Additional Product Training" is "onSocial"
    And I verify the onSocial "Additional Training Reason" pickList values
    And I verify the "Executive Business Review Completed" checkbox field should be visible in the right column under "RLM Details"
    And I verify the "Executive Business Review Completed" checkbox should be editable for all except SalesOps
    And I verify the "Deployment Completed" checkbox field should be visible in the right column under "RLM Details"
    And I verify the "Deployment Completed" checkbox should be editable for all except SalesOps
    And I verify the "If No, Why?" text field should be visible in the right column under "RLM Details"
    And I able to see the "If No, Why?" text field should be editable for all except SalesOps
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Customer Success" successfully


  @US-004140 @US-004180 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task - Adoption, Tasks_v1.1 - update pickList and field name
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Adoption" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
	And I verify the task "Status" field is visible
    And I verify the task "Status" field values
    And I able to see the "RLM Health Status" pickList should be visible in the left column under "RLM Details"
    And I able to see the "RLM Health Status" field editable permissions except SalesOps
    And I able to see the task "RLM Health Status" pickList field values
    And I verify the default value should be "Black" for "RLM Health Status" pickList
    And I able to see the "RLM Health Status Reason" pickList should be visible in the left column under "RLM Details"
    And I able to see the "RLM Health Status Reason" field editable permissions except SalesOps
    And I able to see the task "RLM Health Status Reason" pickList values
    And I able to see the "Sales Play" pickList should be visible in the left column under "RLM Details"
    And I able to see the "Sales Play" field editable permissions except SalesOps
    And I verify the task "Sales Play" pickList values
    And I verify the "Additional Product Training" pickList should be visible in the right column under "RLM Details"
    And I verify the "Additional Product Training" pickList field editable permissions except SalesOps
    And I verify the task "Additional Product Training" pickList field values
	And I select the "Additional Product Training" is "onVideo"
	And I verify the onVideo "Additional Training Reason" pickList values
	And I select the "Additional Product Training" is "Primetime"
	And I verify the Prime time "Additional Training Reason" pickList values
	And I select the "Additional Product Training" is "Huddle"
	And I verify the Huddle "Additional Training Reason" pickList values
	And I select the "Additional Product Training" is "onSocial"
	And I verify the onSocial "Additional Training Reason" pickList values
    And I verify the "Deployment Completed" checkbox field should be visible in the right column under "RLM Details"
    And I verify the "Deployment Completed" checkbox should be editable for all except SalesOps
    And I verify the "If No, Why?" text field should be visible in the right column under "RLM Details"
	And I able to see the "If No, Why?" text field should be editable for all except SalesOps
	When I select the "Deployment Completed" check box
    And I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Adoption" successfully


	