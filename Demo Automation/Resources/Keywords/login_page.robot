*** Settings ***
Documentation    Login Page Keywords
Resource         driver_actions.robot
Resource         common.robot
Resource         product_list.robot
Library          SeleniumLibrary    run_on_failure=Capture Screenshot
Variables        ../Locators/Login_Page_Locators.py

*** Keywords ***
Valid Login
    [Arguments]  ${username}    ${password}
    Login To Application    ${username}  ${password}
    Verify Home Page Is Displayed
    Logout From Application

Invalid Login
    [Arguments]  ${username}    ${password}
    Login To Application    ${username}  ${password}
    Verify Error Message Displayed For Invalid Login

Verify Error Message Displayed For Invalid Login
    Verify Element Is Visible   ${error_message}

Verify Error Message Displayed For Empty Credentials
    Verify Element Is Visible   ${error_message_empty_credentials}

Verify Error Message Displayed For Empty Password
    Verify Element Is Visible  ${error_message_empty_password}

Verify Error Message Displayed For Locked User
    Verify Element Is Visible  ${error_message_for_locked_user}

Error Message
    log    Login Failed due to invalid credentials
