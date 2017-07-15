@ge @quotes
Feature:

  Background:
    Given I should navigate to "Quotes" tab in saleforce application

  @US-003407 @quotes-sales-manager @quotes-sales-rep @quotes-sales-ops
  Scenario:US-003407 verify Discount Applied field under Finance and Coverage Details
   When I follow on "New" button
   And I wait for 5 seconds
   Then I should see content "New Quote"
   And I should see content "Finance and Coverage Details"
   And I should see "Discount Applied" text field is visible and editable under finance and coverage details row

@US-003410 @quotes-all-users
  Scenario:US-003407 verify Discount Reason picklist values under Finance and Coverage Details
   When I follow on "New" button
   And I wait for 5 seconds
   Then I should see content "New Quote"
   And I should see content "Finance and Coverage Details"
   And I should see discount reason picklist values under finance and coverage details row

    @US-003414 @quotes-sales-manager
  Scenario:US-003407 verify Discount Applied field under Finance and Coverage Details
   When I follow on "New" button
   And I wait for 5 seconds
   Then I should see content "New Quote"
   And I should see content "Finance and Coverage Details"
   And I should see "List Price - Annual Fully Comp" text field is visible and editable under finance and coverage details row

    @US-003415 @quotes-sales-manager
  Scenario:US-003407 verify Discount Applied field under Finance and Coverage Details
   When I follow on "New" button
   And I wait for 5 seconds
   Then I should see content "New Quote"
   And I should see content "Finance and Coverage Details"
   And I should see "Offer Price - PM + CL" text field is visible and editable under finance and coverage details row

    @US-003416 @quotes-sales-manager
  Scenario:US-003407 verify Discount Applied field under Finance and Coverage Details
   When I follow on "New" button
   And I wait for 5 seconds
   Then I should see content "New Quote"
   And I should see content "Finance and Coverage Details"
   And I should see "Offer Price - PM Only" text field is visible and editable under finance and coverage details row

   @US-003417 @quotes-sales-manager
  Scenario:US-003407 verify Discount Applied field under Finance and Coverage Details
   When I follow on "New" button
   And I wait for 5 seconds
   Then I should see content "New Quote"
   And I should see content "Finance and Coverage Details"
   And I should see "Offer Price Fully Comp" text field is visible and editable under finance and coverage details row

   @US-003424 @opp-all-users
  Scenario: US-003424 Validate Quote Currency field picklist values
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see content "New Quote"
    And I should see content "Finance and Coverage Details"
    And I should see currency picklist values under Finance and Coverage Details