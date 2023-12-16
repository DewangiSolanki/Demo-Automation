## Product Detail Page

*** Settings ***
Force Tags          PRODUCT_DETAIL_SUITE
Documentation       Test Suite for Product Detail cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/login_page.robot
Resource            ../Resources/Keywords/product_detail_page.robot
Variables           ../TestData/TestData.py
Test Setup         Launch Application
Test Teardown      Close Browser Window

*** Test Cases ***

Verify that a product can be added to cart from product detail page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Navigte back
    Click on Logout button

Verify that user can remove a product from cart from Product detail page
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Remove product from cart from product detail page
    Navigte back
    Click on Logout button

Verify that user can go to "Product List" page from "Product Detail" page by clicking on "All Items" in hamburger menu
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Click on a product and verify the navigtion
    Add product to cart
    Click on All items menu and Verify the navigtion
    Click on Logout button
