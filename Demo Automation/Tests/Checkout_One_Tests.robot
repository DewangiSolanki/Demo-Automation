*** Settings ***
Force Tags          CHECKOUT_YOUR_INFORMATION_SUITE
Documentation       Test Suite for checkout you information cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/login_page.robot
Resource            ../Resources/Keywords/cart_details.robot
Resource            ../Resources/Keywords/checkout_one_page.robot
Resource            ../Resources/Keywords/checkout_two_page.robot
Variables           ../TestData/TestData.py
Test Setup         Launch Application
Test Teardown      Close Browser Window


*** Test Cases ***

Verify that user is taken to Cart details page when user clicks on "Cancel" button on checkout page.
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Checkout
    Click on Cancel button
    Verify Cart Detail Page Is Displayed

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


Verify the user proceeds to checkout step 2 when required details in checkout step 1 is given
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Checkout
    Provide first name
    Provide last name
    Provide zip
    Click on continue button
    Verify the user is on Checkout Two page

Verify that user can cgo to "Product List" page from "Checkout :Your information" page by clicking on "All Items" in hamburger menu
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Checkout
    Click on All items menu and Verify the navigtion from Checkout Your Information

