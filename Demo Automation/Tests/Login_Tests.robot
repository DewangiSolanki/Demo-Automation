*** Settings ***
Force Tags          LOGIN_SUITE
Documentation       Test Suite for Login Test cases
Resource            ../Resources/Keywords/common.robot
Resource            ../Resources/Keywords/login_page.robot
Resource            ../Resources/Keywords/product_list.robot
Resource            ../Resources/Keywords/product_detail_page.robot
Variables           ../TestData/TestData.py
Suite Setup         Launch Application
Suite Teardown      Close Browser Window



*** Test Cases ***
Verify Successful Login with Valid Credentials for User
    Login To Application    ${username1}     ${password1}
    Wait Until Element Is Visible   ${homepage_product_title}
    Verify Home Page Is Displayed
    Click on Logout button

Verify Unsuccessful Login with invalid username and invalid password for User
    Login To Application    ${invalid_username}     ${invalid_password}
    Verify Error Message Displayed For Invalid Login


Verify Unsuccessful Login with invalid username and valid password for User
    Login To Application    ${invalid_username}     ${password1}
    Verify Error Message Displayed For Invalid Login


Verify Unsuccessful Login with valid username and invalid password for User
    Login To Application    ${username1}     ${invalid_password}
    Verify Error Message Displayed For Invalid Login

Verify Unsuccessful Login with empty username and empty password for User
    Login To Application    ${EMPTY}     ${EMPTY}
    Verify Error Message Displayed For Empty Credentials


Verify that user get error message when password is empty
    Login To Application    ${username1}     ${EMPTY}
    Verify Error Message Displayed For Empty Password


Verify that locked_out user get error message when trying to login
    Login To Application    ${locked_username}     ${password1}
    Verify Error Message Displayed For Locked User

Verify Unsuccessful Login with valid username with leading space and valid password for User
     ${username}=    catenate   ${EMPTY}    ${username1}
    Login To Application    ${username}     ${password1}
    Verify Error Message Displayed For Invalid Login

Verify Unsuccessful Login with valid username with trailing space and valid password for User
    ${username}=    catenate    ${username1}   ${EMPTY}
    Login To Application   ${username}  ${password1}
    Verify Error Message Displayed For Invalid Login

Verify Unsuccessful Login with valid username and valid password with leading space for User
    ${password}=    catenate  ${EMPTY}  ${password1}
    Login To Application    ${username1}     ${password}
    Verify Error Message Displayed For Invalid Login

Verify Unsuccessful Login with valid username and valid password with trailing space for User
    ${password}=    catenate  ${password1}  ${EMPTY}
    Login To Application    ${username1}     ${password}
    Verify Error Message Displayed For Invalid Login




