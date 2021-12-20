*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Page_objects/product_resource.robot
Resource    ../Page_objects/GenericData.robot
Resource    ../Page_objects/Cart_Page_resources.robot

Test Setup    User navigates to initiate the browser session
Test Teardown    CLose Browwer Session



*** Variables ***
${Test_expected_title}      ProtoCommerce

@{Expected_Products}    iphone X    Samsung Note 8  Nokia Edge  Blackberry

@{Required_Products}    iphone X    Samsung Note 8  Nokia Edge




*** Test Cases ***
TC 1: User searches for the relevant products and validates the product titles and price is displayed
    [Tags]    SMOKE
    Given user validates the title of the page    ${Test_expected_title}
    When User validates the list of all the products in the product list page as per the expectation    @{Expected_Products}
    Then User validates the price is displayed for all the products

TC 2: User Add required products into the cart
    Given user validates the title of the page    ${Test_expected_title}
    sleep    5
    When User adds the required product in the cart     @{Required_Products}
    Then User validates that all the desired products has been successfully added into the cart     @{Required_Products}

TC 3: User Validates the individual items added into the cart
    Given user validates the title of the page    ${Test_expected_title}
    sleep    5
    When User adds the required product in the cart     @{Required_Products}
    And User validates that all the desired products has been successfully added into the cart     @{Required_Products}
    And Wait Until expected element is found in the cart page
    Then User validates the price value of individual item is equal to the Total value

TC 4: User successfully purchase the desired items and validates the acknowledgement
    [Tags]    REGRESSION
    Given User adds the required product in the cart     @{Required_Products}
    When Wait Until expected element is found in the cart page
    And User proceeds with the puchase with all the items present in the cart
    And User chooses his country for purchase   Indonesia
    Then User purchase the product successfully and validates the acknowledgement of the purchase


*** Keywords ***

