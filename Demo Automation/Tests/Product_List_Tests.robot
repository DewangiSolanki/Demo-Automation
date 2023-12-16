## All products list

*** Settings ***
Force Tags          PRODUCT_LIST_SUITE
Documentation       Test Suite for Product list cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/login_page.robot
Resource            ../Resources/Keywords/media_dashboard_page.robot
Variables           ../TestData/TestData.py
Test Setup         Launch Application
Test Teardown      Close Browser Window


*** Test Cases ***
Verify Hamburger menu options
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Verify menu options
    Click on Logout button

Verify user is taken to a About page when clicks on About option in hamburger menu
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on About menu and Verify the navigtion
    Navigte back
    Click on Logout button

Verify user is taken to a Product detail page when clicks on a product
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Navigte back
    Click on Logout button

Verify that a product can be added to cart from product list
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Add product to cart
    Click on Logout button

Verify that user can remove a product from cart from Product detail page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Add product to cart
    Remove product from cart from product list
    Click on Logout button

