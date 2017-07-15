@cisco @general
Feature:
  In order to test general functionlaities
  As a tester
  I should verify all the functionalities as per user story

  @US-003557 @nalaAdmin_general
  Scenario: US-003557 base configuration currency
    Given I should navigate to "Home" tab in saleforce application
    And I wait for 5 seconds
    When I click on username and select setup link
    And I wait for 5 seconds
    And I click on company profile link and select manage currencies
    Then I should see content "Currency"
    And I should see content "Advanced Currency Management is not enabled"
    And I should see content "Parenthetical Currency Conversion is enabled"
    And I should verify currency code should shows USD

  @US-003557 @nalaSalesRep_general
  Scenario: US-003557 base configuration currency
    Given I should navigate to Accounts tab in saleforce application
    And I wait for 5 seconds
    When I follow on "New" button
    Then I should see the following:
      """
      Account Edit
      New Account
      """
    And I verify account currency picklist with selected value "USD - U.S. Dollar"
#    When I click on Opportunities tab
#    And I wait for 5 seconds
#    When I follow on "New" button
#    And I wait for 5 seconds
#    And I verify opportunity currency picklist with selected value "USD - U.S. Dollar"

  @US-003557 @nalaAdmin_general
  Scenario: US-003557 base configuration business hours
    Given I should navigate to "Home" tab in saleforce application
    And I wait for 5 seconds
    When I click on username and select setup link
    And I wait for 5 seconds
    And I click on company profile link and select business hours
    Then I should see content "Organization Business Hours"

  @US-003557 @nalaAdmin_general
  Scenario: US-003557 base configuration calendar
    Given I should navigate to "Home" tab in saleforce application
    And I wait for 5 seconds
    When I click on username and select setup link
    And I wait for 5 seconds
    And I click on company profile link and select fiscal year
    Then I should see content "Fiscal Year"
    And I should see content "Custom Fiscal Years"

  #@US-003561 @apacOpsMgr
    #Scenario: US-003561 public sharing groups APAC group
    #  Given I should navigate to "Home" tab in saleforce application
    #  And I wait for 5 seconds
    #  And I create a account for apac group
    #  And I create a contacts for apac group
    #  And I create a opportunity for apac group
    #  And I create a success plan for apac group
    #  And I create a service contracts for apac group
  
    #@US-003561 @nalaOpsMgr_general
    #Scenario: US-003561 public sharing groups nala group
    #  Given I should navigate to "Home" tab in saleforce application
    #  And I wait for 5 seconds
    #  And I create a account for nala group
    #  And I create a success plan for nala group
    #  And I create a service contracts for nala group
    #  And I create a contacts for nala group
    #  And I create a opportunity for nala group
  
    #@US-003561 @apacSalesRep @apacSalesMgr @apacSalesOps
    #Scenario: US-003561 users
    #  Given I should navigate to "Home" tab in saleforce application
    #  And I wait for 5 seconds
    #  When I search account name as "cisco-testing-apac-group-account-name"
    #  Then I should see apac account name "cisco-testing-apac-group-account-name"
    #  When I search apac opportunity as "cisco-testing-apac-group-opportunity-name"
    #  Then I should see apac opportunity name "cisco-testing-apac-group-opportunity-name"
    #  When I search contacts as "cisco-testing-apac-group-contact-name"
    #  Then I should see apac contact name "cisco-testing-apac-group-contact-name"
    #  When I search service contracts as "cisco-testing-apac-group-service-contracts-name"
    #  Then I should see apac service contracts name "cisco-testing-apac-group-service-contracts-name"
  
    #@US-003561 @nalaSalesRep_general @nalaSalesMgr_general
    #Scenario: US-003561 users
    #  Given I should navigate to "Home" tab in saleforce application
    #  And I wait for 5 seconds
    #  When I search account name as "cisco-testing-apac-group-account-name"
    #  But I should not see apac account name "cisco-testing-apac-group-account-name"
    #  When I search opportunity as "cisco-testing-apac-group-opportunity-name"
    #  But I should not see apac opportunity name "cisco-testing-apac-group-opportunity-name"
    #  When I search contacts as "cisco-testing-apac-group-contact-name"
    #  But I should not see apac contact name "cisco-testing-apac-group-contact-name"
    #  When I search service contracts as "cisco-testing-apac-group-service-contracts-name"
    #  But I should not see apac service contracts name "cisco-testing-apac-group-service-contracts-name"
  
    #@US-003561 @nalaOpsMgr_general
    #Scenario: US-003561 public sharing groups nala group
    #  Given I should navigate to "Home" tab in saleforce application
    #  And I wait for 5 seconds
    #  And I create a account for nala group
    #  And I create a success plan for nala group
    #  And I create a service contracts for nala group
    #  And I create a contacts for nala group
    #  And I create a opportunity for nala group
  
    #@US-003561 @nalaSalesRep_general @nalaSalesMgr_general
    #Scenario: US-003561 users
    #  Given I should navigate to "Home" tab in saleforce application
    #  And I wait for 5 seconds
    #  When I search account name as "cisco-testing-nala-group-account-name"
    #  Then I should see nala account name "cisco-testing-nala-group-account-name"
    #  When I search sucess plan as "cisco-testing-nala-group-success-plan-name"
    #  Then I should see nala success plan name "cisco-testing-nala-group-success-plan-name"
    #  When I search nala service contracts as "cisco-testing-nala-group-service-contracts-name"
    #  Then I should see nala service contracts name "cisco-testing-nala-group-service-contracts-name"
    #  When I search contacts as "cisco-testing-nala-group-contact-name"
    #  Then I should see nala contact name "cisco-testing-nala-group-contact-name"
    #  When I search opportunity as "cisco-testing-nala-group-opportunity-name"
    #  Then I should see nala opportunity name "cisco-testing-nala-group-opportunity-name"
  
    #@US-003561 @apacSalesRep @apacSalesMgr
    #Scenario: US-003561 users
    #  Given I should navigate to "Home" tab in saleforce application
    #  And I wait for 5 seconds
    #  When I search account name as "cisco-testing-nala-group-account-name"
    #  But I should not see nala account name "cisco-testing-apac-group-account-name"
    #  When I search sucess plan as "cisco-testing-nala-group-success-plan-name"
    #  But I should not see nala success plan name "cisco-testing-nala-group-success-plan-name"
    #  When I search nala service contracts as "cisco-testing-nala-group-service-contracts-name"
    #  But I should not see nala service contracts name "cisco-testing-nala-group-service-contracts-name"
    #  When I search contacts as "cisco-testing-nala-group-contact-name"
    #  But I should not see nala contact name "cisco-testing-nala-group-contact-name"
    #  When I search opportunity as "cisco-testing-nala-group-opportunity-name"
    #  But I should not see nala opportunity name "cisco-testing-nala-group-opportunity-name"

  @US-003560 @nalaAdmin_general
  Scenario: US-003560 users
    Given I should navigate to "Home" tab in saleforce application
    And I wait for 5 seconds
    When I click on username and select setup link
    And I wait for 5 seconds
    And I click on manage users link
    And I wait for 2 seconds
    And I click on users link
    Then I should see content "All Users"
    When I select "Active Users" from view picklist under all users
    And I verify list of active users inactive users nala group user and apac group users

  @US-003578 @nalaAdmin_general
  Scenario: US-003578 base configuration calendar
    Given I should navigate to "Home" tab in saleforce application
    And I wait for 5 seconds
    When I click on username and select setup link
    And I wait for 5 seconds
    And I enter "scheduled jobs" in search field and click
    Then I should see content "All Scheduled Jobs"
    And I should see content "CSM_BatchCreatePlayScheduledDispatcher"
    When I click on CSM_BatchCreatePlayScheduledDispatcher manage link
    Then I should see content "Schedule Apex"

    @US-003639 @nalaAdmin_general
    Scenario: US-003639 Access to the Cisco Management Folder
    Given I should navigate to "Reports" tab in saleforce application
    When I wait for 5 seconds
    And I click on the pin on the right of the cisco management folder
    And I verify that the users have access to the cisco management folder    
       
    
    @US-003674 @nalaAdmin_general
    Scenario: US-003674 CSM_MstrScheduledDispatcher
        Given I should navigate to "Home" tab in saleforce application
        And I wait for 5 seconds
        When I click on username and select setup link
        And I wait for 5 seconds
        And I enter "scheduled jobs" in search field and click
        Then I should see content "All Scheduled Jobs"
        And I should see content "CSM_MstrScheduledDispatcher"
        When I click on CSM_MstrScheduledDispatcher manage link
    	Then I should see content "Schedule Apex"
    	Then I should see running hours

 @US-003673 @nalaAdmin_general
  Scenario: US-003673 Added 4 new picklist flex fields
    Given I should navigate to "Home" tab in saleforce application
    And I wait for 5 seconds
    When I click on username and select setup link
    And I wait for 5 seconds
    When I click on Customize link and Activity Custom
    When I check Newly added Custom Fields
    