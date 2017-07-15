@rml @login @regressiontest
Feature:
  In order to register a personal user in royal mail website
  As a guest
  I should able to create a personal user in royal mail website

  @negative-flow
  Scenario Outline: checking the login functionlaity
    Given I am on "http://www.royalmail.com/"
    When I click on "Log in or register" link
    And I fill email id as "<email-id>"
    And I fill password id as "<password>"
    And I should click on Login button
    Then I should see the following error "An error has occurred processing your request - see below for details:"
    And I should see the link "Sorry your details could not be recognised. Please check that you have entered your details correctly."

    Examples:
      | email-id           | password |
      | testuser@example   | test1234 |
      | kiruba@example.com | test     |
      |                    |          |
      | 1234               | 5342     |
