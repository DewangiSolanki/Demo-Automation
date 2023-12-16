*** Settings ***
Documentation    Offers Dashboard Page Keywords
Library             SeleniumLibrary    run_on_failure=Capture Screenshot
Resource         driver_actions.robot
Variables        ../Locators/Product_Detail_Page_Locators.py


*** Keywords ***
Add product to cart from product detail page
    Click WebElement    ${add_to_cart_product_detail}
    ${count}    get text    ${cart_icon_prodcut_detail}
    Verify Text Should Be Equal  ${count}   1

Remove product from cart from product detail page
    Click WebElement    ${remove}
    ${count}    get text    ${count_on_cart_icon}
    Verify Text Should Be Equal  ${count}   ${null}

