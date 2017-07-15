@cisco @Survey-Responses
Feature:
  In order to test contact module in salesforce application
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to survey responses tab in saleforce application
    Then I should see the following:
      """
      Survey Responses
      Home
      """

   @US-003580 @nalaOpsMgr_others @nalaOpsRep_others @nalaSalesMgr_others @nalaSalesRep_others @nalaAdmin_others
   Scenario:US-003580 survey response object configuration
   When I follow on "New" button
   And I wait for 5 seconds
   Then I should see the following:
      """
      Survey Response Edit
      New Survey Response
      """
   And I should see account field under information row
   And I should see date completed field under information row
   And I should see time completed field under information row
   And I should see link to survey field under information row
   And I should see taken by field under information row
   And I should see product field under information row
   And I should see survey name field under information row