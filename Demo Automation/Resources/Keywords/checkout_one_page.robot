*** Settings ***
Documentation    Realtime Research Page Keywords
Library          SeleniumLibrary    run_on_failure=Capture Screenshot
Resource         driver_actions.robot
Variables           ../TestData/TestData.py
Variables        ../Locators/checkout_one_page_locators.py

*** Keywords ***
Verify the user is on Checkout page
    Verify Element Is Visible   ${checkout_your_information}
    ${checkout_page_url}=   Get Location
    Verify Text Should Be Equal  ${checkout_page}   ${checkout_page_url}

Click on Cancel button
    driver_actions.Scroll WebElement to Bottom
    VERIFY ELEMENT IS VISIBLE  ${cancel}
    Click WebElement  ${cancel}

Click on continue button
    driver_actions.Scroll WebElement to Bottom
    VERIFY ELEMENT IS VISIBLE  ${continue_button}
    Click WebElement  ${continue_button}

Check error message for empty firstname
    Verify Element Is Visible   ${error_message_empty_firstname}

Check error message for empty lastname
    Verify Element Is Visible   ${error_message_empty_lastname}

Check error message for empty zip
    Verify Element Is Visible   ${error_message_empty_zipcode}

Provide first name
    Set Text    ${firstname_textbox}   ${first_name}

Provide last name
    Set Text    ${lastname_textbox}   ${last_name}

Provide zip
    Set Text    ${zip_textbox}     ${zip_code}

Click on profile menu button
    Click WebElement  ${menu_button}

Click on All items menu and Verify the navigtion from Checkout Your Information
    Click on profile menu button
    Click WebElement  ${all_items}
    ${all_items_page}=   Get Location
    Verify Text Should Be Equal  ${all_items_page2}   ${all_items_page}


