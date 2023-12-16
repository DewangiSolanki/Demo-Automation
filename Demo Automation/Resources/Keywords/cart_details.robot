*** Settings ***
Documentation    Organizations Page Keywords
Library          SeleniumLibrary    run_on_failure=Capture Screenshot
Resource         driver_actions.robot
Variables        ../Locators/Cart_Details.py

*** Keywords ***
Click on Cart Icon
    Click WebElement  ${count_on_cart_icon}

Verify Cart Detail Page Is Displayed
    ${cart_details}=   Get Location
    Verify Text Should Be Equal  ${cart_detail}   ${cart_details}

Verify Product Name
    ${product_name}     get text    ${product_name}
    ${selected_product}     get text     ${product_sauce_lab_bagpack}
    Verify Text Should Be Equal     ${product_name}     ${selected_product}

Verify Product Quantity
     ${quantity}    get text    ${cart_quantity}
     ${count}   get text    ${count_on_cart_icon}
     Verify Text Should Be Equal    ${quantity}     ${count}

Remove product from cart from product list from cart details page
    Click WebElement    ${remove}
    ${count}    get text    ${count_on_cart_icon}
    Verify Text Should Be Equal  ${count}   ${null}

Continue Shopping
    Click WebElement    ${continue_shopping}

Checkout
    Click WebElement    ${checkout_button}

