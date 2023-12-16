*** Settings ***
Force Tags          CHECKOUT_OVERVIEW_SUITE
Documentation       Test Suite for checkout overview cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/login_page.robot
Resource            ../Resources/Keywords/cart_details.robot
Resource            ../Resources/Keywords/checkout_one_page.robot
Resource            ../Resources/Keywords/checkout_two_page.robot
Resource            ../Resources/Keywords/order_complete.robot
Variables           ../TestData/TestData.py
Test Setup         Launch Application
Test Teardown      Close Browser Window


*** Test Cases ***

Verify that user is taken to Product List page when user clicks on "Cancel" button on checkout page 2.
   Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Checkout
    Provide first name
    Provide last name
    Provide zip
    Click on continue button
    Click on Cancel button on checkout page 2
    Verify Home Page Is Displayed


Verify that user is taken to Order Complete page when user clicks on "Finish" button on Order complete.
   Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Checkout
    Provide first name
    Provide last name
    Provide zip
    Click on continue button
    Click on Finish button on checkout page 2
    Verify the user is on Order Complete Page



Verify the error message for empty firstname on checkout page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Checkout
    Click on continue button
    Check error message for empty firstname

Verify the error message for empty lastname on checkout page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Checkout
    Provide first name
    Click on continue button
    Check error message for empty lastname


Verify the error message for zip code on checkout page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Checkout
    Provide first name
    Provide last name
    Click on continue button
    Check error message for empty zip

