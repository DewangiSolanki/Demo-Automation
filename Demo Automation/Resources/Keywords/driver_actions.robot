*** Settings ***
Documentation    Suite description
Library             SeleniumLibrary    run_on_failure=Capture Screenshot
Library             String
Library             DateTime
Library             OperatingSystem
Library             Collections

*** Keywords ***

Scroll WebElement to Bottom
    Scroll WebPage To Bottom

#Eg. click webelement   <locator>
Click WebElement
    [Arguments]     ${webelement_locator}
    Scroll WebElement Into View    ${webelement_locator}
    Wait Until Element Is Enabled   ${webelement_locator}
    ${status} 	${value} =	 Run Keyword And Ignore Error	Click Element   ${webelement_locator}
    # Scroll and try click again if ElementClickInterceptedException occurs
	${result}=  Run Keyword And Return Status   Should Contain  ${value}   ElementClickInterceptedException
	Run Keyword If  ${result}	Run Keywords    Execute JavaScript   window.scrollBy(0, 200)
    ...    AND      Click Element   ${webelement_locator}

#Eg. click webelement if visible   <locator>
Click WebElement If Visible
    [Arguments]     ${webelement_locator}
    Wait Until Element is Visible   ${webelement_locator}
    Click Element   ${webelement_locator}

Set Text
    [Arguments]     ${webelement_locator}  ${text}
    Scroll WebElement Into View   ${webelement_locator}
    Wait Until Element is Visible  ${webelement_locator}
    Input Text      ${webelement_locator}      ${text}

#Eg. Scroll webelement into view   <locator>
Scroll WebElement Into View
    [Arguments]     ${webelement_locator}
    Scroll Element Into View    ${webelement_locator}
    #Execute JavaScript    window.scrollBy(0, 50)

#Scroll WebElement to Bottom
##    [Arguments]     ${webelement_locator}
#    Scroll WebPage To Bottom


Capture Screenshot
    ${screenshot_dir} =  Set Screenshot Directory    ../Results/Screenshots
    ${time} =   Get Current Date
    ${file_name} =    Catenate   screenshot_    ${time}   .png
    Capture Page Screenshot     ${file_name.replace(' ', '').replace(':', '-')}


Verify Element Is Visible
    [Arguments]     ${webelement_locator}
    Wait Until Element is Visible   ${webelement_locator}
    Element Should Be Visible  ${webelement_locator}

Scroll Webpage to Top
    Scroll Webpage to Top

Verify Element Is Enabled
    [Arguments]     ${webelement_locator}
    Wait Until Element is Visible   ${webelement_locator}
    Element Should Be Enabled   ${webelement_locator}

#Eg. Verify Element Has Exact Text   <locator>   <text_expected>
Verify Element Has Exact Text
    [Arguments]     ${webelement_locator}   ${text_expected}
    Wait Until Element is Visible   ${webelement_locator}
    Element Text Should Be  ${webelement_locator}   ${text_expected}

#Fails if text1 and text2 are not equal
Verify Text Should Be Equal
    [Arguments]     ${text_val1}    ${text_val2}
    ${flag} =   run keyword if  $text_val1==$text_val2  set variable  true
    run keyword if  '${flag}'=='false'  Fail  Text ${text_val1} should be equal to ${text_val2}

Scroll WebPage To Bottom
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Clear Text Field
    [Arguments]     ${webelement_locator}
    Click WebElement   ${webelement_locator}
    Press Keys   ${webelement_locator}   CTRL+a+DELETE

#Eg. Verify Element Is Not Visible  <locator>
Verify Element Is Not Visible
    [Arguments]     ${webelement_locator}
    #Wait Until Element Is Not Visible   ${webelement_locator}
    Element Should Not Be Visible  ${webelement_locator}


#Eg. Get Element Into View  <locator>
#Eg. Get Element Into View  <webelement>  False
# <is_locator> should be false only if webelement object is passed instead of locator expression
Get Element Into View
    [Arguments]     ${locator}   ${is_locator}=True
    ${locator} =    Run Keyword And Return If   ${is_locator}   Get WebElement  ${locator}
    Execute JavaScript    arguments[0].scrollIntoView(true);   ARGUMENTS   ${locator}


#Eg. Click WebElement By Javascript   <locator>
Click WebElement By Javascript
    [Arguments]     ${webelement_locator}
    ${element} =   Get WebElement  ${webelement_locator}
    Scroll WebElement Into View    ${webelement_locator}
    Wait Until Element Is Enabled   ${webelement_locator}
    Execute JavaScript    arguments[0].click();     ARGUMENTS   ${element}

