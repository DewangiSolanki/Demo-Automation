*** Settings ***
Force Tags          LOGIN_SUITE
Documentation       Test Suite for Login Test cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/login_page.robot
Resource            ../Resources/Keywords/cart_details.robot
Variables           ../TestData/TestData.py
Suite Setup         Launch Application
Suite Teardown      Close Browser Window


*** Test Cases ***
Verify that user when clicks on cart icon, can see cart details
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Verify Product Name
    Verify Product Quantity
    Navigte back
    Remove product from cart from product list
    Click on Logout button

Verify that user can remove a product from cart from Cart details page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Remove product from cart from product list from cart details page
    Navigte back
    Click on Logout button

Verify that user can is taken to product list when clicks on "Continue Shopping" on Cart details page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Continue Shopping
    Verify Home Page Is Displayed

Verify that user is taken to checkout page when clicks on "Checkout" button on Cart details page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on Cart Icon
    Verify Cart Detail Page Is Displayed
    Checkout
    Verify the user is on Checkout page
