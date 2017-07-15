@salesforce
Feature:
  In order to land in saleforce service source webpage
  As a registered user
  I should navigate to saleforce service source setup module

  @login
  Scenario: to test the login scenario
    Given I should visit saleforce website
    Then I should see "Welcome to the Salesforce Customer Success Platform."
    And I should see "Login" link
    When I follow "Login" link
    And I fill "Username" as "qa-renewnetops-csmdev19@servicesource.com"
    And I fill "Password" as "pass@word1"
    And I should click on "Log In" button
    Then I should see "QA RenewNetOps at ServiceSource (Partner Main)"

  @ServiceSourceSetup
  Scenario: ServiceSourceSetup
    Given I should land on salesforce application homepage
    And I wait for "2" seconds
    Then I should see "ServiceSource Setup" link
    When I follow "ServiceSource Setup" link
    Then I should see "ServiceSource Setup"
    And I should see "Home"
    And I should see:
      """
      Renewal Management
      Configure where to track your renewal data, what and when to renew, and how to keep your
      renewals accurate.
      """
    And I should see:
      """
      Overview Administration
      Manage your users Overview page including the focus categories that prioritize the
      accounts, opportunities, and tasks your users should touch first, along with the charts that appear in the carousel.
      """
    And I should see:
      """
      Success Plan Definition
      Create and manage success plans for your users, define key indicators for the plan and
      manage the plays that drive best practices.
      """
    And I should see the following links:
      | links                     |
      | Batch Generation Activity |
      | Opportunity Generation    |
      | Opportunity Updates       |
      | Install Base Data Rules   |
      | Mappings                  |
      | Focus Categories          |
      | Focus Category Groups     |
      | Plays                     |
      | Playbooks                 |
      | Indicator Groups          |
      | Success Plan Templates    |
      