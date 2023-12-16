*** Settings ***
Documentation    Realtime Research Page Keywords
Library          SeleniumLibrary    run_on_failure=Capture Screenshot
Resource         driver_actions.robot
Variables        ../Locators/checkout_two_page_locators.py

*** Keywords ***
Verify the user is on Checkout Two page
    Verify Element Is Visible   ${checkout_title}
    ${checkout_page_url}=   Get Location
    Verify Text Should Be Equal  ${checkout_two_page}   ${checkout_page_url}

Click on Cancel button on checkout page 2
    driver_actions.Scroll WebElement to Bottom
    VERIFY ELEMENT IS VISIBLE  ${cancel}
    Click WebElement  ${cancel}

Click on Finish button on checkout page 2
    driver_actions.Scroll WebElement to Bottom
    VERIFY ELEMENT IS VISIBLE  ${finish}
    Click WebElement  ${finish}

