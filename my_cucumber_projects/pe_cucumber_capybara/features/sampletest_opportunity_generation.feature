@salesforce
Feature:
  In order to test the opportunity generation flow
  As a automation tester
  i should navigate to opportunity generation page and test all the functionalities

   
  Scenario: opportunity generation
    Given I should land on salesforce application homepage
    And I wait for "2" seconds
    Then I should see "ServiceSource Setup" link
    When I follow "" link
    Then I should see "ServiceSource Setup"
    When I follow "Opportunity Generation" link
    Then I should see "Opportunity Generation"