@rml @registration @smoketest
Feature:
  In order to register a personal user in royal mail website
  As a guest
  I should able to create a personal user in royal mail website

  @negative-flow
  Scenario: creating a personal user in rml website
    Given I am on "http://www.royalmail.com/"
    When I click on "Log in or register" link
    And I should link on register link
    Then I should see page title as "Register with royalmail.com"
    When I click personal radio button
    And I click on continue button
    Then I should see create account title
    When I select mr from title select box
    And I fill firstname as "test"
    And I fill lastname as "user"
    And I should click on terms and conditions check box
    And I should click on register button
    Then I should see the following error "An error has occurred processing your request - see below for details:"