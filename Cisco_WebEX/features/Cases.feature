@cisco-webex @cases
Feature:
  In order to test case module in salesforce application
  As a tester
  And I should verify all functionalities as per client requirement

  @US-003593 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario Outline: US-003593 verify case milestones
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I fill in description with "testing" under description information row
    And I choose contact name through look up field under description information row
#    And I choose Opportunity name through look up field under description information row
    When I select "<priority>" from priority field under case information row
    Then I should see content "Description Information"
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    And I should see content "Case Milestones"
    And I should see content "<viewcontent>"

    Examples:
      | priority | viewcontent |
      | High     | NALA 24hrs  |

  @US-003593 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario Outline: US-003593 verify case milestones
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I fill in description with "testing" under description information row
    And I choose contact name through look up field under description information row
    When I select "<priority>" from priority field under case information row
    Then I should see content "Description Information"
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    And I should see content "Case Milestones"
    And I should see content "<viewcontent>"

    Examples:
      | Record_Type         | priority | viewcontent |
      | Data Update Request | Normal   | NALA 48hrs  |

  @US-003593 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario Outline: US-003593 verify case milestones
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I fill in description with "testing" under description information row
    And I choose contact name through look up field under description information row
    When I select "<priority>" from priority field under case information row
    Then I should see content "Description Information"
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    And I should see content "Case Milestones"
    And I should see content "<viewcontent>"

    Examples:
      | priority | viewcontent |
      | Low      | NALA 72hrs  |

  @US-003602 @US-003700 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario: US-003602 and US-003700 verify new fields on data update request
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I should see previous contract id under data update details row
    And I should see new contract id under data update details row
    And I should see WebEx Reason Code field
    And I should verify WebEx Reason Code field type should be editable
    And I should verify WebEx Reason Code field picklist values

  @US-003595 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario: US-003595 HA and NS Approval Process
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I should see previous contract id under data update details row
    And I should see new contract id under data update details row
    When I select "Low" from priority field under case information row
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field under description information row
    And I select "House Account" from sub case type picklist under case information row
    And I select "HA - Bad Contract Info - Cancelled - BCC" from ssi result reason picklist
    And I wait for 5 seconds
    And I click on "Save" button on top button row
    And I wait for 5 seconds
    Then I should see content "Case Detail"
    When I get the case no value
    Then I should see content "Approval History"
    When I logout from the current user
    And I login as "opsmgr"
    And I wait for 10 seconds
    And I search case just created through search field
    And I wait for 10 seconds
    And I click on case just created
    Then I should see content "Approval History"

  @US-003630 @SalesMgr_cases @SalesRep_cases
  Scenario: US-003630 request escalation
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    #    Then I should see the following:
    #      """
    #      New Case
    #      Select Case Record Type
    #      """
    And I wait for 5 seconds
    And I wait for 5 seconds
    When I select "Low" from priority field under case information row
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field under description information row
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    When I double click on request escalation under case information
    And I double click on escalation reason and enter proper reason
    And I click on "Save" button on top button row

  @US-003630 @SalesMgr_cases @SalesRep_cases
  Scenario: US-003630 request escalation
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I wait for 5 seconds
    #    Then I should see the following:
    #      """
    #      New Case
    #      Select Case Record Type
    #      """
    When I select "Normal" from priority field under case information row
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field under description information row
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    When I double click on request escalation under case information
    And I double click on escalation reason and enter proper reason
    And I click on "Save" button on top button row

  @US-003630 @SalesMgr_cases @SalesRep_cases
  Scenario: US-003630 request escalation
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    #    Then I should see the following:
    #      """
    #      New Case
    #      Select Case Record Type
    #      """
    And I wait for 5 seconds
    And I wait for 5 seconds
    When I select "High" from priority field under case information row
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field under description information row
    And I click on "Save" button on top button row
    Then I should see content "Case Detail"
    When I double click on request escalation under case information
    And I double click on escalation reason and enter proper reason
    And I click on "Save" button on top button row

  @US-003597 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario: US-003597 Validate Case rules
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I fill in description with "testing" under description information row
    And I select "Reason Code Change" from sub case type picklist under case information row
    And I choose contact name through look up field under description information row
    And I click on "Save" button on top button row
    Then I should see error as "Error: Invalid Data."
    And I should see error as "Review all error messages below to correct your data."
    And I should see error as "Previous Contract ID is required when Sub Case Type = Reason Code Change"

  @US-003597 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario: US-003597 Validate Case rules
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I fill in description with "testing" under description information row
    And I select "Offset" from sub case type picklist under case information row
    And I choose contact name through look up field under description information row
    And I click on "Save" button on top button row
    Then I should see error as "Error: Invalid Data."
    And I should see error as "Review all error messages below to correct your data."

  @US-003701 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario: US-003701 Validate Case rules
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I fill in description with "testing" under description information row
    And I select "--None--" from WebEx Reason Code
    And I choose contact name through look up field under description information row
    And I click on "Save" button on top button row
    Then I should see error as "Error: Invalid Data."
    And I should see error as "Review all error messages below to correct your data."

  @US-003704 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases
  Scenario: US-003704 Validate Case rules
    Given I should navigate to Cases tab in saleforce application
    Then I should see the following:
      """
      Cases
      Home
      """
    When I follow on "New" button
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I wait for 5 seconds
    Then I should see "Alignment" value in sub caste type picklist