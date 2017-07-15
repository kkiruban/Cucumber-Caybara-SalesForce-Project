@Qlik @opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  Background:
    Given I should navigate to opportunity tab in saleforce application

  @US-004047 @US-004046 @US-004092 @03152017-v1.5-9 @om-opp @or-opp
  Scenario: US-004047 US-004046 US-004092 Opportunity  New fields
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see "SFDC Opportunity Name" field with read and write permission
    And I should see "SFDC Deal ID" field with read and write permission
    And I should see "Previous Multiyear" field with read and write permission
    And I should see "Sales Level 1" field with read and write permission
    And I should see "Sales Level 2" field with read and write permission
    And I should see "Sales Level 3" field with read and write permission
    And I should see "Sales Level 4" field with read and write permission
    And I should see "Sales Level 5" field with read and write permission
    And I should see "Sales Level 6" field with read and write permission
    And I should see content "Partner Information"
    And I should see "Partner Account 1" field with read and write permission
    And I should see "Partner Account 1 Contact" field with read and write permission
    And I should see "Partner Account 1 Type" field with read and write permission
    And I should see "Incumbent" field with read and write permission
    And I should see "Partner Account 2" field with read and write permission
    And I should see "Partner Account 2 Contact" field with read and write permission
    And I should see "Price Book" field with read and write permission
    And I should see "Partner Account 2 Type" field with read and write permission
    And I should verify business line picklist values
    And I should verify Partner Account one Type picklist values
    And I should verify Partner Account two Type picklist values
    But I should not see "Opportunity Location" field
    And I should not see "SSI Theatre" field
    And I should not see "Client Territory" field
    And I should not see "Client Region" field
    When I enter data to required fields under new opportunity section
    And I choose a value from sales level one lookup field
    And I choose a value from sales level two lookup field
    And I choose a value from sales level three lookup field
    And I choose a value from sales level four lookup field
    And I choose a value from sales level five lookup field
    And I choose a value from sales level six lookup field
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    And I should see content "SFDC Opportunity ID"
    And I click on "Edit" button from top row
    And I should see "SFDC Opportunity ID" field with read and write permission

  @US-004046 @sm-opp
  Scenario: 03082017-v1.4-3 salesMgr and salesRep should NOT have the ability to change to closed sale
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on "Edit" button from top row
    And I select "Closed Sale" from stage field
    And I click "Save" button from top row
    Then I should see following "• Opportunities cannot be Closed by Sales Reps or Manager" error

   @US-004046-1 @279078 @om-opp @or-opp @sm-opp
  Scenario: 271352 Add relevant Opportunity related list to PartnerAcct PartnerAcctContact page
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    But I should not see content "Client Territory"
    And I should not see content "Client Region"
    When I click on Add New Partner Opportunity button
    Then I should see content "Add Partner Opportunity"
    When I enter all mandantory fields to create new partner opportunity
    And I should click on grant access bottom row button
    Then I should see content "Partner Opportunity Detail"

  @US-004047 @US-004046 @sm-opp @sr-opp
  Scenario: US-004047 Opportunity  New fields
    When I click on new button
    And I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I should see "SFDC Opportunity Name" field with read and write permission
    And I should see "SFDC Deal ID" field with read and write permission
    And I should see "Previous Multiyear" field with read and write permission
    And I should see "Sales Level 1" field with read and write permission
    And I should see "Sales Level 2" field with read and write permission
    And I should see "Sales Level 3" field with read and write permission
    And I should see "Sales Level 4" field with read and write permission
    And I should see "Sales Level 5" field with read and write permission
    And I should see "Sales Level 6" field with read and write permission
    And I should see "Partner Account 1" field with read and write permission
    And I should see "Partner Account 1 Contact" field with read and write permission
    And I should see "Partner Account 1 Type" field with read and write permission
    And I should see "Incumbent" field with read and write permission
    And I should see "Partner Account 2" field with read and write permission
    And I should see "Partner Account 2 Contact" field with read and write permission
    And I should see "Partner Account 2 Type" field with read and write permission