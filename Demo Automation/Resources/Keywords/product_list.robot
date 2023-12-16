## All products list

*** Settings ***
Documentation    Home Page Keywords
Library             SeleniumLibrary    run_on_failure=Capture Screenshot
Resource         driver_actions.robot
Variables        ../Locators/Product_List_Page_Locators.py

*** Keywords ***
Verify Home Page Is Displayed
     Verify Element Is Visible    ${homepage_product_title}

Click on profile menu button
    Click WebElement  ${menu_button}

Verify menu options
    Click on profile menu button
    Verify Element Is Visible   ${all_items}
    Verify Element Is Visible   ${about}
    Verify Element Is Visible   ${logout}
    Verify Element Is Visible   ${reset_app_state}

Click on About menu and Verify the navigtion
    Click on profile menu button
    Click WebElement  ${about}
    ${about}=   Get Location
    Verify Text Should Be Equal  ${about}   ${about_page}

Click on All items menu and Verify the navigtion
    Click on profile menu button
    Click WebElement  ${all_items}
    ${all_items_page}=   Get Location
    Verify Text Should Be Equal  ${all_items_page1}   ${all_items_page}

Click on Logout button
    Click on profile menu button
    Click WebElement  ${logout}


Click on a product and verify the navigtion
    Click WebElement  ${product_sauce_lab_bagpack}
    ${product_detail}=   Get Location
    Verify Text Should Be Equal  ${product_detail}   ${detail_sauce_lab_bagpack}


Add product to cart
    Click WebElement    ${add_to_cart}
    ${count}    get text    ${cart_icon}
    Verify Text Should Be Equal  ${count}   1

Remove product from cart from product list
    Click WebElement    ${remove}
    ${count}    get text    ${count_on_cart_icon}
    Verify Text Should Be Equal  ${count}   ${null}
