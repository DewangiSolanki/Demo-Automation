*** Settings ***
Library             String
Library             DateTime
Resource            driver_actions.robot
Variables           ../../Config/Config.py
Variables           ../Locators/Login_Page_Locators.py

*** Keywords ***
Launch Application
    ${is_headless} =  Run Keyword And Return Status   Should Contain  ${browser}   headless
    ${is_browser_ff} =  Run Keyword And Return Status   Should Contain  ${browser}   firefox
    Run Keyword If  ${is_browser_ff}   Open Browser  ${url}  ${browser}
    ...    ELSE  Run Keywords  Set Chrome Browser Preferences  ${is_headless}
    ...    AND   Go To   ${url}
    Set Browser Window Size  ${browser_height}   ${browser_width}   ${is_headless}
    Set Selenium Implicit Wait  ${implicit_wait}
    Set Selenium Speed  ${selenium_speed} seconds
    Set Selenium Timeout   ${timeout}

Close Browser Window
    Close Browser

Login To Application
    [Arguments]    ${username1}  ${password1}
    Set Text    ${username_textbox}   ${username1}
    Set Text    ${password_textbox}   ${password1}
    Click WebElement   ${login_button}

Navigte back
    Execute Javascript  history.back()

Set Browser Window Size
    [Arguments]    ${height}    ${width}    ${is_headless}=True
    Run Keyword If  ${is_headless}   Set Window Size   ${height}   ${width}
    Maximize Browser Window

Scroll WebElement to Bottom
    Scroll WebPage To Bottom

Scroll WebElement to Top
    Scroll Webpage to Top

