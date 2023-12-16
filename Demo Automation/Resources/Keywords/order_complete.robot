*** Settings ***
Documentation    Realtime Research Page Keywords
Library          SeleniumLibrary    run_on_failure=Capture Screenshot
Resource         driver_actions.robot
Variables        ../Locators/checkout_two_page_locators.py
Variables        ../Locators/checkout_two_page_locators.py
Variables        ../Locators/Order_Complete_Locators.py

*** Keywords ***
Verify the user is on Order Complete Page

    ${order_complete}=   Get Location
    Verify Text Should Be Equal  ${complete_order_url}   ${order_complete}
    VERIFY ELEMENT IS VISIBLE  ${complete_order_message}

Click on Finish
    VERIFY ELEMENT IS VISIBLE  ${finish}
    Click WebElement    ${finish}



