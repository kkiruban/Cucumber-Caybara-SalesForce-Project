@sampletest
Feature:
  Testing a sample app

  Scenario: window handling
    Given I am on "http://localhost/bdd/"
    Then I should see page title as "Welcome to BDD Section"
    When I press "click here" link
    And I switch to newly opened window and url should match "http://localhost/bdd/terms.html"

   @iframe-handling
  Scenario: iframe handling
    Given I am on "http://localhost/bdd/"
    Then I should see page title as "Welcome to BDD Section"
    When I switch to iframe and fill a search value as "kiruba"