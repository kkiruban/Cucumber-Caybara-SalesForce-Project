@rml @oms-smoketest-stub
Feature: request for oms application
  In order to access to OMS application
  As a rml customer
  I should be able to request access

  @postive-scenario @oms-smoketest-scenario1
  Scenario: grey mailbags a single grey mail bag for ops product
    Given I am logged in as the "rml" user
    When I go to "discounts-payment/credit-account/online-mail-supplies/oms/home"
    Then I should see "Online Mail Supplies"
    And I should see the following:
      | links                                                              |
      | View all Despatch Manager Online products                          |
      | View all Special Delivery Guaranteed™ products                     |
      | View all Royal Mail Signed For™ products                           |
      | View all Marketing, General Correspondence and Publishing products |
      | View all Royal Mail 24™ and 48™ products                           |
      | View all Franking products                                         |
      | View all International products                                    |
      | View all General mailing containers products                       |
      | View all Dangerous goods labels products                           |
      | View all Royal Mail Tracked 24™ and 48 products                    |
    When I follow "View all General mailing containers products"
    Then I should see "General mailing containers"
    And I fill in "edit-quantity-2" with "10"
    And I wait for 4 seconds
    And I click on the element with xpath "//input[@id='edit-add-to-cart-2']"
    And I wait for 4 seconds
    And I click on the element with xpath "//div[@class='view-footer']/p//a[text()='Checkout']"
    And I wait for 2 seconds
    Then I should see "About You"
    And I should see "Please provide your contact details"
    And I fill in "edit-account-information-telephone" with "000 0000 0000"
    And I wait for 2 seconds
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Delivery"
    And I should see "Where would you like your order delivered?"
    And I wait for 2 seconds
    And I click on the element with xpath "//input[@id='edit-address-id-1']"
    And I take screenshot of current page
    And I click on the element with xpath "//input[@id='edit-additional-information-COLLECTION']"
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Confirm"
    And I should see "Contact Information"
    And I click on the element with xpath "//input[@id='edit-confirm-terms']"
    And I press "Confirm"
    Then I should see "Receipt"
    And I should see "Thank you"
    And I take screenshot of current page
    And I should see "We have received your order"

  @postive-scenario @oms-smoketest-scenario2
  Scenario Outline: Trays a single tray for handling machinable for ops product
    Given I am logged in as the "rml" user
    When I go to "discounts-payment/credit-account/online-mail-supplies/oms/home"
    Then I should see "Online Mail Supplies"
    And I should see the following:
      | links                                                              |
      | View all Despatch Manager Online products                          |
      | View all Special Delivery Guaranteed™ products                     |
      | View all Royal Mail Signed For™ products                           |
      | View all Marketing, General Correspondence and Publishing products |
      | View all Royal Mail 24™ and 48™ products                           |
      | View all Franking products                                         |
      | View all International products                                    |
      | View all General mailing containers products                       |
      | View all Dangerous goods labels products                           |
      | View all Royal Mail Tracked 24™ and 48 products                    |
    When I follow "View all General mailing containers products"
    Then I should see "General mailing containers"
    And I fill in "edit-quantity-3" with "20"
    And I wait for 4 seconds
    And I click on the element with xpath "//input[@id='edit-add-to-cart-3']"
    And I wait for 4 seconds
    And I click on the element with xpath "//div[@class='view-footer']/p//a[text()='Checkout']"
    And I wait for 2 seconds
    Then I should see "About You"
    And I should see "Please provide your contact details"
    And I fill in "edit-account-information-telephone" with "000 0000 0000"
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Delivery"
    And I should see "Where would you like your order delivered?"
    And I click on the element with xpath "//input[@id='edit-address-id-new']"
    And I fill in "edit-paf-address-paf-element-postcode" with "<postcode>"
    And I press "Find Address"
    And I wait for 2 seconds
    And I fill in "edit-paf-address-paf-flat-name" with "<flatname>"
    #    And I select "1 New Cathedral Street Manchester M1 1AD" from "edit-paf-address-paf-select-your-address"
    #    And I press "Select your address"
    And I click on the element with xpath "//input[@id='edit-additional-information-COLLECTION']"
    And I wait for 2 seconds
    And I press "Next"
    Then I should see "Confirm"
    And I should see "Contact Information"
    And I take screenshot of current page
    And I click on the element with xpath "//input[@id='edit-confirm-terms']"
    And I press "Confirm"
    Then I should see "Receipt"
    And I should see "Thank you"
    And I take screenshot of current page
    And I should see "We have received your order"

    Examples: 
      | flatname    | postcode |
      | 1234        | EC1A 1AH |
      | Flat456F-61 | CH5 3QW  |

  @postive-scenario @oms-smoketest-scenario20
  Scenario Outline: Trays a single tray for handling machinable for ops product
    Given I am logged in as the "rml" user
    When I go to "discounts-payment/credit-account/online-mail-supplies/oms/home"
    Then I should see "Online Mail Supplies"
    And I should see the following:
      | links                                                              |
      | View all Despatch Manager Online products                          |
      | View all Special Delivery Guaranteed™ products                     |
      | View all Royal Mail Signed For™ products                           |
      | View all Marketing, General Correspondence and Publishing products |
      | View all Royal Mail 24™ and 48™ products                           |
      | View all Franking products                                         |
      | View all International products                                    |
      | View all General mailing containers products                       |
      | View all Dangerous goods labels products                           |
      | View all Royal Mail Tracked 24™ and 48 products                    |
    When I follow "View all General mailing containers products"
    Then I should see "General mailing containers"
    And I fill in "edit-quantity-3" with "20"
    And I wait for 4 seconds
    And I click on the element with xpath "//input[@id='edit-add-to-cart-3']"
    And I wait for 4 seconds
    And I click on the element with xpath "//div[@class='view-footer']/p//a[text()='Checkout']"
    And I wait for 2 seconds
    Then I should see "About You"
    And I should see "Please provide your contact details"
    And I fill in "edit-account-information-telephone" with "000 0000 0000"
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Delivery"
    And I should see "Where would you like your order delivered?"
    And I click on the element with xpath "//input[@id='edit-address-id-new']"
    And I fill in "edit-paf-address-paf-element-postcode" with "<postcode>"
    And I press "Find Address"
    And I wait for 2 seconds
    And I fill in "edit-paf-address-paf-flat-name" with "<flatname>"
    And I fill in "edit-paf-address-paf-property-name" with "<housename>"
    #    And I select "1 New Cathedral Street Manchester M1 1AD" from "edit-paf-address-paf-select-your-address"
    #    And I press "Select your address"
   # And I click on the element with xpath "//input[@id='edit-additional-information-COLLECTION']"
    And I wait for 2 seconds
    And I press "Next"
    Then I should see "Confirm"
    And I should see "Contact Information"
    And I take screenshot of current page
    And I click on the element with xpath "//input[@id='edit-confirm-terms']"
    And I press "Confirm"
    Then I should see "Receipt"
    And I should see "Thank you"
    And I take screenshot of current page
    And I should see "We have received your order"

    Examples: 
      | flatname                  | postcode | housename             |
      | &&&&1234>>>abc+++t23df::: | EC1A 1AH | 1234>>>abc+++t23df::: |
      | Flat456F-61               | W1A 3RT  | House R Place         |
      | test4567                  | DN55 1AP | house_name            |
      | Flat456F-61               | CH5 3QW  |                       |

  @postive-scenario @oms-smoketest-scenario21
  Scenario Outline: Trays a single tray for handling machinable for ops product
    Given I am logged in as the "rml" user
    When I go to "discounts-payment/credit-account/online-mail-supplies/oms/home"
    Then I should see "Online Mail Supplies"
    And I should see the following:
      | links                                                              |
      | View all Despatch Manager Online products                          |
      | View all Special Delivery Guaranteed™ products                     |
      | View all Royal Mail Signed For™ products                           |
      | View all Marketing, General Correspondence and Publishing products |
      | View all Royal Mail 24™ and 48™ products                           |
      | View all Franking products                                         |
      | View all International products                                    |
      | View all General mailing containers products                       |
      | View all Dangerous goods labels products                           |
      | View all Royal Mail Tracked 24™ and 48 products                    |
    When I follow "View all General mailing containers products"
    Then I should see "General mailing containers"
    And I fill in "edit-quantity-3" with "20"
    And I wait for 4 seconds
    And I click on the element with xpath "//input[@id='edit-add-to-cart-3']"
    And I wait for 4 seconds
    And I click on the element with xpath "//div[@class='view-footer']/p//a[text()='Checkout']"
    And I wait for 2 seconds
    Then I should see "About You"
    And I should see "Please provide your contact details"
    And I fill in "edit-account-information-telephone" with "000 0000 0000"
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Delivery"
    And I should see "Where would you like your order delivered?"
    And I click on the element with xpath "//input[@id='edit-address-id-new']"
    And I fill in "edit-paf-address-paf-element-postcode" with "<postcode>"
    And I press "Find Address"
    And I wait for 2 seconds
    #    And I fill in "edit-paf-address-paf-flat-name" with "1234"
    #    And I select "1 New Cathedral Street Manchester M1 1AD" from "edit-paf-address-paf-select-your-address"
    #    And I press "Select your address"
    And I click on the element with xpath "//input[@id='edit-additional-information-COLLECTION']"
    And I wait for 2 seconds
    And I press "Next"
    Then I should see "Confirm"
    And I should see "Contact Information"
    And I take screenshot of current page
    And I click on the element with xpath "//input[@id='edit-confirm-terms']"
    And I press "Confirm"
    Then I should see "Receipt"
    And I should see "Thank you"
    And I take screenshot of current page
    And I should see "We have received your order"

    Examples: 
      | postcode |
      | M60 0AA  |
      | CR2 6XH  |
      | EC1A 1AH |
      | W1A 1AA  |

  @postive-scenario @scenario3
  Scenario: York Containers a single york container for handling for ops product
    Given I am logged in as the "rml" user
    When I go to "discounts-payment/credit-account/online-mail-supplies/oms/home"
    Then I should see "Online Mail Supplies"
    And I should see the following:
      | links                                                              |
      | View all Despatch Manager Online products                          |
      | View all Special Delivery Guaranteed™ products                     |
      | View all Royal Mail Signed For™ products                           |
      | View all Marketing, General Correspondence and Publishing products |
      | View all Royal Mail 24™ and 48™ products                           |
      | View all Franking products                                         |
      | View all International products                                    |
      | View all General mailing containers products                       |
      | View all Dangerous goods labels products                           |
      | View all Royal Mail Tracked 24™ and 48 products                    |
    When I follow "View all General mailing containers products"
    Then I should see "General mailing containers"
    And I fill in "edit-quantity-4" with "10"
    And I wait for 4 seconds
    And I click on the element with xpath "//input[@id='edit-add-to-cart-4']"
    And I wait for 4 seconds
    And I click on the element with xpath "//div[@class='view-footer']/p//a[text()='Checkout']"
    And I wait for 2 seconds
    Then I should see "About You"
    And I should see "Please provide your contact details"
    And I fill in "edit-account-information-telephone" with "000 0000 0000"
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Delivery"
    And I should see "Where would you like your order delivered?"
    And I click on the element with xpath "//input[@id='edit-address-id-new']"
    And I fill in "edit-paf-address-paf-element-postcode" with "m11 ad"
    And I press "Find Address"
    And I wait for 2 seconds
    And I select "1 New Cathedral Street Manchester M1 1AD" from "edit-paf-address-paf-select-your-address"
    And I press "Select your address"
    And I wait for 2 seconds
    And I press "Next"
    Then I should see "Confirm"
    And I should see "Contact Information"
    And I take screenshot of current page
    And I click on the element with xpath "//input[@id='edit-confirm-terms']"
    And I press "Confirm"
    Then I should see "Receipt"
    And I should see "Thank you"
    And I take screenshot of current page
    And I should see "We have received your order"

  @postive-scenario @scenario4
  Scenario: 2000 x 2nd Class PPI Bag Labels a box of 2000 2nd Class PPI bag  for pol product
    Given I am logged in as the "rml" user
    When I go to "discounts-payment/credit-account/online-mail-supplies/oms/home"
    Then I should see "Online Mail Supplies"
    And I should see the following:
      | links                                                              |
      | View all Despatch Manager Online products                          |
      | View all Special Delivery Guaranteed™ products                     |
      | View all Royal Mail Signed For™ products                           |
      | View all Marketing, General Correspondence and Publishing products |
      | View all Royal Mail 24™ and 48™ products                           |
      | View all Franking products                                         |
      | View all International products                                    |
      | View all General mailing containers products                       |
      | View all Dangerous goods labels products                           |
      | View all Royal Mail Tracked 24™ and 48 products                    |
    When I follow "View all Royal Mail 24™ and 48™ products"
    Then I should see "Royal Mail 24™ and 48™"
    And I fill in "edit-quantity-1" with "10"
    And I wait for 4 seconds
    And I click on the element with xpath "//input[@id='edit-add-to-cart-1']"
    And I wait for 4 seconds
    And I wait for 4 seconds
    And I click on the element with xpath "//div[@class='view-footer']/p//a[text()='Checkout']"
    And I wait for 2 seconds
    Then I should see "About You"
    And I should see "Please provide your contact details"
    And I fill in "edit-account-information-telephone" with "000 0000 0000"
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Delivery"
    And I should see "Where would you like your order delivered?"
    And I click on the element with xpath "//input[@id='edit-address-id-new']"
    And I fill in "edit-paf-address-paf-element-postcode" with "m11 ad"
    And I press "Find Address"
    And I wait for 2 seconds
    And I select "1 New Cathedral Street Manchester M1 1AD" from "edit-paf-address-paf-select-your-address"
    And I press "Select your address"
    And I wait for 2 seconds
    And I press "Next"
    Then I should see "Confirm"
    And I should see "Contact Information"
    And I take screenshot of current page
    And I click on the element with xpath "//input[@id='edit-confirm-terms']"
    And I press "Confirm"
    Then I should see "Receipt"
    And I should see "Thank you"
    And I take screenshot of current page
    And I should see "We have received your order"

  @postive-scenario @scenario5
  Scenario: 750 x Customer Collection Receipts a box of 750 customer collection for pol product
    Given I am logged in as the "rml" user
    When I go to "discounts-payment/credit-account/online-mail-supplies/oms/home"
    Then I should see "Online Mail Supplies"
    And I should see the following:
      | links                                                              |
      | View all Despatch Manager Online products                          |
      | View all Special Delivery Guaranteed™ products                     |
      | View all Royal Mail Signed For™ products                           |
      | View all Marketing, General Correspondence and Publishing products |
      | View all Royal Mail 24™ and 48™ products                           |
      | View all Franking products                                         |
      | View all International products                                    |
      | View all General mailing containers products                       |
      | View all Dangerous goods labels products                           |
      | View all Royal Mail Tracked 24™ and 48 products                    |
    When I follow "View all Royal Mail 24™ and 48™ products"
    Then I should see "Royal Mail 24™ and 48™"
    And I fill in "edit-quantity-2" with "10"
    And I wait for 4 seconds
    And I click on the element with xpath "//input[@id='edit-add-to-cart-2']"
    And I wait for 4 seconds
    And I wait for 4 seconds
    And I click on the element with xpath "//div[@class='view-footer']/p//a[text()='Checkout']"
    And I wait for 2 seconds
    Then I should see "About You"
    And I should see "Please provide your contact details"
    And I fill in "edit-account-information-telephone" with "000 0000 0000"
    And I press "Next"
    And I wait for 2 seconds
    Then I should see "Delivery"
    And I should see "Where would you like your order delivered?"
    And I click on the element with xpath "//input[@id='edit-address-id-new']"
    And I fill in "edit-paf-address-paf-element-postcode" with "m11 ad"
    And I press "Find Address"
    And I wait for 2 seconds
    And I select "1 New Cathedral Street Manchester M1 1AD" from "edit-paf-address-paf-select-your-address"
    And I press "Select your address"
    And I wait for 2 seconds
    And I press "Next"
    Then I should see "Confirm"
    And I should see "Contact Information"
    And I take screenshot of current page
    And I click on the element with xpath "//input[@id='edit-confirm-terms']"
    And I press "Confirm"
    Then I should see "Receipt"
    And I should see "Thank you"
    And I take screenshot of current page
    And I should see "We have received your order"
