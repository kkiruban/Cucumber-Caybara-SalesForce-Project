@rml @oms @smoketest
Feature: request for oms application
  In order to access to OMS application
  As a rml customer
  I should be able to request access

  Scenario: csm user approves request
    Given I am logged in as the "csm" user
    When I go to "/parcel-despatch-medium/online-mail-supplies"
    And I wait for 5 seconds
    And I follow "Order mail supplies now"
    And I should see the following:
      | links                      |
      | New Orders                 |
      | Order Search               |
      | User registration requests |
      | My Past Orders             |
      | Online Mail Supplies       |
    And I follow "User registration requests"
    When I follow "View Details"
    And I should see the text:
      """
      Registration Type: Business
      Contact Title: Mr.
      Contact first name: Test
      Contact last name: User
      Account Number: Test
      """
    And I press "Grant Access"
    And I should see "OMS Access Request Test has been deleted."
    Then I go to "/logout"
    And I wait for 5 seconds

  @order
  Scenario Outline: customer with OMS roles is able to place order successfully
    Given I am logged in as "<username>" with the password "<password>"
    When I go to "/parcel-despatch-medium/online-mail-supplies"
    And I wait for 5 seconds
    And I follow "Order mail supplies now"
    And I follow "View all Despatch Manager Online products"
    And I wait for 3 seconds
    When I press "<product>"
    And I wait for 5 seconds
    And I should see text matching "<product_name>"
    And I should see text matching "your basket"
    And I follow "Checkout"
    And I wait for 3 seconds
    And I should see "Please provide your contact details"
    And I press "Next"
    And I wait for 3 seconds
    And I should see "Where would you like your order delivered?"
    And I select the radio button "Dummy Flat, Dummy Property Nm., Dummy PropertyNo., Dummy Street, Dummy City, WN6 7AA"
    And I wait for 5 seconds
    And I press "Next"
    And I should see "Contact Information"
    And I should see the text:
      """
       OMS CustomerServices
       Dummy Flat
       Dummy PropertyNo. Dummy Property Nm., Dummy Street
       Dummy City
       WN6 7AA
      """
    And I check "edit-confirm-terms"
    And I press "Confirm"
    And I wait for 5 seconds
    And I should see "We have received your order"
    Then I go to "/logout_confirm"
    And I wait for 3 seconds

    Examples: 
      | username                   | password | product                                                 | product_name                            |
      | omscsmtestuser@example.com | test1234 | Add to basket - 2000 x Royal Mail Tracked 24 bag labels | 2000 x Royal Mail Tracked 24 bag labels |
      | omscsmtestuser@example.com | test1234 | Add to basket - 2000 x Royal Mail Tracked 48 bag labels | 2000 x Royal Mail Tracked 48 bag labels |

  Scenario: csm user approves order
    Given I am logged in as the "csm" user
    When I go to "/parcel-despatch-medium/online-mail-supplies"
    And I wait for 5 seconds
    And I follow "Order mail supplies now"
    And I wait for 5 seconds
    When I follow "New Orders"
    And I wait for 3 seconds
    And I click on the element with xpath "//table[@class='views-table cols-5 caption-less']//tr//td//a"
    And I should see the text:
      """
      Test User
      1 Forge End
      Woking
      GU21 6DB
      """
    And I press "Mark as processed"
    And I should see text matching "has been marked as processed"
    Then I go to "/logout"
    And I wait for 5 seconds
